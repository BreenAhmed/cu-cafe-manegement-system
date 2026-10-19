<?php

namespace App\Services;

use App\Models\Order;
use App\Models\Shift;
use App\Models\User;
use Illuminate\Validation\ValidationException;

class ShiftService
{
    public function open(User $user, float $openingCash, ?string $notes = null): Shift
    {
        if ($user->activeShift()->exists()) {
            throw ValidationException::withMessages(['shift' => 'لديك وردية مفتوحة بالفعل.']);
        }

        return Shift::create([
            'user_id' => $user->id,
            'opened_at' => now(),
            'opening_cash' => $openingCash,
            'status' => Shift::STATUS_OPEN,
            'notes' => $notes,
        ]);
    }

    public function close(Shift $shift, float $closingCash, ?string $notes = null): Shift
    {
        if (! $shift->isOpen()) {
            throw ValidationException::withMessages(['shift' => 'الوردية مغلقة مسبقاً.']);
        }

        $cashSales = (float) $shift->orders()
            ->where('status', '!=', Order::STATUS_CANCELLED)
            ->where('is_paid', true)
            ->where('payment_method', 'cash')
            ->sum('total');

        $expectedCash = round($shift->opening_cash + $cashSales, 2);

        $shift->update([
            'closed_at' => now(),
            'closing_cash' => $closingCash,
            'expected_cash' => $expectedCash,
            'difference' => round($closingCash - $expectedCash, 2),
            'status' => Shift::STATUS_CLOSED,
            'notes' => $notes ? trim(($shift->notes ? $shift->notes . ' | ' : '') . $notes) : $shift->notes,
        ]);

        return $shift;
    }

    public function summary(Shift $shift): array
    {
        $orders = $shift->orders()->where('status', '!=', Order::STATUS_CANCELLED)->get();

        return [
            'orders_count' => $orders->count(),
            'total_sales' => round($orders->sum('total'), 2),
            'total_discount' => round($orders->sum('discount_total'), 2),
            'total_profit' => round($orders->sum('profit'), 2),
            'by_payment' => $orders->groupBy('payment_method')->map(fn ($g) => round($g->sum('total'), 2)),
        ];
    }
}
