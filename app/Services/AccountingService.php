<?php

namespace App\Services;

use App\Models\Expense;
use App\Models\Order;
use App\Models\Purchase;
use App\Models\Transaction;
use Illuminate\Database\Eloquent\Model;

/**
 * المحاسبة: تسجيل الدخل والمصروفات في دفتر موحّد ومزامنته مع المبيعات.
 */
class AccountingService
{
    public function record(string $type, float $amount, string $category, ?string $description, ?Model $source, ?int $userId, $occurredAt = null): Transaction
    {
        return Transaction::create([
            'type' => $type,
            'category' => $category,
            'amount' => round($amount, 2),
            'description' => $description,
            'source_type' => $source?->getMorphClass(),
            'source_id' => $source?->getKey(),
            'user_id' => $userId,
            'occurred_at' => $occurredAt ?? now(),
        ]);
    }

    /**
     * تسجيل دخل المبيعات من طلب مدفوع. يستخدم الصافي بعد الخصم للحفاظ على سلامة الحسابات.
     */
    public function recordSale(Order $order): Transaction
    {
        // تجنّب الازدواجية
        $existing = $order->transaction()->first();
        if ($existing) {
            return $existing;
        }

        return $this->record(
            Transaction::TYPE_INCOME,
            (float) $order->total,
            'sales',
            "مبيعات طلب #{$order->order_number}",
            $order,
            $order->user_id,
            $order->created_at,
        );
    }

    public function reverseSale(Order $order): void
    {
        $order->transaction()->delete();
    }

    public function recordExpense(Expense $expense): Transaction
    {
        $existing = $expense->transaction()->first();
        if ($existing) {
            return $existing;
        }

        return $this->record(
            Transaction::TYPE_EXPENSE,
            (float) $expense->amount,
            'expense:' . optional($expense->category)->name,
            $expense->description,
            $expense,
            $expense->user_id,
            $expense->spent_at,
        );
    }

    public function recordPurchase(Purchase $purchase): Transaction
    {
        return $this->record(
            Transaction::TYPE_EXPENSE,
            (float) $purchase->total,
            'expense:purchase',
            "فاتورة شراء #{$purchase->reference}",
            $purchase,
            $purchase->user_id,
            $purchase->purchased_at,
        );
    }
}
