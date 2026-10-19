@extends('layouts.app')
@section('title', 'الأصناف')

@section('content')
<div class="flex justify-between items-center mb-4">
    <h2 class="text-lg font-bold text-slate-700">قائمة الأصناف</h2>
    <a href="{{ route('items.create') }}" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
        <x-icon name="plus" class="w-5 h-5" /> صنف جديد
    </a>
</div>

<div class="card p-5">
    <form method="GET" class="flex flex-wrap gap-3 mb-4">
        <input type="text" name="q" value="{{ request('q') }}" placeholder="بحث باسم الصنف"
               class="flex-1 min-w-48 px-3 py-2 rounded-xl border border-slate-200 outline-none focus:border-brand-500">
        <select name="category" class="px-3 py-2 rounded-xl border border-slate-200">
            <option value="">كل التصنيفات</option>
            @foreach ($categories as $c)
                <option value="{{ $c->id }}" @selected(request('category') == $c->id)>{{ $c->name }}</option>
            @endforeach
        </select>
        <select name="status" class="px-3 py-2 rounded-xl border border-slate-200">
            <option value="">الكل</option>
            <option value="available" @selected(request('status')==='available')>متاح</option>
            <option value="unavailable" @selected(request('status')==='unavailable')>غير متاح</option>
        </select>
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">تصفية</button>
    </form>

    <div class="overflow-x-auto scrollbar-thin">
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b">
                <tr>
                    <th class="py-2 font-medium">الصنف</th>
                    <th class="py-2 font-medium">التصنيف</th>
                    <th class="py-2 font-medium">السعر</th>
                    <th class="py-2 font-medium">التكلفة</th>
                    <th class="py-2 font-medium">الربح</th>
                    <th class="py-2 font-medium">الهامش</th>
                    <th class="py-2 font-medium">الحالة</th>
                    <th class="py-2 font-medium"></th>
                </tr>
            </thead>
            <tbody class="divide-y">
                @forelse ($items as $item)
                    <tr class="hover:bg-slate-50">
                        <td class="py-3">
                            <div class="flex items-center gap-3">
                                <img src="{{ $item->image_url }}" class="w-10 h-10 rounded-lg object-cover">
                                <span class="font-semibold text-slate-700">{{ $item->name }}</span>
                            </div>
                        </td>
                        <td class="py-3 text-slate-500">{{ $item->category?->name }}</td>
                        <td class="py-3 font-semibold">{{ money($item->price) }}</td>
                        <td class="py-3 text-slate-500">{{ money($item->cost) }}</td>
                        <td class="py-3 text-violet-600">{{ money($item->profit) }}</td>
                        <td class="py-3">
                            <span class="px-2 py-0.5 rounded-full text-xs font-semibold {{ $item->margin >= 50 ? 'bg-brand-100 text-brand-700' : ($item->margin >= 25 ? 'bg-amber-100 text-amber-700' : 'bg-red-100 text-red-700') }}">
                                {{ $item->margin }}٪
                            </span>
                        </td>
                        <td class="py-3">
                            <span class="px-2 py-0.5 rounded-full text-xs {{ $item->is_available ? 'bg-brand-100 text-brand-700' : 'bg-slate-100 text-slate-500' }}">
                                {{ $item->is_available ? 'متاح' : 'معطّل' }}
                            </span>
                        </td>
                        <td class="py-3">
                            <div class="flex gap-1">
                                <a href="{{ route('items.edit', $item) }}" class="p-2 text-slate-400 hover:text-brand-600"><x-icon name="edit" class="w-5 h-5" /></a>
                                <form method="POST" action="{{ route('items.destroy', $item) }}" onsubmit="return confirm('حذف الصنف؟')">
                                    @csrf @method('DELETE')
                                    <button class="p-2 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button>
                                </form>
                            </div>
                        </td>
                    </tr>
                @empty
                    <tr><td colspan="8" class="py-10 text-center text-slate-400">لا توجد أصناف</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $items->links() }}</div>
</div>
@endsection
