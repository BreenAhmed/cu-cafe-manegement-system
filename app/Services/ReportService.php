<?php

namespace App\Services;

use App\Models\Expense;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\StockMovement;
use Carbon\CarbonInterface;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class ReportService
{
    protected function notCancelled()
    {
        return Order::query()->where('status', '!=', Order::STATUS_CANCELLED);
    }

    public function salesBetween(CarbonInterface $from, CarbonInterface $to): array
    {
        $orders = $this->notCancelled()->whereBetween('created_at', [$from, $to]);

        return [
            'orders' => (clone $orders)->count(),
            'gross' => round((clone $orders)->sum('subtotal'), 2),
            'discount' => round((clone $orders)->sum('discount_total'), 2),
            'net' => round((clone $orders)->sum('total'), 2),
            'cost' => round((clone $orders)->sum('cost_total'), 2),
            'profit' => round((clone $orders)->sum('profit'), 2),
        ];
    }

    public function expensesBetween(CarbonInterface $from, CarbonInterface $to): float
    {
        return round((float) Expense::whereBetween('spent_at', [$from->copy()->toDateString(), $to->copy()->toDateString()])->sum('amount'), 2);
    }

    /**
     * مبيعات يومية ضمن نطاق (للرسوم البيانية).
     */
    public function dailySalesSeries(CarbonInterface $from, CarbonInterface $to): array
    {
        $rows = $this->notCancelled()
            ->whereBetween('created_at', [$from->copy()->startOfDay(), $to->copy()->endOfDay()])
            ->selectRaw('DATE(created_at) as d, SUM(total) as net, SUM(profit) as profit, COUNT(*) as orders')
            ->groupBy('d')
            ->orderBy('d')
            ->get()
            ->keyBy('d');

        $labels = [];
        $net = [];
        $profit = [];
        $orders = [];

        $cursor = $from->copy()->startOfDay();
        while ($cursor->lte($to)) {
            $key = $cursor->toDateString();
            $labels[] = $cursor->translatedFormat('d M');
            $net[] = round((float) optional($rows->get($key))->net, 2);
            $profit[] = round((float) optional($rows->get($key))->profit, 2);
            $orders[] = (int) optional($rows->get($key))->orders;
            $cursor->addDay();
        }

        return compact('labels', 'net', 'profit', 'orders');
    }

    public function bestSellers(CarbonInterface $from, CarbonInterface $to, int $limit = 10): array
    {
        return OrderItem::query()
            ->whereHas('order', fn ($q) => $q->where('status', '!=', Order::STATUS_CANCELLED)->whereBetween('created_at', [$from, $to]))
            ->selectRaw('name, SUM(quantity) as qty, SUM(net_total) as revenue, SUM((unit_price - unit_cost) * quantity) as profit')
            ->groupBy('name')
            ->orderByDesc('qty')
            ->limit($limit)
            ->get()
            ->toArray();
    }

    public function mostProfitable(CarbonInterface $from, CarbonInterface $to, int $limit = 10): array
    {
        return OrderItem::query()
            ->whereHas('order', fn ($q) => $q->where('status', '!=', Order::STATUS_CANCELLED)->whereBetween('created_at', [$from, $to]))
            ->selectRaw('name, SUM((net_total - (unit_cost * quantity))) as profit, SUM(quantity) as qty')
            ->groupBy('name')
            ->orderByDesc('profit')
            ->limit($limit)
            ->get()
            ->toArray();
    }

    public function salesByCashier(CarbonInterface $from, CarbonInterface $to): array
    {
        return $this->notCancelled()
            ->whereBetween('orders.created_at', [$from, $to])
            ->join('users', 'users.id', '=', 'orders.user_id')
            ->selectRaw('users.name as cashier, COUNT(*) as orders, SUM(orders.total) as net')
            ->groupBy('users.name')
            ->orderByDesc('net')
            ->get()
            ->toArray();
    }

    public function inventoryConsumption(CarbonInterface $from, CarbonInterface $to): array
    {
        return StockMovement::query()
            ->where('stock_movements.type', StockMovement::TYPE_SALE)
            ->whereBetween('stock_movements.created_at', [$from, $to])
            ->join('ingredients', 'ingredients.id', '=', 'stock_movements.ingredient_id')
            ->selectRaw('ingredients.name as ingredient, SUM(ABS(stock_movements.quantity)) as consumed, SUM(ABS(stock_movements.quantity) * stock_movements.unit_cost) as cost')
            ->groupBy('ingredients.name')
            ->orderByDesc('consumed')
            ->get()
            ->toArray();
    }

    public function prepAnalytics(CarbonInterface $from, CarbonInterface $to): array
    {
        $avg = $this->notCancelled()
            ->whereBetween('created_at', [$from, $to])
            ->whereNotNull('ready_at')
            ->selectRaw('AVG(TIMESTAMPDIFF(MINUTE, created_at, ready_at)) as avg_minutes')
            ->value('avg_minutes');

        return ['avg_prep_minutes' => round((float) $avg, 1)];
    }
}
