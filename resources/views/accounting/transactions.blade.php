@extends('layouts.app')
@section('title', 'سجل الحركات المالية')

@section('content')
<form method="GET" class="card p-4 flex flex-wrap gap-3 mb-4 items-end">
    <select name="type" class="px-3 py-2 rounded-xl border border-slate-200">
        <option value="">كل الأنواع</option>
        <option value="income" @selected(request('type')==='income')>دخل</option>
        <option value="expense" @selected(request('type')==='expense')>مصروف</option>
    </select>
    <input type="date" name="from" value="{{ request('from') }}" class="px-3 py-2 rounded-xl border border-slate-200">
    <input type="date" name="to" value="{{ request('to') }}" class="px-3 py-2 rounded-xl border border-slate-200">
    <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">تصفية</button>
</form>

<div class="card p-5 overflow-x-auto scrollbar-thin">
    <table class="w-full text-sm">
        <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">النوع</th><th class="py-2">الفئة</th><th class="py-2">الوصف</th><th class="py-2">المبلغ</th><th class="py-2">التاريخ</th></tr></thead>
        <tbody class="divide-y">
            @forelse ($transactions as $t)
                <tr class="hover:bg-slate-50">
                    <td class="py-3"><span class="px-2 py-0.5 rounded-full text-xs {{ $t->type==='income' ? 'bg-brand-100 text-brand-700' : 'bg-melon-100 text-melon-600' }}">{{ $t->type==='income' ? 'دخل' : 'مصروف' }}</span></td>
                    <td class="py-3 text-slate-500">{{ str_replace('expense:', '', $t->category) }}</td>
                    <td class="py-3 text-slate-700">{{ $t->description }}</td>
                    <td class="py-3 font-bold {{ $t->type==='income' ? 'text-brand-600' : 'text-melon-600' }}">{{ $t->type==='income' ? '+' : '-' }} {{ money($t->amount) }}</td>
                    <td class="py-3 text-slate-400">{{ $t->occurred_at->format('Y-m-d H:i') }}</td>
                </tr>
            @empty
                <tr><td colspan="5" class="py-10 text-center text-slate-400">لا توجد حركات</td></tr>
            @endforelse
        </tbody>
    </table>
</div>
<div class="mt-4">{{ $transactions->links() }}</div>
@endsection
