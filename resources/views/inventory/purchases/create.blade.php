@extends('layouts.app')
@section('title', 'فاتورة شراء جديدة')

@section('content')
@php $ingData = $ingredients->map(fn($i) => ['id'=>$i->id,'name'=>$i->name,'unit'=>$i->unit?->abbreviation,'cost'=>(float)$i->cost_per_unit]); @endphp

<form method="POST" action="{{ route('inventory.purchases.store') }}"
      x-data="purchaseForm({ ingredients: {{ Illuminate\Support\Js::from($ingData) }} })" class="max-w-3xl space-y-6">
    @csrf
    <div class="card p-6 grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">المورد</label>
            <select name="supplier_id" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <option value="">بدون مورد</option>
                @foreach ($suppliers as $s)<option value="{{ $s->id }}">{{ $s->name }}</option>@endforeach
            </select>
        </div>
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">تاريخ الشراء</label>
            <input type="date" name="purchased_at" value="{{ now()->toDateString() }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
        </div>
        <div class="sm:col-span-2">
            <label class="block text-sm font-semibold text-slate-600 mb-1">ملاحظات</label>
            <input name="notes" class="w-full px-3 py-2 rounded-xl border border-slate-200">
        </div>
    </div>

    <div class="card p-6">
        <div class="flex justify-between items-center mb-4">
            <h3 class="font-bold text-slate-700">الأصناف المشتراة</h3>
            <button type="button" @click="addRow()" class="text-brand-600 text-sm font-semibold flex items-center gap-1"><x-icon name="plus" class="w-4 h-4" /> إضافة</button>
        </div>
        <div class="space-y-2">
            <template x-for="(row, idx) in rows" :key="idx">
                <div class="flex gap-2 items-center">
                    <select :name="`items[${idx}][ingredient_id]`" x-model.number="row.ingredient_id" @change="setCost(row)" required class="flex-1 px-3 py-2 rounded-xl border border-slate-200">
                        <option value="">— مكوّن —</option>
                        <template x-for="ing in ingredients" :key="ing.id"><option :value="ing.id" x-text="`${ing.name} (${ing.unit})`"></option></template>
                    </select>
                    <input type="number" step="0.001" :name="`items[${idx}][quantity]`" x-model.number="row.quantity" placeholder="الكمية" required class="w-24 px-3 py-2 rounded-xl border border-slate-200">
                    <input type="number" step="0.0001" :name="`items[${idx}][unit_cost]`" x-model.number="row.unit_cost" placeholder="سعر الوحدة" required class="w-28 px-3 py-2 rounded-xl border border-slate-200">
                    <span class="w-24 text-sm text-slate-500 text-left" x-text="((row.quantity||0)*(row.unit_cost||0)).toFixed(2)"></span>
                    <button type="button" @click="removeRow(idx)" class="p-2 text-red-400"><x-icon name="trash" class="w-5 h-5" /></button>
                </div>
            </template>
        </div>
        <div class="mt-4 flex justify-between text-lg font-bold border-t pt-3">
            <span>الإجمالي</span><span x-text="total.toFixed(2) + ' {{ \App\Models\Setting::get('currency','ل.س') }}'"></span>
        </div>
    </div>

    <div class="flex gap-2">
        <button class="bg-brand-600 text-white px-6 py-3 rounded-xl font-bold">حفظ الفاتورة وتحديث المخزون</button>
        <a href="{{ route('inventory.purchases.index') }}" class="px-6 py-3 bg-slate-100 rounded-xl">إلغاء</a>
    </div>
</form>
@endsection

@push('scripts')
<script>
function purchaseForm(config) {
    return {
        ingredients: config.ingredients,
        rows: [{ ingredient_id: '', quantity: '', unit_cost: '' }],
        addRow() { this.rows.push({ ingredient_id: '', quantity: '', unit_cost: '' }); },
        removeRow(i) { this.rows.splice(i, 1); if (!this.rows.length) this.addRow(); },
        setCost(row) { const ing = this.ingredients.find(i => i.id === row.ingredient_id); if (ing && !row.unit_cost) row.unit_cost = ing.cost; },
        get total() { return this.rows.reduce((s, r) => s + (r.quantity || 0) * (r.unit_cost || 0), 0); },
    };
}
</script>
@endpush
