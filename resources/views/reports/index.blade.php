@extends('layouts.app')
@section('title', 'التقارير والتحليلات')

@section('content')
<div class="space-y-6">
    <form method="GET" class="card p-4 flex flex-wrap gap-3 items-end">
        <div><label class="block text-xs text-slate-500 mb-1">من</label><input type="date" name="from" value="{{ $from->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <div><label class="block text-xs text-slate-500 mb-1">إلى</label><input type="date" name="to" value="{{ $to->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">عرض</button>
        <div class="ms-auto flex gap-2">
            <a href="{{ route('reports.sales', request()->query()) }}" class="px-4 py-2 bg-slate-100 rounded-xl text-sm">المبيعات</a>
            <a href="{{ route('reports.profit', request()->query()) }}" class="px-4 py-2 bg-slate-100 rounded-xl text-sm">الأرباح</a>
            <a href="{{ route('reports.inventory', request()->query()) }}" class="px-4 py-2 bg-slate-100 rounded-xl text-sm">المخزون</a>
            @can('export reports')
                <a href="{{ route('reports.export', ['type' => 'summary'] + request()->query()) }}" class="px-4 py-2 bg-brand-600 text-white rounded-xl text-sm font-semibold">تصدير PDF</a>
            @endcan
        </div>
    </form>

    <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <x-stat label="المبيعات (صافي)" :value="money($sales['net'])" icon="money" color="brand" :sub="$sales['orders'].' طلب'" />
        <x-stat label="الأرباح" :value="money($sales['profit'])" icon="chart" color="violet" />
        <x-stat label="المصروفات" :value="money($expenses)" icon="money" color="melon" />
        <x-stat label="متوسط زمن التحضير" :value="$prep['avg_prep_minutes'].' دقيقة'" icon="clock" color="amber" />
    </div>

    <div class="card p-6">
        <h3 class="font-bold text-slate-700 mb-4">منحنى المبيعات والأرباح</h3>
        <canvas id="repChart" height="90"></canvas>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-4">الأكثر مبيعاً</h3>
            <table class="w-full text-sm">
                <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">الصنف</th><th class="py-2">الكمية</th><th class="py-2">الإيراد</th></tr></thead>
                <tbody class="divide-y">
                    @forelse ($bestSellers as $b)
                        <tr><td class="py-2 font-semibold">{{ $b['name'] }}</td><td class="py-2">{{ (int)$b['qty'] }}</td><td class="py-2">{{ money($b['revenue']) }}</td></tr>
                    @empty <tr><td colspan="3" class="py-6 text-center text-slate-400">لا بيانات</td></tr> @endforelse
                </tbody>
            </table>
        </div>
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-4">المبيعات حسب الكاشير</h3>
            <table class="w-full text-sm">
                <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">الكاشير</th><th class="py-2">الطلبات</th><th class="py-2">المبيعات</th></tr></thead>
                <tbody class="divide-y">
                    @forelse ($byCashier as $c)
                        <tr><td class="py-2 font-semibold">{{ $c['cashier'] }}</td><td class="py-2">{{ (int)$c['orders'] }}</td><td class="py-2">{{ money($c['net']) }}</td></tr>
                    @empty <tr><td colspan="3" class="py-6 text-center text-slate-400">لا بيانات</td></tr> @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', () => {
    new Chart(document.getElementById('repChart'), {
        type: 'line',
        data: { labels: @json($series['labels']), datasets: [
            { label: 'المبيعات', data: @json($series['net']), borderColor: '#16a34a', backgroundColor: 'rgba(22,163,74,.1)', fill: true, tension: .35 },
            { label: 'الأرباح', data: @json($series['profit']), borderColor: '#7c3aed', fill: false, tension: .35 },
        ] },
        options: { plugins: { legend: { labels: { font: { family: 'Cairo' } } } }, scales: { x: { ticks: { font: { family: 'Cairo' } } }, y: { ticks: { font: { family: 'Cairo' } } } } }
    });
});
</script>
@endpush
