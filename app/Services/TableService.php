<?php

namespace App\Services;

use App\Models\Order;
use App\Models\Table;
use Illuminate\Support\Facades\DB;

/**
 * إدارة الطاولات: فتح الطاولة، إضافة الطلبات، وتسوية الحساب عند مغادرة العميل.
 */
class TableService
{
    public function __construct(
        protected AccountingService $accounting,
    ) {
    }

    /** تعيين طاولة لطلب جديد وتغيير حالتها إلى مشغولة. */
    public function assignToOrder(Table $table, Order $order): void
    {
        $order->update(['table_id' => $table->id]);
        $table->update(['status' => Table::STATUS_OCCUPIED]);
    }

    /**
     * تسوية كل الطلبات المفتوحة على الطاولة:
     *  - وضع علامة "تم التسليم" على الطلبات النشطة
     *  - تسجيل الدخل المحاسبي للطلبات غير المسجّلة بعد
     *  - إعادة الطاولة لحالة "فارغة"
     *
     * @return array{orders: int, total: float}
     */
    public function settle(Table $table, string $paymentMethod = 'cash'): array
    {
        return DB::transaction(function () use ($table, $paymentMethod) {
            $activeOrders = $table->activeOrders()->get();

            $total = 0;
            foreach ($activeOrders as $order) {
                // تحديث طريقة الدفع وتأكيد الدفع إذا لم تكن مؤكدة
                if (! $order->is_paid) {
                    $order->is_paid = true;
                    $order->payment_method = $paymentMethod;
                    $this->accounting->recordSale($order);
                }

                $order->status = Order::STATUS_DELIVERED;
                $order->delivered_at ??= now();
                $order->save();

                $total += (float) $order->total;
            }

            // تحرير الطاولة
            $table->update(['status' => Table::STATUS_AVAILABLE]);

            return ['orders' => $activeOrders->count(), 'total' => round($total, 2)];
        });
    }

    /** إلغاء جميع الطلبات المفتوحة على الطاولة وتحريرها. */
    public function clear(Table $table): void
    {
        DB::transaction(function () use ($table) {
            $table->activeOrders()->update([
                'status' => Order::STATUS_CANCELLED,
                'cancelled_at' => now(),
            ]);
            $table->update(['status' => Table::STATUS_AVAILABLE]);
        });
    }

    /** إعادة حساب حالة الطاولة من الطلبات الفعلية (للتزامن). */
    public function syncStatus(Table $table): void
    {
        $hasActive = $table->activeOrders()->exists();
        $table->update(['status' => $hasActive ? Table::STATUS_OCCUPIED : Table::STATUS_AVAILABLE]);
    }
}
