@extends('layouts.app')
@section('title', 'المكوّنات')

@section('content')
<div class="flex justify-between items-center mb-4">
    <h2 class="text-lg font-bold text-slate-700">مكوّنات المخزون</h2>
    <a href="{{ route('inventory.ingredients.create') }}" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
        <x-icon name="plus" class="w-5 h-5" /> مكوّن جديد
    </a>
</div>

<div class="card p-5">
    <form method="GET" class="flex flex-wrap gap-3 mb-4">
        <input type="text" name="q" value="{{ request('q') }}" placeholder="بحث"
               class="flex-1 min-w-48 px-3 py-2 rounded-xl border border-slate-200 outline-none focus:border-brand-500">
        <select name="filter" class="px-3 py-2 rounded-xl border border-slate-200">
            <option value="">الكل</option>
            <option value="low" @selected(request('filter')==='low')>منخفض المخزون فقط</option>
        </select>
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">تصفية</button>
    </form>

    <div class="overflow-x-auto scrollbar-thin">
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b">
                <tr>
                    <th class="py-2 font-medium">المكوّن</th>
                    <th class="py-2 font-medium">الوحدة</th>
                    <th class="py-2 font-medium">المخزون الحالي</th>
                    <th class="py-2 font-medium">حد التنبيه</th>
                    <th class="py-2 font-medium">تكلفة الوحدة</th>
                    <th class="py-2 font-medium">قيمة المخزون</th>
                    <th class="py-2 font-medium"></th>
                </tr>
            </thead>
            <tbody class="divide-y">
                @forelse ($ingredients as $ing)
                    <tr class="hover:bg-slate-50 {{ $ing->isLowStock() ? 'bg-red-50/50' : '' }}">
                        <td class="py-3 font-semibold text-slate-700">
                            {{ $ing->name }}
                            @if ($ing->isLowStock())<span class="text-xs text-red-600 mr-1">⚠️ منخفض</span>@endif
                        </td>
                        <td class="py-3 text-slate-500">{{ $ing->unit?->name }}</td>
                        <td class="py-3 font-bold {{ $ing->isLowStock() ? 'text-red-600' : '' }}">{{ number_format($ing->current_stock, 3) }}</td>
                        <td class="py-3 text-slate-500">{{ number_format($ing->reorder_level, 3) }}</td>
                        <td class="py-3">{{ money($ing->cost_per_unit) }}</td>
                        <td class="py-3 font-semibold">{{ money($ing->current_stock * $ing->cost_per_unit) }}</td>
                        <td class="py-3">
                            <div class="flex gap-1">
                                <a href="{{ route('inventory.ingredients.edit', $ing) }}" class="p-2 text-slate-400 hover:text-brand-600"><x-icon name="edit" class="w-5 h-5" /></a>
                                <form method="POST" action="{{ route('inventory.ingredients.destroy', $ing) }}" onsubmit="return confirm('حذف المكوّن؟')">
                                    @csrf @method('DELETE')
                                    <button class="p-2 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button>
                                </form>
                            </div>
                        </td>
                    </tr>
                @empty
                    <tr><td colspan="7" class="py-10 text-center text-slate-400">لا توجد مكوّنات</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $ingredients->links() }}</div>
</div>
@endsection
