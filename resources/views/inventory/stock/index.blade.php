@extends('layouts.app')
@section('title', 'حركة المخزون')

@section('content')
<div x-data="{ tab: 'waste' }" class="space-y-6">
    @if ($lowStock->count())
        <div class="card p-5 border-r-4 border-red-400">
            <h3 class="font-bold text-red-600 mb-3 flex items-center gap-2"><x-icon name="box" class="w-5 h-5" /> تنبيهات المخزون المنخفض ({{ $lowStock->count() }})</h3>
            <div class="flex flex-wrap gap-2">
                @foreach ($lowStock as $ing)
                    <span class="px-3 py-1 rounded-full bg-red-50 text-red-700 text-sm">{{ $ing->name }}: {{ number_format($ing->current_stock, 2) }} {{ $ing->unit?->abbreviation }}</span>
                @endforeach
            </div>
        </div>
    @endif

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-4">
        {{-- تسجيل هدر --}}
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-4">تسجيل هدر</h3>
            <form method="POST" action="{{ route('inventory.stock.waste') }}" class="space-y-3">
                @csrf
                <select name="ingredient_id" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                    <option value="">اختر المكوّن</option>
                    @foreach ($ingredients as $ing)<option value="{{ $ing->id }}">{{ $ing->name }} ({{ $ing->unit?->abbreviation }})</option>@endforeach
                </select>
                <input type="number" step="0.001" name="quantity" placeholder="الكمية المهدرة" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <input name="notes" placeholder="السبب (اختياري)" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <button class="w-full bg-melon-600 text-white py-2.5 rounded-xl font-bold">تسجيل الهدر</button>
            </form>
        </div>

        {{-- تسوية مخزون --}}
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-4">تسوية يدوية للمخزون</h3>
            <form method="POST" action="{{ route('inventory.stock.adjust') }}" class="space-y-3">
                @csrf
                <select name="ingredient_id" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                    <option value="">اختر المكوّن</option>
                    @foreach ($ingredients as $ing)<option value="{{ $ing->id }}">{{ $ing->name }} — حالياً {{ number_format($ing->current_stock, 2) }}</option>@endforeach
                </select>
                <input type="number" step="0.001" name="target_stock" placeholder="الرصيد الصحيح بعد الجرد" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <input name="notes" placeholder="ملاحظة (اختياري)" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <button class="w-full bg-amber-500 text-white py-2.5 rounded-xl font-bold">تسوية</button>
            </form>
        </div>
    </div>

    <div class="card p-5">
        <h3 class="font-bold text-slate-700 mb-4">سجل الحركات</h3>
        <div class="overflow-x-auto scrollbar-thin">
            <table class="w-full text-sm">
                <thead class="text-slate-400 text-right border-b">
                    <tr><th class="py-2">المكوّن</th><th class="py-2">النوع</th><th class="py-2">الكمية</th><th class="py-2">الرصيد بعد</th><th class="py-2">المستخدم</th><th class="py-2">التاريخ</th></tr>
                </thead>
                <tbody class="divide-y">
                    @forelse ($movements as $m)
                        <tr class="hover:bg-slate-50">
                            <td class="py-3 font-semibold text-slate-700">{{ $m->ingredient?->name }}</td>
                            <td class="py-3">
                                <span class="px-2 py-0.5 rounded-full text-xs
                                    {{ ['purchase'=>'bg-brand-100 text-brand-700','sale'=>'bg-blue-100 text-blue-700','waste'=>'bg-red-100 text-red-700','adjustment'=>'bg-amber-100 text-amber-700'][$m->type] ?? 'bg-slate-100' }}">
                                    {{ \App\Models\StockMovement::typeLabel($m->type) }}
                                </span>
                            </td>
                            <td class="py-3 font-bold {{ $m->quantity < 0 ? 'text-red-600' : 'text-brand-600' }}">{{ number_format($m->quantity, 3) }}</td>
                            <td class="py-3">{{ number_format($m->balance_after, 3) }} {{ $m->ingredient?->unit?->abbreviation }}</td>
                            <td class="py-3 text-slate-500">{{ $m->user?->name ?? '—' }}</td>
                            <td class="py-3 text-slate-400">{{ $m->created_at->format('Y-m-d H:i') }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="6" class="py-10 text-center text-slate-400">لا توجد حركات</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <div class="mt-4">{{ $movements->links() }}</div>
    </div>
</div>
@endsection
