@extends('layouts.app')
@section('title', 'الورديات')

@section('content')
<div class="space-y-6">
    @if ($activeShift)
        <div class="card p-6 border-r-4 border-brand-400">
            <div class="flex items-center justify-between flex-wrap gap-4">
                <div>
                    <h3 class="font-bold text-slate-700 flex items-center gap-2"><span class="w-2.5 h-2.5 rounded-full bg-brand-500 animate-pulse"></span> وردية مفتوحة</h3>
                    <p class="text-sm text-slate-500 mt-1">بدأت {{ $activeShift->opened_at->diffForHumans() }} · نقدية افتتاحية {{ money($activeShift->opening_cash) }}</p>
                    <p class="text-sm text-slate-500">المبيعات حتى الآن: <span class="font-bold text-brand-600">{{ money($activeShift->total_sales) }}</span> ({{ $activeShift->total_orders }} طلب)</p>
                </div>
                <div x-data="{ open: false }">
                    <button @click="open = true" class="bg-melon-600 text-white px-5 py-2.5 rounded-xl font-bold">إغلاق الوردية</button>
                    <div x-show="open" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40" @click.self="open=false">
                        <div class="bg-white rounded-2xl p-6 w-full max-w-md">
                            <h3 class="font-bold text-lg mb-4">إغلاق الوردية</h3>
                            <form method="POST" action="{{ route('shifts.close', $activeShift) }}" class="space-y-3">
                                @csrf
                                <div>
                                    <label class="block text-sm font-semibold text-slate-600 mb-1">النقدية المعدودة في الدرج</label>
                                    <input type="number" step="0.01" name="closing_cash" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                                </div>
                                <input name="notes" placeholder="ملاحظات (اختياري)" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                                <div class="flex gap-2 pt-2"><button class="flex-1 bg-melon-600 text-white py-2.5 rounded-xl font-bold">تأكيد الإغلاق</button><button type="button" @click="open=false" class="px-4 bg-slate-100 rounded-xl">إلغاء</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @else
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-4">فتح وردية جديدة</h3>
            <form method="POST" action="{{ route('shifts.open') }}" class="flex flex-wrap gap-3 items-end">
                @csrf
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">النقدية الافتتاحية</label>
                    <input type="number" step="0.01" name="opening_cash" value="0" required class="px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <div class="flex-1 min-w-48">
                    <label class="block text-sm font-semibold text-slate-600 mb-1">ملاحظات</label>
                    <input name="notes" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <button class="bg-brand-600 text-white px-6 py-2.5 rounded-xl font-bold">فتح الوردية</button>
            </form>
        </div>
    @endif

    <div class="card p-5 overflow-x-auto scrollbar-thin">
        <h3 class="font-bold text-slate-700 mb-4">سجل الورديات</h3>
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">الكاشير</th><th class="py-2">الفتح</th><th class="py-2">الإغلاق</th><th class="py-2">المبيعات</th><th class="py-2">الفرق</th><th class="py-2">الحالة</th><th class="py-2"></th></tr></thead>
            <tbody class="divide-y">
                @forelse ($recent as $s)
                    <tr class="hover:bg-slate-50">
                        <td class="py-3 font-semibold text-slate-700">{{ $s->user?->name }}</td>
                        <td class="py-3 text-slate-500">{{ $s->opened_at->format('m-d H:i') }}</td>
                        <td class="py-3 text-slate-500">{{ $s->closed_at?->format('m-d H:i') ?? '—' }}</td>
                        <td class="py-3 font-semibold">{{ money($s->total_sales) }}</td>
                        <td class="py-3 {{ $s->difference < 0 ? 'text-red-600' : ($s->difference > 0 ? 'text-amber-600' : 'text-slate-500') }}">{{ $s->difference !== null ? money($s->difference) : '—' }}</td>
                        <td class="py-3"><span class="px-2 py-0.5 rounded-full text-xs {{ $s->status==='open' ? 'bg-brand-100 text-brand-700' : 'bg-slate-100 text-slate-500' }}">{{ $s->status==='open' ? 'مفتوحة' : 'مغلقة' }}</span></td>
                        <td class="py-3"><a href="{{ route('shifts.show', $s) }}" class="text-brand-600 hover:underline">تفاصيل</a></td>
                    </tr>
                @empty
                    <tr><td colspan="7" class="py-10 text-center text-slate-400">لا توجد ورديات</td></tr>
                @endforelse
            </tbody>
        </table>
        <div class="mt-4">{{ $recent->links() }}</div>
    </div>
</div>
@endsection
