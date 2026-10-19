@extends('layouts.app')
@section('title', 'التصنيفات')

@section('content')
<div x-data="{ open: false, form: { id: null, name: '', color: '#16a34a', sort_order: 0, is_active: true } }">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-lg font-bold text-slate-700">تصنيفات القائمة</h2>
        <button @click="form = { id: null, name: '', color: '#16a34a', sort_order: 0, is_active: true }; open = true"
                class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
            <x-icon name="plus" class="w-5 h-5" /> تصنيف جديد
        </button>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        @forelse ($categories as $cat)
            <div class="card p-5 flex items-center justify-between">
                <div class="flex items-center gap-3">
                    <span class="w-10 h-10 rounded-xl" style="background: {{ $cat->color }}"></span>
                    <div>
                        <div class="font-bold text-slate-700">{{ $cat->name }}</div>
                        <div class="text-xs text-slate-400">{{ $cat->items_count }} صنف · {{ $cat->is_active ? 'مفعّل' : 'معطّل' }}</div>
                    </div>
                </div>
                <div class="flex gap-1">
                    <button @click="form = {{ \Illuminate\Support\Js::from(['id' => $cat->id, 'name' => $cat->name, 'color' => $cat->color, 'sort_order' => $cat->sort_order, 'is_active' => (bool) $cat->is_active]) }}; open = true"
                            class="p-2 text-slate-400 hover:text-brand-600"><x-icon name="edit" class="w-5 h-5" /></button>
                    <form method="POST" action="{{ route('categories.destroy', $cat) }}" onsubmit="return confirm('حذف التصنيف؟')">
                        @csrf @method('DELETE')
                        <button class="p-2 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button>
                    </form>
                </div>
            </div>
        @empty
            <p class="text-slate-400">لا توجد تصنيفات بعد.</p>
        @endforelse
    </div>

    {{-- Modal --}}
    <div x-show="open" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40" @click.self="open = false">
        <div class="bg-white rounded-2xl p-6 w-full max-w-md">
            <h3 class="font-bold text-lg mb-4" x-text="form.id ? 'تعديل تصنيف' : 'تصنيف جديد'"></h3>
            <form :action="form.id ? '{{ url('categories') }}/' + form.id : '{{ route('categories.store') }}'" method="POST" class="space-y-4">
                @csrf
                <template x-if="form.id"><input type="hidden" name="_method" value="PUT"></template>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1">الاسم</label>
                    <input name="name" x-model="form.name" required class="w-full px-3 py-2 rounded-xl border border-slate-200 outline-none focus:border-brand-500">
                </div>
                <div class="grid grid-cols-2 gap-3">
                    <div>
                        <label class="block text-sm font-semibold text-slate-600 mb-1">اللون</label>
                        <input type="color" name="color" x-model="form.color" class="w-full h-10 rounded-xl border border-slate-200">
                    </div>
                    <div>
                        <label class="block text-sm font-semibold text-slate-600 mb-1">الترتيب</label>
                        <input type="number" name="sort_order" x-model="form.sort_order" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                    </div>
                </div>
                <label class="flex items-center gap-2 text-sm"><input type="checkbox" name="is_active" value="1" x-model="form.is_active" class="rounded text-brand-600"> مفعّل</label>
                <div class="flex gap-2 pt-2">
                    <button class="flex-1 bg-brand-600 text-white py-2.5 rounded-xl font-bold">حفظ</button>
                    <button type="button" @click="open = false" class="px-4 bg-slate-100 rounded-xl">إلغاء</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
