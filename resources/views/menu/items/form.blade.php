@extends('layouts.app')
@section('title', $item->exists ? 'تعديل صنف' : 'صنف جديد')

@section('content')
@php
    $ingredientsData = $ingredients->map(fn ($i) => ['id' => $i->id, 'name' => $i->name, 'unit' => $i->unit?->abbreviation, 'cost' => (float) $i->cost_per_unit]);
    $existingRecipe = $item->recipeItems->map(fn ($r) => ['ingredient_id' => $r->ingredient_id, 'quantity' => (float) $r->quantity]);
@endphp

<form method="POST" action="{{ $item->exists ? route('items.update', $item) : route('items.store') }}" enctype="multipart/form-data"
      x-data="recipeBuilder({ ingredients: {{ Illuminate\Support\Js::from($ingredientsData) }}, recipe: {{ Illuminate\Support\Js::from($existingRecipe->isEmpty() ? [['ingredient_id' => '', 'quantity' => '']] : $existingRecipe) }} })"
      class="grid grid-cols-1 lg:grid-cols-3 gap-6">
    @csrf
    @if ($item->exists) @method('PUT') @endif

    <div class="lg:col-span-2 space-y-6">
        <div class="card p-6 space-y-4">
            <h3 class="font-bold text-slate-700">بيانات الصنف</h3>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">الاسم</label>
                    <input name="name" value="{{ old('name', $item->name) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200 outline-none focus:border-brand-500">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">التصنيف</label>
                    <select name="category_id" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                        @foreach ($categories as $c)
                            <option value="{{ $c->id }}" @selected(old('category_id', $item->category_id) == $c->id)>{{ $c->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">سعر البيع</label>
                    <input type="number" step="0.01" name="price" value="{{ old('price', $item->price) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">تكلفة يدوية (اختياري)</label>
                    <input type="number" step="0.01" name="manual_cost" value="{{ old('manual_cost', $item->manual_cost) }}" placeholder="تُحسب من الوصفة إن تُركت فارغة" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">رمز SKU</label>
                    <input name="sku" value="{{ old('sku', $item->sku) }}" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">وقت التحضير (دقيقة)</label>
                    <input type="number" name="prep_time_minutes" value="{{ old('prep_time_minutes', $item->prep_time_minutes) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                </div>
            </div>
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">الوصف</label>
                <textarea name="description" rows="2" class="w-full px-3 py-2 rounded-xl border border-slate-200">{{ old('description', $item->description) }}</textarea>
            </div>
            <div class="flex flex-wrap gap-6">
                <label class="flex items-center gap-2 text-sm"><input type="checkbox" name="is_available" value="1" @checked(old('is_available', $item->is_available)) class="rounded text-brand-600"> متاح للبيع</label>
                <label class="flex items-center gap-2 text-sm"><input type="checkbox" name="track_inventory" value="1" @checked(old('track_inventory', $item->track_inventory)) class="rounded text-brand-600"> خصم المكوّنات من المخزون</label>
            </div>
        </div>

        {{-- الوصفة --}}
        <div class="card p-6">
            <div class="flex justify-between items-center mb-4">
                <h3 class="font-bold text-slate-700">الوصفة (المكوّنات)</h3>
                <button type="button" @click="addRow()" class="text-brand-600 text-sm font-semibold flex items-center gap-1"><x-icon name="plus" class="w-4 h-4" /> إضافة مكوّن</button>
            </div>
            <div class="space-y-2">
                <template x-for="(row, idx) in recipe" :key="idx">
                    <div class="flex gap-2 items-center">
                        <select :name="`recipe[${idx}][ingredient_id]`" x-model.number="row.ingredient_id" class="flex-1 px-3 py-2 rounded-xl border border-slate-200">
                            <option value="">— اختر مكوّناً —</option>
                            <template x-for="ing in ingredients" :key="ing.id">
                                <option :value="ing.id" x-text="`${ing.name} (${ing.unit})`"></option>
                            </template>
                        </select>
                        <input type="number" step="0.001" :name="`recipe[${idx}][quantity]`" x-model.number="row.quantity" placeholder="الكمية" class="w-28 px-3 py-2 rounded-xl border border-slate-200">
                        <button type="button" @click="removeRow(idx)" class="p-2 text-red-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button>
                    </div>
                </template>
            </div>
            <div class="mt-4 flex justify-between text-sm border-t pt-3">
                <span class="text-slate-500">تكلفة الوصفة المقدّرة</span>
                <span class="font-bold text-slate-700" x-text="recipeCostLabel"></span>
            </div>
        </div>
    </div>

    <div class="space-y-6">
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-3">صورة الصنف</h3>
            <img src="{{ $item->image_url }}" class="w-full aspect-square object-cover rounded-xl mb-3">
            <input type="file" name="image" accept="image/*" class="w-full text-sm">
        </div>
        <button class="w-full bg-brand-600 hover:bg-brand-700 text-white font-bold py-3 rounded-xl">{{ $item->exists ? 'حفظ التعديلات' : 'إضافة الصنف' }}</button>
        <a href="{{ route('items.index') }}" class="block text-center text-slate-500 text-sm">رجوع للقائمة</a>
    </div>
</form>
@endsection

@push('scripts')
<script>
function recipeBuilder(config) {
    return {
        ingredients: config.ingredients,
        recipe: config.recipe.length ? config.recipe : [{ ingredient_id: '', quantity: '' }],
        addRow() { this.recipe.push({ ingredient_id: '', quantity: '' }); },
        removeRow(i) { this.recipe.splice(i, 1); if (!this.recipe.length) this.addRow(); },
        get recipeCost() {
            return this.recipe.reduce((sum, r) => {
                const ing = this.ingredients.find(i => i.id === r.ingredient_id);
                return sum + (ing ? ing.cost * (r.quantity || 0) : 0);
            }, 0);
        },
        get recipeCostLabel() { return this.recipeCost.toFixed(2) + ' {{ \App\Models\Setting::get('currency', 'ل.س') }}'; },
    };
}
</script>
@endpush
