@extends('layouts.app')
@section('title', 'تقرير الوردية')

@section('content')
<div class="space-y-6 max-w-4xl">
    <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
        <x-stat label="المبيعات" :value="money($summary['total_sales'])" icon="money" color="brand" />
        <x-stat label="عدد الطلبات" :value="$summary['orders_count']" icon="list" color="blue" />
        <x-stat label="الأرباح" :value="money($summary['total_profit'])" icon="chart" color="violet" />
        <x-stat label="الخصومات" :value="money($summary['total_discount'])" icon="money" color="melon" />
    </div>

    <div class="card p-6 grid grid-cols-2 sm:grid-cols-3 gap-4 text-sm">
        <div><div class="text-slate-400">الكاشير</div><div class="font-bold">{{ $shift->user?->name }}</div></div>
        <div><div class="text-slate-400">الفتح</div><div class="font-bold">{{ $shift->opened_at->format('Y-m-d H:i') }}</div></div>
        <div><div class="text-slate-400">الإغلاق</div><div class="font-bold">{{ $shift->closed_at?->format('Y-m-d H:i') ?? 'مفتوحة' }}</div></div>
        <div><div class="text-slate-400">نقدية افتتاحية</div><div class="font-bold">{{ money($shift->opening_cash) }}</div></div>
        <div><div class="text-slate-400">نقدية متوقعة</div><div class="font-bold">{{ $shift->expected_cash !== null ? money($shift->expected_cash) : '—' }}</div></div>
        <div><div class="text-slate-400">نقدية فعلية</div><div class="font-bold">{{ $shift->closing_cash !== null ? money($shift->closing_cash) : '—' }}</div></div>
        <div><div class="text-slate-400">الفرق</div><div class="font-bold {{ $shift->difference < 0 ? 'text-red-600' : 'text-brand-600' }}">{{ $shift->difference !== null ? money($shift->difference) : '—' }}</div></div>
    </div>

    @if ($summary['by_payment']->count())
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-3">المبيعات حسب طريقة الدفع</h3>
            <div class="flex flex-wrap gap-3">
                @foreach ($summary['by_payment'] as $method => $amount)
                    <span class="px-3 py-1.5 rounded-xl bg-slate-100 text-sm">{{ ['cash'=>'نقدي','card'=>'بطاقة','transfer'=>'تحويل'][$method] ?? $method }}: <span class="font-bold">{{ money($amount) }}</span></span>
                @endforeach
            </div>
        </div>
    @endif

    <div class="card p-5 overflow-x-auto scrollbar-thin">
        <h3 class="font-bold text-slate-700 mb-4">طلبات الوردية</h3>
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">الطلب</th><th class="py-2">الإجمالي</th><th class="py-2">الحالة</th><th class="py-2">الوقت</th></tr></thead>
            <tbody class="divide-y">
                @forelse ($orders as $o)
                    <tr><td class="py-2 font-bold"><a href="{{ route('orders.show',$o) }}" class="hover:text-brand-600">#{{ $o->order_number }}</a></td><td class="py-2">{{ money($o->total) }}</td><td class="py-2"><x-order-status :status="$o->status" /></td><td class="py-2 text-slate-400">{{ $o->created_at->format('H:i') }}</td></tr>
                @empty
                    <tr><td colspan="4" class="py-8 text-center text-slate-400">لا توجد طلبات</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <a href="{{ route('shifts.index') }}" class="text-slate-500 text-sm">رجوع للورديات</a>
</div>
@endsection
