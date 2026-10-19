@extends('layouts.app')
@section('title', 'تقرير المبيعات')

@section('content')
<div class="space-y-6">
    <form method="GET" class="card p-4 flex flex-wrap gap-3 items-end">
        <div><label class="block text-xs text-slate-500 mb-1">من</label><input type="date" name="from" value="{{ $from->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <div><label class="block text-xs text-slate-500 mb-1">إلى</label><input type="date" name="to" value="{{ $to->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">عرض</button>
        <a href="{{ route('reports.index', request()->query()) }}" class="px-4 py-2 bg-slate-100 rounded-xl text-sm ms-auto">رجوع</a>
    </form>

    <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <x-stat label="إجمالي المبيعات" :value="money($sales['gross'])" icon="money" color="slate" />
        <x-stat label="الخصومات" :value="money($sales['discount'])" icon="money" color="melon" />
        <x-stat label="الصافي" :value="money($sales['net'])" icon="money" color="brand" />
        <x-stat label="الأرباح" :value="money($sales['profit'])" icon="chart" color="violet" />
    </div>

    <div class="card p-6"><h3 class="font-bold text-slate-700 mb-4">المبيعات اليومية</h3><canvas id="c" height="90"></canvas></div>
</div>
@endsection
@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', () => new Chart(document.getElementById('c'), { type:'bar', data:{ labels:@json($series['labels']), datasets:[{ label:'المبيعات', data:@json($series['net']), backgroundColor:'#16a34a', borderRadius:6 }] }, options:{ plugins:{legend:{labels:{font:{family:'Cairo'}}}}, scales:{x:{ticks:{font:{family:'Cairo'}}},y:{ticks:{font:{family:'Cairo'}}}} } }));
</script>
@endpush
