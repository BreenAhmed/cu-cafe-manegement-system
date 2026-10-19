<?php

namespace App\Services;

use App\Events\OrderCreated;
use App\Events\OrderStatusUpdated;
use App\Models\Item;
use App\Models\Order;
use App\Models\Shift;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

/**
 * محرك الطلبات: إنشاء الطلب، تطبيق محرك الخصومات، خصم المخزون، والمزامنة المحاسبية.
 */
class OrderService
{
    public function __construct(
        protected InventoryService $inventory,
        protected AccountingService $accounting,
        protected NotificationService $notifications,
    ) {
    }

    /**
     * إنشاء طلب جديد من بيانات الكاشير.
     *
     * هيكل $data:
     *  - type, customer_name, payment_method, is_paid, notes
     *  - discount: ['type' => percent|fixed, 'value' => float]
     *  - items: [['item_id', 'quantity', 'notes', 'discount' => ['type','value']]]
     */
    public function create(array $data, User $cashier): Order
    {
        if (empty($data['items'])) {
            throw ValidationException::withMessages(['items' => 'يجب إضافة صنف واحد على الأقل للطلب.']);
        }

        // ── إذا كانت هناك طاولة فعّالة بطلب غير مسدَّد، أضف الأصناف له ──
        // (الطلب قد يكون بأي حالة: جديد / قيد التحضير / جاهز / تم التسليم)
        // ما يهم هو أنه لم يُدفَع بعد، أي الحساب لا يزال مفتوحاً على الطاولة.
        if (! empty($data['table_id'])) {
            $existing = Order::where('table_id', $data['table_id'])
                ->where('is_paid', false)
                ->where('status', '!=', Order::STATUS_CANCELLED)
                ->latest()
                ->first();

            if ($existing) {
                return $this->appendItems($existing, $data['items'], $cashier);
            }
        }

        $order = DB::transaction(function () use ($data, $cashier) {
            $shift = $cashier->activeShift()->first();

            $order = new Order([
                'order_number' => $this->nextOrderNumber(),
                'invoice_number' => $this->nextInvoiceNumber(),
                'user_id' => $cashier->id,
                'shift_id' => $shift?->id,
                'table_id' => isset($data['table_id']) ? (int) $data['table_id'] : null,
                'type' => $data['type'] ?? Order::TYPE_DINE_IN,
                'status' => Order::STATUS_NEW,
                'customer_name' => $data['customer_name'] ?? null,
                'payment_method' => $data['payment_method'] ?? 'cash',
                // عند وجود طاولة مفتوحة، لا يُدفع فوراً — الدفع عند تسوية الطاولة
                'is_paid' => isset($data['table_id']) ? false : (bool) ($data['is_paid'] ?? true),
                'notes' => $data['notes'] ?? null,
            ]);
            $order->save();

            $subtotal = 0;
            $itemDiscountTotal = 0;
            $costTotal = 0;

            foreach ($data['items'] as $line) {
                $item = Item::findOrFail($line['item_id']);
                $quantity = max(1, (int) ($line['quantity'] ?? 1));
                $unitPrice = (float) $item->price;
                $unitCost = round($item->cost, 2);
                $lineSubtotal = round($unitPrice * $quantity, 2);

                $discount = $this->resolveDiscount($line['discount'] ?? null, $lineSubtotal);

                $netTotal = round($lineSubtotal - $discount['amount'], 2);

                $order->items()->create([
                    'item_id' => $item->id,
                    'name' => $item->name,
                    'unit_price' => $unitPrice,
                    'unit_cost' => $unitCost,
                    'quantity' => $quantity,
                    'line_subtotal' => $lineSubtotal,
                    'discount_type' => $discount['type'],
                    'discount_value' => $discount['value'],
                    'discount_amount' => $discount['amount'],
                    'net_total' => $netTotal,
                    'notes' => $line['notes'] ?? null,
                ]);

                $subtotal += $lineSubtotal;
                $itemDiscountTotal += $discount['amount'];
                $costTotal += round($unitCost * $quantity, 2);
            }

            // خصم على مستوى الفاتورة يُطبّق على الصافي بعد خصومات الأصناف
            $netAfterItems = round($subtotal - $itemDiscountTotal, 2);
            $orderDiscount = $this->resolveDiscount($data['discount'] ?? null, $netAfterItems);

            $discountTotal = round($itemDiscountTotal + $orderDiscount['amount'], 2);
            $total = round($subtotal - $discountTotal, 2);

            $order->fill([
                'subtotal' => $subtotal,
                'item_discount_total' => $itemDiscountTotal,
                'discount_type' => $orderDiscount['type'],
                'discount_value' => $orderDiscount['value'],
                'order_discount_amount' => $orderDiscount['amount'],
                'discount_total' => $discountTotal,
                'total' => $total,
                'cost_total' => $costTotal,
                'profit' => round($total - $costTotal, 2),
            ])->save();

            // خصم المخزون تلقائياً حسب الوصفات
            $this->inventory->deductForOrder($order);

            // تحديث حالة الطاولة إلى "مشغولة" عند أول طلب غير مدفوع
            if ($order->table_id) {
                \App\Models\Table::where('id', $order->table_id)
                    ->where('status', \App\Models\Table::STATUS_AVAILABLE)
                    ->update(['status' => \App\Models\Table::STATUS_OCCUPIED]);
            }

            // مزامنة محاسبية: تسجيل المبيعات للطلبات المدفوعة فوراً فقط
            // (طلبات الطاولات المفتوحة تُسجَّل عند تسوية الطاولة)
            if ($order->is_paid && ! $order->table_id) {
                $this->accounting->recordSale($order);
            }

            // تحديث ملخص الوردية (فقط للطلبات المدفوعة فوراً)
            if ($shift && $order->is_paid) {
                $shift->increment('total_orders');
                $shift->increment('total_sales', $total);
            } elseif ($shift) {
                $shift->increment('total_orders');
            }

            // التحقق من انخفاض المخزون وإرسال التنبيهات
            $this->checkLowStock($order);

            return $order->fresh(['items', 'user']);
        });

        // البث خارج المعاملة حتى لا يفشل إنشاء الطلب إن كان Reverb متوقفاً
        safe_broadcast(new OrderCreated($order));

        return $order;
    }

    /**
     * إضافة أصناف جديدة لطلب موجود على طاولة مفتوحة (بدلاً من إنشاء طلب جديد).
     * هذا يضمن فاتورة واحدة لكل جلسة طاولة.
     */
    public function appendItems(Order $order, array $lines, User $cashier): Order
    {
        if (empty($lines)) {
            return $order;
        }

        $order = DB::transaction(function () use ($order, $cashier, $lines) {
            $newItems = [];

            foreach ($lines as $line) {
                $item = Item::findOrFail($line['item_id']);
                $quantity = max(1, (int) ($line['quantity'] ?? 1));
                $unitPrice = (float) $item->price;
                $unitCost  = round($item->cost, 2);
                $lineSubtotal = round($unitPrice * $quantity, 2);

                $discount = $this->resolveDiscount($line['discount'] ?? null, $lineSubtotal);
                $netTotal = round($lineSubtotal - $discount['amount'], 2);

                $orderItem = $order->items()->create([
                    'item_id'        => $item->id,
                    'name'           => $item->name,
                    'unit_price'     => $unitPrice,
                    'unit_cost'      => $unitCost,
                    'quantity'       => $quantity,
                    'line_subtotal'  => $lineSubtotal,
                    'discount_type'  => $discount['type'],
                    'discount_value' => $discount['value'],
                    'discount_amount'=> $discount['amount'],
                    'net_total'      => $netTotal,
                    'notes'          => $line['notes'] ?? null,
                ]);

                $newItems[] = ['orderItem' => $orderItem, 'menuItem' => $item];
            }

            // إعادة حساب إجماليات الطلب من الصفر
            $this->recalculateTotals($order);

            // خصم المخزون للأصناف الجديدة فقط
            foreach ($newItems as ['orderItem' => $oi, 'menuItem' => $menuItem]) {
                if (! $menuItem->track_inventory) {
                    continue;
                }
                $menuItem->load('recipeItems.ingredient');
                foreach ($menuItem->recipeItems as $recipe) {
                    $ingredient = $recipe->ingredient;
                    if (! $ingredient) {
                        continue;
                    }
                    $this->inventory->recordMovement(
                        $ingredient,
                        \App\Models\StockMovement::TYPE_SALE,
                        -1 * ($recipe->quantity * $oi->quantity),
                        (float) $ingredient->cost_per_unit,
                        $order,
                        $cashier->id,
                        "إضافة للطلب #{$order->order_number}"
                    );
                }
            }

            // التحقق من انخفاض المخزون
            $this->checkLowStock($order->fresh('items'));

            return $order->fresh(['items', 'user', 'table']);
        });

        safe_broadcast(new OrderCreated($order));

        return $order;
    }

    /**
     * إعادة حساب جميع إجماليات الطلب من أصناف order_items الحالية.
     */
    protected function recalculateTotals(Order $order): void
    {
        $order->refresh();
        $items = $order->items;

        $subtotal          = round((float) $items->sum('line_subtotal'), 2);
        $itemDiscountTotal = round((float) $items->sum('discount_amount'), 2);
        $costTotal         = round($items->sum(fn ($i) => $i->unit_cost * $i->quantity), 2);

        // إعادة تطبيق خصم الفاتورة على الصافي بعد خصومات الأصناف
        $netAfterItems = round($subtotal - $itemDiscountTotal, 2);
        $orderDiscount = $this->resolveDiscount(
            $order->discount_type ? ['type' => $order->discount_type, 'value' => $order->discount_value] : null,
            $netAfterItems
        );

        $discountTotal = round($itemDiscountTotal + $orderDiscount['amount'], 2);
        $total         = round($subtotal - $discountTotal, 2);

        $order->update([
            'subtotal'              => $subtotal,
            'item_discount_total'   => $itemDiscountTotal,
            'order_discount_amount' => $orderDiscount['amount'],
            'discount_total'        => $discountTotal,
            'total'                 => $total,
            'cost_total'            => $costTotal,
            'profit'                => round($total - $costTotal, 2),
        ]);
    }

    /**
     * محرك الخصومات: يحسب قيمة الخصم مع الحفاظ على القيم الأصلية.
     * النسبة المسموحة 5% حتى 100%. الخصم الثابت لا يتجاوز قيمة السطر.
     *
     * @return array{type: ?string, value: float, amount: float}
     */
    public function resolveDiscount(?array $discount, float $base): array
    {
        if (! $discount || empty($discount['type']) || empty($discount['value'])) {
            return ['type' => null, 'value' => 0, 'amount' => 0];
        }

        $type = $discount['type'];
        $value = (float) $discount['value'];

        if ($value <= 0 || $base <= 0) {
            return ['type' => null, 'value' => 0, 'amount' => 0];
        }

        if ($type === 'percent') {
            $value = min(max($value, 5), 100); // ضمان النطاق 5%–100%
            $amount = round($base * ($value / 100), 2);
        } else { // fixed
            $amount = round(min($value, $base), 2); // لا يتجاوز قيمة الأساس
        }

        return ['type' => $type, 'value' => $value, 'amount' => $amount];
    }

    /**
     * تحديث حالة الطلب مع تسجيل الطوابع الزمنية والبث المباشر.
     */
    public function updateStatus(Order $order, string $status): Order
    {
        if (! array_key_exists($status, Order::statuses())) {
            throw ValidationException::withMessages(['status' => 'حالة غير صالحة.']);
        }

        $order->status = $status;

        match ($status) {
            Order::STATUS_PREPARING => $order->prepared_at ??= now(),
            Order::STATUS_READY => $order->ready_at ??= now(),
            Order::STATUS_DELIVERED => $order->delivered_at ??= now(),
            default => null,
        };

        $order->save();

        safe_broadcast(new OrderStatusUpdated($order));

        return $order;
    }

    /**
     * إلغاء الطلب وعكس آثاره على المخزون والمحاسبة.
     */
    public function cancel(Order $order, ?User $user = null): Order
    {
        $order = DB::transaction(function () use ($order, $user) {
            if ($order->status === Order::STATUS_CANCELLED) {
                return $order;
            }

            $this->inventory->reverseForOrder($order);
            $this->accounting->reverseSale($order);

            if ($order->shift) {
                $order->shift->decrement('total_orders');
                $order->shift->decrement('total_sales', $order->total);
            }

            $order->update([
                'status' => Order::STATUS_CANCELLED,
                'cancelled_at' => now(),
                'is_paid' => false,
            ]);

            return $order;
        });

        safe_broadcast(new OrderStatusUpdated($order));

        return $order;
    }

    protected function checkLowStock(Order $order): void
    {
        $order->loadMissing('items.item.recipeItems.ingredient');

        $low = collect();
        foreach ($order->items as $orderItem) {
            foreach (optional($orderItem->item)->recipeItems ?? [] as $recipe) {
                if ($recipe->ingredient && $recipe->ingredient->isLowStock()) {
                    $low->push($recipe->ingredient);
                }
            }
        }

        foreach ($low->unique('id') as $ingredient) {
            $this->notifications->notifyRoles(
                ['مدير', 'مسؤول المخزن'],
                'تنبيه: مخزون منخفض',
                "المكوّن «{$ingredient->name}» وصل إلى {$ingredient->current_stock} {$ingredient->unit->abbreviation}.",
                'warning',
                route('inventory.ingredients.index'),
                'box',
            );
        }
    }

    protected function nextOrderNumber(): string
    {
        // استخدام MAX(id) + 1 لليوم لتفادي الازدواجية عند الحذف الناعم
        $todayMax = \DB::table('orders')
            ->whereDate('created_at', today())
            ->max('id') ?? 0;
        $seq = (int) \DB::table('orders')->whereDate('created_at', today())->count() + 1;
        // نضمن الفريدية باستخدام الـ seq كأساس مع محاولة تصاعدية
        $base = now()->format('Ymd');
        $candidate = $base . '-' . str_pad((string) $seq, 4, '0', STR_PAD_LEFT);

        // إذا كان الرقم محجوزاً (ازدواجية)، أضف تعداداً تصاعدياً
        while (\DB::table('orders')->where('order_number', $candidate)->exists()) {
            $seq++;
            $candidate = $base . '-' . str_pad((string) $seq, 4, '0', STR_PAD_LEFT);
        }

        return $candidate;
    }

    protected function nextInvoiceNumber(): string
    {
        return 'CU-' . now()->format('Ymd') . '-' . strtoupper(substr(uniqid(), -6));
    }
}
