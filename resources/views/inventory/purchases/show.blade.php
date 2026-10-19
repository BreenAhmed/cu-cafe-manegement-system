@extends('layouts.app')
@section('title', 'فاتورة شراء ' . $purchase->reference)

@section('content')
<div class="max-w-3xl space-y-6">
    <div class="card p-6 grid grid-cols-2 sm:grid-cols-4 gap-4 text-sm">
        <div><div class="text-slate-400">المرجع</div><div class="font-bold">{{ $purchase->reference }}</div></div>
        <div><div class="text-slate-400">المورد</div><div class="font-bold">{{ $purchase->supplier?->name ?? 'بدون' }}</div></div>
        <div><div class="text-slate-400">التاريخ</div><div class="font-bold">{{ $purchase->purchased_at->format('Y-m-d') }}</div></div>
        <div><div class="text-slate-400">الإجمالي</div><div class="font-bold text-brand-600">{{ money($purchase->total) }}</div></div>
    </div>

    <div class="card p-6 overflow-x-auto scrollbar-thin">
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">المكوّن</th><th class="py-2">الكمية</th><th class="py-2">سعر الوحدة</th><th class="py-2">الإجمالي</th></tr></thead>
            <tbody class="divide-y">
                @foreach ($purchase->items as $it)
                    <tr><td class="py-3 font-semibold">{{ $it->ingredient?->name }}</td><td class="py-3">{{ number_format($it->quantity,3) }} {{ $it->ingredient?->unit?->abbreviation }}</td><td class="py-3">{{ money($it->unit_cost) }}</td><td class="py-3 font-bold">{{ money($it->total) }}</td></tr>
                @endforeach
            </tbody>
        </table>
    </div>
    @if($purchase->notes)<div class="card p-4 text-sm text-slate-600">📝 {{ $purchase->notes }}</div>@endif
    <a href="{{ route('inventory.purchases.index') }}" class="text-slate-500 text-sm">رجوع للمشتريات</a>
</div>
@endsection
