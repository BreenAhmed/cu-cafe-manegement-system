@extends('layouts.app')
@section('title', 'الطاولات')

@section('content')
<div x-data="{ open: false, form: { id: null, name: '', capacity: 4, sort_order: 0, is_active: true } }">
    <div class="flex items-center justify-between mb-4">
        <h2 class="text-lg font-bold text-slate-700">إدارة الطاولات</h2>
        @can('manage menu')
            <button @click="form = { id: null, name: '', capacity: 4, sort_order: 0, is_active: true }; open = true"
                    class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
                <x-icon name="plus" class="w-5 h-5" /> طاولة جديدة
            </button>
        @endcan
    </div>

    {{-- شبكة الطاولات --}}
    <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4 mb-6">
        @forelse ($tables as $table)
            <div class="card p-4 flex flex-col gap-3 {{ $table->isOccupied() ? 'border-r-4 border-melon-400' : 'border-r-4 border-brand-200' }}">
                <div class="flex items-start justify-between">
                    <div>
                        <div class="font-bold text-slate-700">{{ $table->name }}</div>
                        <div class="text-xs text-slate-400">{{ $table->capacity }} مقاعد</div>
                    </div>
                    <span class="px-2 py-0.5 rounded-full text-xs font-semibold
                                 {{ $table->isOccupied() ? 'bg-melon-100 text-melon-700' : 'bg-brand-100 text-brand-700' }}">
                        {{ $table->status_label }}
                    </span>
                </div>

                @if ($table->isOccupied())
                    <div class="text-sm space-y-1">
                        <div class="flex justify-between text-slate-500">
                            <span>الطلبات</span>
                            <span class="font-bold">{{ $table->activeOrders->count() }}</span>
                        </div>
                        <div class="flex justify-between text-melon-600">
                            <span>الإجمالي</span>
                            <span class="font-bold">{{ money($table->running_total) }}</span>
                        </div>
                    </div>

                    <div class="space-y-1 max-h-24 overflow-y-auto scrollbar-thin">
                        @foreach ($table->activeOrders as $ord)
                            <div class="text-xs bg-slate-50 rounded-lg px-2 py-1.5 flex justify-between">
                                <span class="text-slate-600">#{{ $ord->order_number }} <x-order-status :status="$ord->status" /></span>
                                <span class="font-bold">{{ money($ord->total) }}</span>
                            </div>
                        @endforeach
                    </div>

                    <div x-data="{ payMethod: 'cash' }" class="flex flex-col gap-1.5">
                        <select x-model="payMethod" class="w-full px-2 py-1.5 rounded-lg border border-slate-200 text-xs">
                            <option value="cash">نقدي</option>
                            <option value="card">بطاقة</option>
                            <option value="transfer">تحويل</option>
                        </select>
                        <form method="POST" action="{{ route('tables.settle', $table) }}" onsubmit="return confirm('تسوية حساب {{ $table->name }}؟')">
                            @csrf
                            <input type="hidden" name="payment_method" :value="payMethod">
                            <button class="w-full bg-brand-600 text-white text-xs font-bold py-1.5 rounded-lg">تسوية الحساب ✓</button>
                        </form>
                        <form method="POST" action="{{ route('tables.clear', $table) }}" onsubmit="return confirm('إلغاء جميع طلبات {{ $table->name }}؟')">
                            @csrf
                            <button class="w-full bg-red-50 text-red-600 text-xs font-semibold py-1.5 rounded-lg">إلغاء الطلبات</button>
                        </form>
                    </div>
                @else
                    <a href="{{ route('pos.index') }}" class="block text-center text-xs text-brand-600 bg-brand-50 py-2 rounded-lg font-semibold">
                        + فتح طلب جديد
                    </a>
                @endif

                @can('manage menu')
                    <div class="flex gap-1 border-t pt-2">
                        <button @click='form = {{ Illuminate\Support\Js::from(["id"=>$table->id,"name"=>$table->name,"capacity"=>$table->capacity,"sort_order"=>$table->sort_order,"is_active"=>(bool)$table->is_active]) }}; open = true'
                                class="flex-1 p-1.5 text-slate-400 hover:text-brand-600 flex justify-center">
                            <x-icon name="edit" class="w-4 h-4" />
                        </button>
                        <form method="POST" action="{{ route('tables.destroy', $table) }}" onsubmit="return confirm('حذف الطاولة؟')">
                            @csrf @method('DELETE')
                            <button class="flex-1 p-1.5 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-4 h-4" /></button>
                        </form>
                    </div>
                @endcan
            </div>
        @empty
            <div class="col-span-full card p-10 text-center text-slate-400">
                لا توجد طاولات بعد.
                @can('manage menu')
                    <button @click="open = true" class="block mx-auto mt-3 text-brand-600 font-semibold text-sm underline">أضف أول طاولة</button>
                @endcan
            </div>
        @endforelse
    </div>

    {{-- Modal إضافة / تعديل طاولة --}}
    @can('manage menu')
        <div x-show="open" x-cloak class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40" @click.self="open = false">
            <div class="bg-white rounded-2xl p-6 w-full max-w-sm">
                <h3 class="font-bold text-lg mb-4" x-text="form.id ? 'تعديل طاولة' : 'طاولة جديدة'"></h3>
                <form :action="form.id ? '{{ url('tables') }}/' + form.id : '{{ route('tables.store') }}'" method="POST" class="space-y-3">
                    @csrf
                    <template x-if="form.id"><input type="hidden" name="_method" value="PUT"></template>
                    <div>
                        <label class="block text-sm font-semibold text-slate-600 mb-1">الاسم</label>
                        <input name="name" x-model="form.name" required placeholder="طاولة 1"
                               class="w-full px-3 py-2 rounded-xl border border-slate-200 focus:border-brand-500 outline-none">
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div>
                            <label class="block text-sm font-semibold text-slate-600 mb-1">عدد المقاعد</label>
                            <input type="number" name="capacity" x-model.number="form.capacity" min="1" max="100"
                                   class="w-full px-3 py-2 rounded-xl border border-slate-200">
                        </div>
                        <div>
                            <label class="block text-sm font-semibold text-slate-600 mb-1">الترتيب</label>
                            <input type="number" name="sort_order" x-model.number="form.sort_order" min="0"
                                   class="w-full px-3 py-2 rounded-xl border border-slate-200">
                        </div>
                    </div>
                    <label class="flex items-center gap-2 text-sm">
                        <input type="checkbox" name="is_active" value="1" x-model="form.is_active" class="rounded text-brand-600">
                        نشطة
                    </label>
                    <div class="flex gap-2 pt-2">
                        <button class="flex-1 bg-brand-600 text-white py-2.5 rounded-xl font-bold">حفظ</button>
                        <button type="button" @click="open = false" class="px-4 bg-slate-100 rounded-xl">إلغاء</button>
                    </div>
                </form>
            </div>
        </div>
    @endcan
</div>
@endsection
