@extends('layouts.app')
@section('title', $ingredient->exists ? 'تعديل مكوّن' : 'مكوّن جديد')

@section('content')
<div class="max-w-xl">
    <form method="POST" action="{{ $ingredient->exists ? route('inventory.ingredients.update', $ingredient) : route('inventory.ingredients.store') }}" class="card p-6 space-y-4">
        @csrf
        @if ($ingredient->exists) @method('PUT') @endif

        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">اسم المكوّن</label>
            <input name="name" value="{{ old('name', $ingredient->name) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200 outline-none focus:border-brand-500">
        </div>
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">وحدة القياس</label>
            <select name="unit_id" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                @foreach ($units as $u)
                    <option value="{{ $u->id }}" @selected(old('unit_id', $ingredient->unit_id) == $u->id)>{{ $u->name }} ({{ $u->abbreviation }})</option>
                @endforeach
            </select>
        </div>
        <div class="grid grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">المخزون الحالي</label>
                <input type="number" step="0.001" name="current_stock" value="{{ old('current_stock', $ingredient->current_stock ?? 0) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">حد التنبيه (منخفض)</label>
                <input type="number" step="0.001" name="reorder_level" value="{{ old('reorder_level', $ingredient->reorder_level ?? 0) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
        </div>
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">تكلفة الوحدة</label>
            <input type="number" step="0.0001" name="cost_per_unit" value="{{ old('cost_per_unit', $ingredient->cost_per_unit ?? 0) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
        </div>
        <label class="flex items-center gap-2 text-sm"><input type="checkbox" name="is_active" value="1" @checked(old('is_active', $ingredient->is_active ?? true)) class="rounded text-brand-600"> مفعّل</label>

        <div class="flex gap-2 pt-2">
            <button class="flex-1 bg-brand-600 text-white py-2.5 rounded-xl font-bold">حفظ</button>
            <a href="{{ route('inventory.ingredients.index') }}" class="px-4 py-2.5 bg-slate-100 rounded-xl">إلغاء</a>
        </div>
    </form>
</div>
@endsection
