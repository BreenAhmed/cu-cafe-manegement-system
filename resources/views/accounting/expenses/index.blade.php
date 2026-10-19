@extends('layouts.app')
@section('title', 'المصروفات')

@section('content')
<div x-data="{ open: false, form: { id: null, expense_category_id: '', amount: '', description: '', payment_method: 'cash', spent_at: '{{ now()->toDateString() }}' } }">
    <div class="flex justify-between items-center mb-4 flex-wrap gap-3">
        <h2 class="text-lg font-bold text-slate-700">المصروفات</h2>
        <div class="flex gap-2">
            <a href="{{ route('accounting.expense-categories.index') }}" class="px-4 py-2 bg-slate-100 rounded-xl font-semibold">فئات المصروفات</a>
            <button @click="form = { id: null, expense_category_id: '', amount: '', description: '', payment_method: 'cash', spent_at: '{{ now()->toDateString() }}' }; open = true" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
                <x-icon name="plus" class="w-5 h-5" /> مصروف جديد
            </button>
        </div>
    </div>

    <form method="GET" class="card p-4 flex flex-wrap gap-3 mb-4 items-end">
        <select name="category" class="px-3 py-2 rounded-xl border border-slate-200">
            <option value="">كل الفئات</option>
            @foreach ($categories as $c)<option value="{{ $c->id }}" @selected(request('category')==$c->id)>{{ $c->name }}</option>@endforeach
        </select>
        <input type="date" name="from" value="{{ request('from') }}" class="px-3 py-2 rounded-xl border border-slate-200">
        <input type="date" name="to" value="{{ request('to') }}" class="px-3 py-2 rounded-xl border border-slate-200">
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">تصفية</button>
        <span class="ms-auto text-sm font-bold text-slate-600">الإجمالي: {{ money($total) }}</span>
    </form>

    <div class="card p-5 overflow-x-auto scrollbar-thin">
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">الوصف</th><th class="py-2">الفئة</th><th class="py-2">المبلغ</th><th class="py-2">الدفع</th><th class="py-2">التاريخ</th><th class="py-2"></th></tr></thead>
            <tbody class="divide-y">
                @forelse ($expenses as $e)
                    <tr class="hover:bg-slate-50">
                        <td class="py-3 font-semibold text-slate-700">{{ $e->description }}</td>
                        <td class="py-3 text-slate-500">{{ $e->category?->name }}</td>
                        <td class="py-3 font-bold text-melon-600">{{ money($e->amount) }}</td>
                        <td class="py-3 text-slate-500">{{ ['cash'=>'نقدي','card'=>'بطاقة','transfer'=>'تحويل'][$e->payment_method] ?? $e->payment_method }}</td>
                        <td class="py-3 text-slate-400">{{ $e->spent_at->format('Y-m-d') }}</td>
                        <td class="py-3">
                            <form method="POST" action="{{ route('accounting.expenses.destroy', $e) }}" onsubmit="return confirm('حذف المصروف؟')">
                                @csrf @method('DELETE')
                                <button class="p-2 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr><td colspan="6" class="py-10 text-center text-slate-400">لا توجد مصروفات</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $expenses->links() }}</div>

    <div x-show="open" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40" @click.self="open=false">
        <div class="bg-white rounded-2xl p-6 w-full max-w-md">
            <h3 class="font-bold text-lg mb-4">مصروف جديد</h3>
            <form method="POST" action="{{ route('accounting.expenses.store') }}" enctype="multipart/form-data" class="space-y-3">
                @csrf
                <select name="expense_category_id" x-model="form.expense_category_id" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                    <option value="">اختر الفئة</option>
                    @foreach ($categories as $c)<option value="{{ $c->id }}">{{ $c->name }}</option>@endforeach
                </select>
                <input name="description" x-model="form.description" placeholder="وصف المصروف" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <div class="grid grid-cols-2 gap-3">
                    <input type="number" step="0.01" name="amount" x-model="form.amount" placeholder="المبلغ" required class="px-3 py-2 rounded-xl border border-slate-200">
                    <select name="payment_method" x-model="form.payment_method" class="px-3 py-2 rounded-xl border border-slate-200">
                        <option value="cash">نقدي</option><option value="card">بطاقة</option><option value="transfer">تحويل</option>
                    </select>
                </div>
                <input type="date" name="spent_at" x-model="form.spent_at" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <input type="file" name="attachment" class="w-full text-sm">
                <div class="flex gap-2 pt-2">
                    <button class="flex-1 bg-brand-600 text-white py-2.5 rounded-xl font-bold">حفظ</button>
                    <button type="button" @click="open=false" class="px-4 bg-slate-100 rounded-xl">إلغاء</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
