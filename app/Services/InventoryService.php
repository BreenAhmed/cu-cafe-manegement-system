<?php

namespace App\Services;

use App\Models\Ingredient;
use App\Models\Order;
use App\Models\StockMovement;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

/**
 * إدارة حركة المخزون والخصم التلقائي للمكوّنات.
 */
class InventoryService
{
    /**
     * تسجيل حركة مخزون موحّدة وتحديث الرصيد الحالي للمكوّن.
     *
     * @param  float  $quantity موجب = إضافة، سالب = خصم
     */
    public function recordMovement(
        Ingredient $ingredient,
        string $type,
        float $quantity,
        float $unitCost = 0,
        ?Model $reference = null,
        ?int $userId = null,
        ?string $notes = null
    ): StockMovement {
        return DB::transaction(function () use ($ingredient, $type, $quantity, $unitCost, $reference, $userId, $notes) {
            $ingredient = Ingredient::lockForUpdate()->find($ingredient->id);

            // تحديث متوسط التكلفة المرجّح عند الشراء
            if ($type === StockMovement::TYPE_PURCHASE && $quantity > 0 && $unitCost > 0) {
                $oldValue = $ingredient->current_stock * $ingredient->cost_per_unit;
                $newValue = $quantity * $unitCost;
                $newStock = $ingredient->current_stock + $quantity;
                $ingredient->cost_per_unit = $newStock > 0
                    ? round(($oldValue + $newValue) / $newStock, 4)
                    : $unitCost;
            }

            $ingredient->current_stock = round($ingredient->current_stock + $quantity, 3);
            $ingredient->save();

            return $ingredient->stockMovements()->create([
                'type' => $type,
                'quantity' => $quantity,
                'unit_cost' => $unitCost ?: $ingredient->cost_per_unit,
                'balance_after' => $ingredient->current_stock,
                'reference_type' => $reference ? $reference->getMorphClass() : null,
                'reference_id' => $reference?->getKey(),
                'user_id' => $userId,
                'notes' => $notes,
            ]);
        });
    }

    /**
     * خصم مكوّنات الطلب تلقائياً من المخزون حسب وصفات الأصناف المباعة.
     */
    public function deductForOrder(Order $order): void
    {
        $order->loadMissing('items.item.recipeItems.ingredient');

        foreach ($order->items as $orderItem) {
            $item = $orderItem->item;
            if (! $item || ! $item->track_inventory) {
                continue;
            }

            foreach ($item->recipeItems as $recipe) {
                $ingredient = $recipe->ingredient;
                if (! $ingredient) {
                    continue;
                }

                $consumed = $recipe->quantity * $orderItem->quantity;
                $this->recordMovement(
                    $ingredient,
                    StockMovement::TYPE_SALE,
                    -1 * $consumed,
                    (float) $ingredient->cost_per_unit,
                    $order,
                    $order->user_id,
                    "بيع طلب #{$order->order_number}"
                );
            }
        }
    }

    /**
     * عكس الخصم عند إلغاء طلب (إرجاع الكميات للمخزون).
     */
    public function reverseForOrder(Order $order): void
    {
        $movements = StockMovement::where('reference_type', $order->getMorphClass())
            ->where('reference_id', $order->getKey())
            ->where('type', StockMovement::TYPE_SALE)
            ->get();

        foreach ($movements as $movement) {
            $this->recordMovement(
                $movement->ingredient,
                StockMovement::TYPE_ADJUSTMENT,
                abs($movement->quantity),
                (float) $movement->unit_cost,
                $order,
                $order->user_id,
                "إلغاء طلب #{$order->order_number} — إرجاع للمخزون"
            );
        }
    }

    public function purchase(Ingredient $ingredient, float $quantity, float $unitCost, Model $reference, int $userId): StockMovement
    {
        return $this->recordMovement($ingredient, StockMovement::TYPE_PURCHASE, abs($quantity), $unitCost, $reference, $userId, 'فاتورة شراء');
    }

    public function waste(Ingredient $ingredient, float $quantity, int $userId, ?string $notes = null): StockMovement
    {
        return $this->recordMovement($ingredient, StockMovement::TYPE_WASTE, -1 * abs($quantity), (float) $ingredient->cost_per_unit, null, $userId, $notes ?? 'تسجيل هدر');
    }

    /**
     * تسوية يدوية للرصيد إلى قيمة مستهدفة.
     */
    public function adjustTo(Ingredient $ingredient, float $targetStock, int $userId, ?string $notes = null): StockMovement
    {
        $delta = round($targetStock - $ingredient->current_stock, 3);

        return $this->recordMovement($ingredient, StockMovement::TYPE_ADJUSTMENT, $delta, (float) $ingredient->cost_per_unit, null, $userId, $notes ?? 'تسوية يدوية للمخزون');
    }
}
