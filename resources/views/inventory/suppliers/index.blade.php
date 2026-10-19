@extends('layouts.app')
@section('title', 'الموردون')

@section('content')
<div x-data="{ open: false, form: { id: null, name: '', phone: '', email: '', address: '', notes: '', is_active: true } }">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-lg font-bold text-slate-700">الموردون</h2>
        <button @click="form = { id: null, name: '', phone: '', email: '', address: '', notes: '', is_active: true }; open = true" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
            <x-icon name="plus" class="w-5 h-5" /> مورد جديد
        </button>
    </div>

    <div class="card p-5 overflow-x-auto scrollbar-thin">
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b">
                <tr><th class="py-2">المورد</th><th class="py-2">الهاتف</th><th class="py-2">البريد</th><th class="py-2">المشتريات</th><th class="py-2">الحالة</th><th class="py-2"></th></tr>
            </thead>
            <tbody class="divide-y">
                @forelse ($suppliers as $s)
                    <tr class="hover:bg-slate-50">
                        <td class="py-3 font-semibold text-slate-700">{{ $s->name }}</td>
                        <td class="py-3 text-slate-500">{{ $s->phone ?? '—' }}</td>
                        <td class="py-3 text-slate-500">{{ $s->email ?? '—' }}</td>
                        <td class="py-3">{{ $s->purchases_count }}</td>
                        <td class="py-3"><span class="px-2 py-0.5 rounded-full text-xs {{ $s->is_active ? 'bg-brand-100 text-brand-700' : 'bg-slate-100 text-slate-500' }}">{{ $s->is_active ? 'مفعّل' : 'معطّل' }}</span></td>
                        <td class="py-3">
                            <div class="flex gap-1">
                                <button @click="form = {{ \Illuminate\Support\Js::from(['id' => $s->id, 'name' => $s->name, 'phone' => $s->phone, 'email' => $s->email, 'address' => $s->address, 'notes' => $s->notes, 'is_active' => (bool) $s->is_active]) }}; open = true" class="p-2 text-slate-400 hover:text-brand-600"><x-icon name="edit" class="w-5 h-5" /></button>
                                <form method="POST" action="{{ route('inventory.suppliers.destroy', $s) }}" onsubmit="return confirm('حذف المورد؟')">
                                    @csrf @method('DELETE')
                                    <button class="p-2 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button>
                                </form>
                            </div>
                        </td>
                    </tr>
                @empty
                    <tr><td colspan="6" class="py-10 text-center text-slate-400">لا يوجد موردون</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $suppliers->links() }}</div>

    <div x-show="open" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40" @click.self="open=false">
        <div class="bg-white rounded-2xl p-6 w-full max-w-md">
            <h3 class="font-bold text-lg mb-4" x-text="form.id ? 'تعديل مورد' : 'مورد جديد'"></h3>
            <form :action="form.id ? '{{ url('suppliers') }}/' + form.id : '{{ route('inventory.suppliers.store') }}'" method="POST" class="space-y-3">
                @csrf
                <template x-if="form.id"><input type="hidden" name="_method" value="PUT"></template>
                <input name="name" x-model="form.name" placeholder="اسم المورد" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <div class="grid grid-cols-2 gap-3">
                    <input name="phone" x-model="form.phone" placeholder="الهاتف" class="px-3 py-2 rounded-xl border border-slate-200">
                    <input name="email" x-model="form.email" placeholder="البريد" class="px-3 py-2 rounded-xl border border-slate-200">
                </div>
                <input name="address" x-model="form.address" placeholder="العنوان" class="w-full px-3 py-2 rounded-xl border border-slate-200">
                <textarea name="notes" x-model="form.notes" placeholder="ملاحظات" rows="2" class="w-full px-3 py-2 rounded-xl border border-slate-200"></textarea>
                <label class="flex items-center gap-2 text-sm"><input type="checkbox" name="is_active" value="1" x-model="form.is_active" class="rounded text-brand-600"> مفعّل</label>
                <div class="flex gap-2 pt-2">
                    <button class="flex-1 bg-brand-600 text-white py-2.5 rounded-xl font-bold">حفظ</button>
                    <button type="button" @click="open=false" class="px-4 bg-slate-100 rounded-xl">إلغاء</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
