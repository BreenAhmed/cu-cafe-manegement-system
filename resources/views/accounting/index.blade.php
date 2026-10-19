@extends('layouts.app')
@section('title', 'المحاسبة')

@section('content')
<div class="space-y-6">
    <form method="GET" class="card p-4 flex flex-wrap gap-3 items-end">
        <div><label class="block text-xs text-slate-500 mb-1">من</label><input type="date" name="from" value="{{ $from->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <div><label class="block text-xs text-slate-500 mb-1">إلى</label><input type="date" name="to" value="{{ $to->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">عرض</button>
        <a href="{{ route('accounting.transactions') }}" class="px-5 py-2 bg-slate-100 rounded-xl">سجل الحركات</a>
    </form>

    <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <x-stat label="إجمالي الدخل" :value="money($income)" icon="money" color="brand" />
        <x-stat label="إجمالي المصروفات" :value="money($expense)" icon="money" color="melon" />
        <x-stat label="صافي الربح" :value="money($profit)" icon="chart" :color="$profit >= 0 ? 'violet' : 'melon'" />
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="card p-6 lg:col-span-2">
            <h3 class="font-bold text-slate-700 mb-4">المبيعات اليومية</h3>
            <canvas id="accChart" height="110"></canvas>
        </div>
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-4">المصروفات حسب الفئة</h3>
            <div class="space-y-3">
                @forelse ($byCategory as $cat)
                    <div class="flex justify-between text-sm">
                        <span class="text-slate-600">{{ str_replace('expense:', '', $cat->category) }}</span>
                        <span class="font-bold">{{ money($cat->total) }}</span>
                    </div>
                @empty
                    <p class="text-slate-400 text-sm text-center py-6">لا توجد مصروفات</p>
                @endforelse
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', () => {
    new Chart(document.getElementById('accChart'), {
        type: 'bar',
        data: { labels: @json($series['labels']), datasets: [{ label: 'المبيعات', data: @json($series['net']), backgroundColor: '#16a34a', borderRadius: 6 }] },
        options: { plugins: { legend: { labels: { font: { family: 'Cairo' } } } }, scales: { x: { ticks: { font: { family: 'Cairo' } } }, y: { ticks: { font: { family: 'Cairo' } } } } }
    });
});
</script>
@endpush
