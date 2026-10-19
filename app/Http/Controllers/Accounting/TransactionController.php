<?php

namespace App\Http\Controllers\Accounting;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Services\ReportService;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class TransactionController extends Controller
{
    public function index(ReportService $reports, Request $request)
    {
        $from = $request->filled('from') ? Carbon::parse($request->get('from'))->startOfDay() : Carbon::now()->startOfMonth();
        $to = $request->filled('to') ? Carbon::parse($request->get('to'))->endOfDay() : Carbon::now()->endOfMonth();

        $income = (float) Transaction::income()->whereBetween('occurred_at', [$from, $to])->sum('amount');
        $expense = (float) Transaction::expense()->whereBetween('occurred_at', [$from, $to])->sum('amount');

        $byCategory = Transaction::expense()
            ->whereBetween('occurred_at', [$from, $to])
            ->selectRaw('category, SUM(amount) as total')
            ->groupBy('category')
            ->orderByDesc('total')
            ->get();

        $series = $reports->dailySalesSeries($from, $to);

        return view('accounting.index', [
            'income' => $income,
            'expense' => $expense,
            'profit' => round($income - $expense, 2),
            'byCategory' => $byCategory,
            'from' => $from,
            'to' => $to,
            'series' => $series,
        ]);
    }

    public function list(Request $request)
    {
        $query = Transaction::with('user')->latest('occurred_at');

        if ($request->filled('type')) {
            $query->where('type', $request->get('type'));
        }
        if ($request->filled('from')) {
            $query->whereDate('occurred_at', '>=', $request->date('from'));
        }
        if ($request->filled('to')) {
            $query->whereDate('occurred_at', '<=', $request->date('to'));
        }

        $transactions = $query->paginate(30)->withQueryString();

        return view('accounting.transactions', compact('transactions'));
    }
}
