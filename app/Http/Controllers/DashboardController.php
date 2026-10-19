<?php

namespace App\Http\Controllers;

use App\Models\Ingredient;
use App\Models\Order;
use App\Services\ReportService;
use Illuminate\Support\Carbon;

class DashboardController extends Controller
{
    public function index(ReportService $reports)
    {
        $user = auth()->user();
        $today = Carbon::today();

        $data = [
            'todaySales' => $reports->salesBetween($today->copy()->startOfDay(), $today->copy()->endOfDay()),
            'monthSales' => $reports->salesBetween($today->copy()->startOfMonth(), $today->copy()->endOfMonth()),
            'activeOrders' => Order::activeKitchen()->count(),
            'lowStockCount' => Ingredient::lowStock()->where('is_active', true)->count(),
            'recentOrders' => Order::with('user')->latest()->take(8)->get(),
            'series' => $reports->dailySalesSeries($today->copy()->subDays(13), $today->copy()),
            'bestSellers' => $reports->bestSellers($today->copy()->startOfMonth(), $today->copy()->endOfMonth(), 5),
        ];

        return view('dashboard', $data);
    }
}
