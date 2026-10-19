<?php

namespace App\Http\Controllers;

use App\Services\ReportService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class ReportController extends Controller
{
    public function __construct(protected ReportService $reports)
    {
    }

    protected function range(Request $request): array
    {
        $from = $request->filled('from') ? Carbon::parse($request->get('from'))->startOfDay() : Carbon::now()->startOfMonth();
        $to = $request->filled('to') ? Carbon::parse($request->get('to'))->endOfDay() : Carbon::now()->endOfDay();

        return [$from, $to];
    }

    public function index(Request $request)
    {
        [$from, $to] = $this->range($request);

        return view('reports.index', [
            'from' => $from,
            'to' => $to,
            'sales' => $this->reports->salesBetween($from, $to),
            'expenses' => $this->reports->expensesBetween($from, $to),
            'series' => $this->reports->dailySalesSeries($from, $to),
            'bestSellers' => $this->reports->bestSellers($from, $to),
            'byCashier' => $this->reports->salesByCashier($from, $to),
            'prep' => $this->reports->prepAnalytics($from, $to),
        ]);
    }

    public function sales(Request $request)
    {
        [$from, $to] = $this->range($request);

        return view('reports.sales', [
            'from' => $from, 'to' => $to,
            'sales' => $this->reports->salesBetween($from, $to),
            'series' => $this->reports->dailySalesSeries($from, $to),
            'byCashier' => $this->reports->salesByCashier($from, $to),
            'bestSellers' => $this->reports->bestSellers($from, $to),
        ]);
    }

    public function inventory(Request $request)
    {
        [$from, $to] = $this->range($request);

        return view('reports.inventory', [
            'from' => $from, 'to' => $to,
            'consumption' => $this->reports->inventoryConsumption($from, $to),
        ]);
    }

    public function profit(Request $request)
    {
        [$from, $to] = $this->range($request);

        return view('reports.profit', [
            'from' => $from, 'to' => $to,
            'sales' => $this->reports->salesBetween($from, $to),
            'expenses' => $this->reports->expensesBetween($from, $to),
            'mostProfitable' => $this->reports->mostProfitable($from, $to),
        ]);
    }

    public function export(string $type, Request $request)
    {
        [$from, $to] = $this->range($request);

        $data = [
            'from' => $from,
            'to' => $to,
            'sales' => $this->reports->salesBetween($from, $to),
            'expenses' => $this->reports->expensesBetween($from, $to),
            'bestSellers' => $this->reports->bestSellers($from, $to),
            'byCashier' => $this->reports->salesByCashier($from, $to),
            'consumption' => $this->reports->inventoryConsumption($from, $to),
            'type' => $type,
        ];

        $pdf = Pdf::loadView('reports.pdf', $data)->setPaper('a4');

        return $pdf->download("report-{$type}-" . now()->format('Ymd') . '.pdf');
    }
}
