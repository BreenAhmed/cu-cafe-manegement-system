@extends('layouts.app')
@section('title', 'وحدات القياس')

@section('content')
<div x-data="{ open: false, form: { id: null, name: '', abbreviation: '' } }">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-lg font-bold text-slate-700">وحدات القياس</h2>
        <button @click="form = { id: null, name: '', abbreviation: '' }; open = true" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
            <x-icon name="plus" class="w-5 h-5" /> وحدة جديدة
        </button>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        @forelse ($units as $u)
            <div class="card p-5 flex items-center justify-between">
                <div>
                    <div class="font-bold text-slate-700">{{ $u->name }} <span class="text-slate-400 text-sm">({{ $u->abbreviation }})</span></div>
                    <div class="text-xs text-slate-400">{{ $u->ingredients_count }} مكوّن</div>
                </div>
                <div class="flex gap-1">
                    <button @click="form = {{ \Illuminate\Support\Js::from(['id' => $u->id, 'name' => $u->name, 'abbreviation' => $u->abbreviation]) }}; open = true" class="p-2 text-slate-400 hover:text-brand-600"><x-icon name="edit" class="w-5 h-5" /></button>
                    <form method="POST" action="{{ route('inventory.units.destroy', $u) }}" onsubmit="return confirm('حذف الوحدة؟')">
                        @csrf @method('DELETE')
                        <button class="p-2 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button>
                    </form>
                </div>
            </div>
        @empty
            <p class="text-slate-400">لا توجد وحدات.</p>
        @endforelse
    </div>

    <div x-show="open" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40" @click.self="open=false">
        <div class="bg-white rounded-2xl p-6 w-full max-w-sm">
            <h3 class="font-bold text-lg mb-4" x-text="form.id ? 'تعديل وحدة' : 'وحدة جديدة'"></h3>
            <form :action="form.id ? '{{ url('units') }}/' + form.id : '{{ route('inventory.units.store') }}'" method="POST" class="space-y-4">
                @csrf
                <template x-if="form.id"><input type="hidden" name="_method" value="PUT"></template>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">الاسم</label>
                    <input name="name" x-model="form.name" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">الاختصار</label>
                    <input name="abbreviation" x-model="form.abbreviation" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <div class="flex gap-2 pt-2">
                    <button class="flex-1 bg-brand-600 text-white py-2.5 rounded-xl font-bold">حفظ</button>
                    <button type="button" @click="open=false" class="px-4 bg-slate-100 rounded-xl">إلغاء</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
