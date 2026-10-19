@extends('layouts.app')
@section('title', 'نقطة البيع')

@section('content')
@php
    $menu = $categories->map(fn ($c) => [
        'id' => $c->id, 'name' => $c->name, 'color' => $c->color,
        'items' => $c->items->map(fn ($i) => [
            'id' => $i->id, 'name' => $i->name, 'price' => (float) $i->price, 'image' => $i->image_url,
        ])->values(),
    ])->values();
    $canDiscount = auth()->user()->can('apply discounts');
@endphp

<div x-data="posApp({
        menu: {{ Illuminate\Support\Js::from($menu) }},
        tables: {{ Illuminate\Support\Js::from($tables) }},
        canDiscount: {{ $canDiscount ? 'true' : 'false' }},
        storeUrl: '{{ route('orders.store') }}',
        tableApiBase: '{{ url('tables') }}',
        settleUrl: '{{ url('tables') }}',
     })"
     class="flex flex-col gap-3 pb-24 lg:pb-0 lg:h-[calc(100vh-9rem)]">

    @unless($activeShift)
        <div class="bg-amber-50 border border-amber-200 text-amber-800 px-4 py-3 rounded-xl text-sm shrink-0">
            ⚠️ لا توجد وردية مفتوحة.
            <a href="{{ route('shifts.index') }}" class="font-bold underline">فتح وردية</a>
        </div>
    @endunless

    {{-- ── اختيار الطاولة ──────────────────────────────────────────────── --}}
    @if ($tables->count())
        <div class="shrink-0 card p-3 lg:p-4">
            {{-- شريط الطاولات مع تمرير أفقي --}}
            <div class="flex items-center gap-2 overflow-x-auto scrollbar-thin pb-1">
                <span class="text-xs font-bold text-slate-500 shrink-0 ml-1">الطاولة:</span>

                <button @click="selectTable(null)"
                        :class="selectedTable === null
                                ? 'bg-brand-600 text-white ring-2 ring-brand-400'
                                : 'bg-slate-100 text-slate-600 hover:bg-slate-200'"
                        class="px-3 py-1.5 rounded-xl text-xs font-semibold transition whitespace-nowrap shrink-0">
                    سفري
                </button>

                <template x-for="t in tables" :key="t.id">
                    <button @click="selectTable(t)"
                            :class="{
                                'bg-melon-100 text-melon-700': t.status === 'occupied',
                                'bg-brand-50  text-brand-700': t.status !== 'occupied',
                                'ring-2 ring-offset-1 ring-melon-500': selectedTable?.id === t.id && t.status === 'occupied',
                                'ring-2 ring-offset-1 ring-brand-500': selectedTable?.id === t.id && t.status !== 'occupied',
                            }"
                            class="relative px-3 py-1.5 rounded-xl text-xs font-semibold transition whitespace-nowrap shrink-0">
                        <span x-text="t.name"></span>
                        <span x-show="t.status === 'occupied'"
                              x-text="t.orders_count || 0"
                              class="absolute -top-1.5 -left-1.5 w-4 h-4 bg-melon-500 text-white rounded-full text-[9px] flex items-center justify-center font-bold">
                        </span>
                    </button>
                </template>
            </div>

            {{-- فاتورة الطاولة المفتوحة --}}
            <div x-show="selectedTable && (selectedTable.status === 'occupied' || tableOrders.length)" x-cloak
                 class="mt-3 border-t pt-3">
                <div class="flex items-center justify-between mb-1.5">
                    <span class="text-sm font-bold text-slate-700">
                        فاتورة <span x-text="selectedTable?.name"></span>
                        <template x-if="tableOrders[0]">
                            <span class="text-slate-400 font-normal text-xs">· #<span x-text="tableOrders[0]?.order_number"></span></span>
                        </template>
                    </span>
                    <span class="font-extrabold text-melon-600 text-sm" x-text="format(tableRunningTotal)"></span>
                </div>
                <div class="space-y-0.5 max-h-32 overflow-y-auto scrollbar-thin">
                    <template x-if="tableOrders[0]">
                        <template x-for="it in tableOrders[0].items" :key="it.name + (it.notes || '')">
                            <div class="flex justify-between items-center text-xs bg-slate-50 rounded-lg px-2 py-1.5">
                                <div class="flex items-center gap-2 min-w-0">
                                    <span class="font-bold text-brand-600 shrink-0" x-text="'×' + it.quantity"></span>
                                    <span class="text-slate-700 truncate" x-text="it.name"></span>
                                    <span x-show="it.notes" class="text-amber-600 truncate" x-text="'📝 ' + it.notes"></span>
                                </div>
                                <span class="font-semibold text-slate-600 shrink-0 mr-2" x-text="format(it.total)"></span>
                            </div>
                        </template>
                    </template>
                    <p x-show="!tableOrders[0]" class="text-slate-400 text-xs text-center py-2">أضف أصنافاً لفتح الفاتورة</p>
                </div>
                <div class="mt-2 flex gap-2">
                    <button @click="openSettle()"
                            class="flex-1 bg-brand-600 text-white rounded-xl font-bold py-2 text-xs lg:text-sm">
                        تسوية الحساب وإغلاق الطاولة
                    </button>
                    <span class="hidden lg:inline text-xs text-slate-400 self-center">أو أضف أصنافاً ↓</span>
                </div>
            </div>
        </div>
    @endif

    {{-- ── القائمة + السلة (Side-by-side on lg, stacked with drawer on mobile) ── --}}
    <div class="flex-1 grid grid-cols-1 lg:grid-cols-3 gap-3 lg:gap-4 min-h-0">

        {{-- القائمة --}}
        <div class="lg:col-span-2 card p-3 lg:p-4 flex flex-col overflow-hidden">
            {{-- تبويبات التصنيفات --}}
            <div class="flex gap-1.5 lg:gap-2 overflow-x-auto scrollbar-thin pb-2 mb-3 shrink-0">
                <button @click="activeCat = 'all'"
                        :class="activeCat === 'all' ? 'bg-brand-600 text-white' : 'bg-slate-100 text-slate-600'"
                        class="px-3 py-1.5 lg:px-4 lg:py-2 rounded-xl text-xs lg:text-sm font-semibold whitespace-nowrap transition shrink-0">
                    الكل
                </button>
                <template x-for="cat in menu" :key="cat.id">
                    <button @click="activeCat = cat.id"
                            :class="activeCat === cat.id ? 'bg-brand-600 text-white' : 'bg-slate-100 text-slate-600'"
                            class="px-3 py-1.5 lg:px-4 lg:py-2 rounded-xl text-xs lg:text-sm font-semibold whitespace-nowrap transition shrink-0"
                            x-text="cat.name">
                    </button>
                </template>
            </div>

            {{-- شبكة الأصناف --}}
            <div class="flex-1 overflow-y-auto scrollbar-thin">
                <div class="grid grid-cols-3 sm:grid-cols-4 lg:grid-cols-3 xl:grid-cols-4 gap-2 lg:gap-3">
                    <template x-for="item in visibleItems" :key="item.id">
                        <button @click="addItem(item)"
                                class="group bg-white border-2 border-slate-100 rounded-2xl p-2 lg:p-3 text-right
                                       hover:border-brand-400 hover:shadow-md active:scale-95 transition-all flex flex-col">
                            {{-- صورة الصنف --}}
                            <div class="aspect-square w-full rounded-xl bg-slate-50 overflow-hidden mb-1.5 lg:mb-2">
                                <img :src="item.image" :alt="item.name"
                                     class="w-full h-full object-cover group-hover:scale-105 transition">
                            </div>
                            <span class="text-[11px] lg:text-sm font-semibold text-slate-700 line-clamp-2 leading-tight"
                                  x-text="item.name"></span>
                            <span class="text-brand-600 font-bold text-[11px] lg:text-sm mt-0.5 lg:mt-1"
                                  x-text="format(item.price)"></span>
                        </button>
                    </template>
                </div>
                <p x-show="visibleItems.length === 0" class="text-center text-slate-400 py-12">لا توجد أصناف</p>
            </div>
        </div>

        {{-- ── السلة (Desktop: column · Mobile: slide-up drawer) ─────────────── --}}

        {{-- زر السلة العائم (موبايل فقط) --}}
        <div x-show="cart.length > 0" x-cloak
             class="lg:hidden fixed bottom-0 left-0 right-0 z-40 p-3 bg-white border-t shadow-2xl">
            <button @click="cartOpen = !cartOpen"
                    class="w-full bg-brand-600 text-white rounded-2xl py-3.5 font-bold text-base flex items-center justify-between px-5 active:bg-brand-700 transition">
                <span class="flex items-center gap-2">
                    <span class="w-6 h-6 bg-white/20 rounded-full flex items-center justify-center text-sm font-extrabold"
                          x-text="cart.reduce((s,l)=>s+l.qty,0)"></span>
                    <span>السلة</span>
                </span>
                <div class="flex items-center gap-3">
                    <span class="font-extrabold" x-text="format(total)"></span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 transition-transform" :class="cartOpen ? 'rotate-180' : ''"
                         fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 15.75 7.5-7.5 7.5 7.5"/>
                    </svg>
                </div>
            </button>
        </div>

        {{-- درج السلة (موبايل: slide-over · Desktop: عمود ثابت) --}}
        {{-- خلفية معتمة خلف الدرج (موبايل) --}}
        <div x-show="cartOpen" x-cloak @click="cartOpen = false"
             class="lg:hidden fixed inset-0 z-40 bg-black/30 backdrop-blur-sm"></div>

        <div :class="cartOpen ? 'translate-y-0' : 'translate-y-full'"
             class="lg:translate-y-0 lg:static fixed bottom-0 left-0 right-0 z-50 max-h-[85vh]
                    lg:max-h-none lg:z-auto
                    card flex flex-col overflow-hidden
                    rounded-t-3xl lg:rounded-2xl
                    transition-transform duration-300 ease-in-out lg:transition-none">

            {{-- مقبض السحب (موبايل) --}}
            <div class="lg:hidden flex justify-center pt-2 pb-1 shrink-0">
                <div class="w-10 h-1 bg-slate-300 rounded-full"></div>
            </div>

            {{-- رأس السلة --}}
            <div class="px-4 pb-3 pt-2 lg:pt-4 border-b shrink-0">
                <div class="flex items-center justify-between mb-3">
                    <span class="font-bold text-slate-700 text-sm lg:text-base">
                        <template x-if="!selectedTable">سلة الطلب</template>
                        <template x-if="selectedTable">إضافة لـ <span class="text-brand-600" x-text="selectedTable.name"></span></template>
                    </span>
                    <button x-show="cart.length > 0" @click="cart = []"
                            class="text-xs text-red-400 hover:text-red-600 font-semibold">
                        مسح الكل
                    </button>
                </div>

                <template x-if="!selectedTable">
                    <div class="grid grid-cols-2 gap-2 mb-3">
                        <button @click="type = 'dine_in'"
                                :class="type === 'dine_in' ? 'bg-brand-600 text-white' : 'bg-slate-100 text-slate-600'"
                                class="py-2 rounded-xl text-sm font-bold transition">محلي</button>
                        <button @click="type = 'takeaway'"
                                :class="type === 'takeaway' ? 'bg-brand-600 text-white' : 'bg-slate-100 text-slate-600'"
                                class="py-2 rounded-xl text-sm font-bold transition">سفري</button>
                    </div>
                </template>

                <input type="text" x-model="customer"
                       placeholder="اسم العميل (اختياري)"
                       class="w-full px-3 py-2 rounded-xl border border-slate-200 focus:border-brand-500 outline-none text-sm">
            </div>

            {{-- أصناف السلة --}}
            <div class="flex-1 overflow-y-auto scrollbar-thin p-3 space-y-2 min-h-0">
                <template x-for="(line, idx) in cart" :key="line.uid">
                    <div class="bg-slate-50 rounded-xl p-3">
                        <div class="flex items-start justify-between gap-2">
                            <div class="min-w-0">
                                <div class="text-sm font-semibold text-slate-700" x-text="line.name"></div>
                                <div class="text-xs text-slate-400" x-text="format(line.price)"></div>
                            </div>
                            <button @click="removeLine(idx)" class="text-red-400 hover:text-red-600 shrink-0">
                                <x-icon name="trash" class="w-4 h-4" />
                            </button>
                        </div>
                        <div class="flex items-center justify-between mt-2">
                            <div class="flex items-center gap-1.5">
                                <button @click="line.qty = Math.max(1, line.qty - 1)"
                                        class="w-8 h-8 rounded-xl bg-white border text-slate-700 font-bold text-lg leading-none flex items-center justify-center">−</button>
                                <span class="w-8 text-center font-bold text-sm" x-text="line.qty"></span>
                                <button @click="line.qty++"
                                        class="w-8 h-8 rounded-xl bg-brand-600 text-white font-bold text-lg leading-none flex items-center justify-center">+</button>
                            </div>
                            <span class="font-bold text-slate-800 text-sm" x-text="format(lineNet(line))"></span>
                        </div>
                        <input type="text" x-model="line.notes" placeholder="ملاحظة للمطبخ"
                               class="w-full mt-2 px-2 py-1.5 rounded-lg border border-slate-200 text-xs outline-none focus:border-brand-400">
                        <template x-if="canDiscount">
                            <div class="flex gap-1.5 mt-2">
                                <select x-model="line.discountType"
                                        class="flex-1 px-2 py-1 rounded-lg border border-slate-200 text-xs bg-white">
                                    <option value="">بدون خصم</option>
                                    <option value="percent">٪ نسبة</option>
                                    <option value="fixed">مبلغ ثابت</option>
                                </select>
                                <input type="number" x-model.number="line.discountValue" min="0" placeholder="0"
                                       class="w-16 px-2 py-1 rounded-lg border border-slate-200 text-xs"
                                       :disabled="!line.discountType">
                            </div>
                        </template>
                    </div>
                </template>
                <div x-show="cart.length === 0"
                     class="flex flex-col items-center justify-center py-10 text-slate-400 gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-10 h-10 opacity-30" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.137a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z"/>
                    </svg>
                    <span class="text-sm">السلة فارغة</span>
                </div>
            </div>

            {{-- ملخص وزر الإرسال --}}
            <div class="border-t px-4 py-3 shrink-0 space-y-2 bg-white rounded-b-2xl lg:rounded-b-2xl">
                <div class="flex justify-between text-sm text-slate-500">
                    <span>المجموع</span>
                    <span x-text="format(subtotal)"></span>
                </div>
                <template x-if="canDiscount && !selectedTable">
                    <div class="flex items-center justify-between gap-2">
                        <span class="text-sm text-slate-500">خصم الفاتورة</span>
                        <div class="flex gap-1.5">
                            <select x-model="orderDiscountType"
                                    class="px-2 py-1 rounded-lg border border-slate-200 text-xs bg-white">
                                <option value="">بدون</option>
                                <option value="percent">٪</option>
                                <option value="fixed">مبلغ</option>
                            </select>
                            <input type="number" x-model.number="orderDiscountValue" min="0" placeholder="0"
                                   class="w-16 px-2 py-1 rounded-lg border border-slate-200 text-xs"
                                   :disabled="!orderDiscountType">
                        </div>
                    </div>
                </template>
                <div class="flex justify-between text-sm text-red-500" x-show="discountTotal > 0">
                    <span>الخصم</span>
                    <span x-text="'- ' + format(discountTotal)"></span>
                </div>
                <div class="flex justify-between font-extrabold text-slate-800 text-lg pt-1 border-t">
                    <span>الإجمالي</span>
                    <span x-text="format(total)"></span>
                </div>

                <template x-if="!selectedTable">
                    <select x-model="payment"
                            class="w-full px-3 py-2 rounded-xl border border-slate-200 text-sm bg-white">
                        <option value="cash">💵 نقدي</option>
                        <option value="card">💳 بطاقة</option>
                        <option value="transfer">📲 تحويل</option>
                    </select>
                </template>
                <template x-if="selectedTable">
                    <p class="text-xs text-slate-400 text-center">الدفع عند إغلاق الطاولة</p>
                </template>

                <button @click="submit()" :disabled="cart.length === 0 || loading"
                        class="w-full bg-brand-600 hover:bg-brand-700 active:bg-brand-800
                               disabled:opacity-40 text-white font-bold py-3.5 rounded-2xl
                               transition flex items-center justify-center gap-2 text-base">
                    <template x-if="!loading">
                        <span x-text="selectedTable ? '📨 إرسال للمطبخ' : '📨 إرسال للمطبخ'"></span>
                    </template>
                    <template x-if="loading">
                        <span class="flex items-center gap-2">
                            <svg class="animate-spin w-5 h-5" fill="none" viewBox="0 0 24 24">
                                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8z"></path>
                            </svg>
                            جاري الإرسال...
                        </span>
                    </template>
                </button>
            </div>
        </div>
    </div>

    {{-- ── Modal تسوية الطاولة ─────────────────────────────────────────── --}}
    <div x-show="settleOpen" x-cloak
         class="fixed inset-0 z-50 flex items-end sm:items-center justify-center p-0 sm:p-4 bg-black/40"
         @click.self="settleOpen = false">
        <div class="bg-white w-full sm:max-w-sm sm:rounded-2xl rounded-t-3xl p-6 shadow-2xl"
             x-show="settleOpen" x-transition>
            <div class="lg:hidden flex justify-center mb-4">
                <div class="w-10 h-1 bg-slate-300 rounded-full"></div>
            </div>
            <h3 class="font-bold text-xl mb-1">تسوية حساب <span x-text="selectedTable?.name"></span></h3>
            <p class="text-sm text-slate-500 mb-4">
                فاتورة واحدة ·
                <span x-text="tableOrders[0]?.items?.length ?? 0"></span> صنف ·
                إجمالي <span class="font-bold text-melon-600" x-text="format(tableRunningTotal)"></span>
            </p>
            <select x-model="settlePayment"
                    class="w-full px-3 py-3 rounded-xl border border-slate-200 mb-4 text-sm bg-white">
                <option value="cash">💵 نقدي</option>
                <option value="card">💳 بطاقة</option>
                <option value="transfer">📲 تحويل</option>
            </select>
            <div class="flex gap-2">
                <button @click="settle()" :disabled="loading"
                        class="flex-1 bg-brand-600 text-white py-3.5 rounded-2xl font-bold text-base">
                    تأكيد التسوية ✓
                </button>
                <button @click="settleOpen = false"
                        class="px-5 bg-slate-100 rounded-2xl font-semibold text-slate-600">
                    إلغاء
                </button>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
function posApp(config) {
    return {
        menu: config.menu,
        tables: config.tables,
        canDiscount: config.canDiscount,
        storeUrl: config.storeUrl,
        tableApiBase: config.tableApiBase,
        settleUrl: config.settleUrl,

        activeCat: 'all',
        cart: [],
        type: 'dine_in',
        customer: '',
        payment: 'cash',
        orderDiscountType: '',
        orderDiscountValue: 0,
        loading: false,
        uidSeq: 1,
        cartOpen: window.innerWidth >= 1024,

        selectedTable: null,
        tableOrders: [],
        settleOpen: false,
        settlePayment: 'cash',

        get visibleItems() {
            if (this.activeCat === 'all') return this.menu.flatMap(c => c.items);
            return (this.menu.find(c => c.id === this.activeCat)?.items) || [];
        },
        format(n) {
            return Number(n).toLocaleString('ar-EG', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) + ' {{ \App\Models\Setting::get('currency', 'ل.س') }}';
        },

        async selectTable(t) {
            this.selectedTable = t;
            this.tableOrders = [];
            if (t) await this.refreshTableOrders();
        },

        async refreshTableOrders() {
            if (!this.selectedTable) return;
            try {
                const res = await fetch(`${this.tableApiBase}/${this.selectedTable.id}`, { headers: { 'Accept': 'application/json' } });
                const data = await res.json();
                this.tableOrders = data.table.orders;
                this.selectedTable = {
                    ...this.selectedTable,
                    status: data.table.status,
                    running_total: data.table.running_total,
                    orders_count: data.table.orders[0]?.items?.length ?? 0,
                };
                const idx = this.tables.findIndex(x => x.id === this.selectedTable.id);
                if (idx >= 0) {
                    this.tables[idx] = {
                        ...this.tables[idx],
                        status: data.table.status,
                        running_total: data.table.running_total,
                        orders_count: data.table.orders[0]?.items?.length ?? 0,
                    };
                }
            } catch (e) {}
        },
        get tableRunningTotal() {
            return this.tableOrders.reduce((s, o) => s + o.total, 0);
        },

        addItem(item) {
            const existing = this.cart.find(l => l.id === item.id && !l.notes && !l.discountType);
            if (existing) { existing.qty++; return; }
            this.cart.push({ uid: this.uidSeq++, id: item.id, name: item.name, price: item.price, qty: 1, notes: '', discountType: '', discountValue: 0 });
            // على الموبايل افتح السلة تلقائياً عند إضافة أول صنف
            if (window.innerWidth < 1024 && this.cart.length === 1) this.cartOpen = true;
        },
        removeLine(idx) { this.cart.splice(idx, 1); },

        lineDiscount(line) {
            const base = line.price * line.qty;
            if (!line.discountType || !line.discountValue) return 0;
            if (line.discountType === 'percent') return base * (Math.min(Math.max(line.discountValue, 5), 100) / 100);
            return Math.min(line.discountValue, base);
        },
        lineNet(line) { return line.price * line.qty - this.lineDiscount(line); },
        get subtotal() { return this.cart.reduce((s, l) => s + l.price * l.qty, 0); },
        get itemDiscount() { return this.cart.reduce((s, l) => s + this.lineDiscount(l), 0); },
        get orderDiscount() {
            const base = this.subtotal - this.itemDiscount;
            if (!this.orderDiscountType || !this.orderDiscountValue) return 0;
            if (this.orderDiscountType === 'percent') return base * (Math.min(Math.max(this.orderDiscountValue, 5), 100) / 100);
            return Math.min(this.orderDiscountValue, base);
        },
        get discountTotal() { return this.itemDiscount + this.orderDiscount; },
        get total() { return Math.max(0, this.subtotal - this.discountTotal); },

        async submit() {
            if (this.cart.length === 0) return;
            this.loading = true;
            const payload = {
                type: this.selectedTable ? 'dine_in' : this.type,
                table_id: this.selectedTable?.id ?? null,
                customer_name: this.customer,
                payment_method: this.payment,
                is_paid: !this.selectedTable,
                discount: (!this.selectedTable && this.orderDiscountType) ? { type: this.orderDiscountType, value: this.orderDiscountValue } : null,
                items: this.cart.map(l => ({
                    item_id: l.id, quantity: l.qty, notes: l.notes,
                    discount: l.discountType ? { type: l.discountType, value: l.discountValue } : null,
                })),
            };
            try {
                const res = await fetch(this.storeUrl, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', 'X-CSRF-TOKEN': document.querySelector('meta[name=csrf-token]').content },
                    body: JSON.stringify(payload),
                });
                const text = await res.text();
                let data;
                try { data = JSON.parse(text); }
                catch { throw new Error(res.ok ? 'استجابة غير صالحة من الخادم' : `خطأ من الخادم (${res.status}). تأكد من اتصال قاعدة البيانات أو سجّل الدخول من جديد.`); }
                if (!res.ok) throw new Error(data.message || 'حدث خطأ');
                this.cart = []; this.customer = ''; this.orderDiscountType = ''; this.orderDiscountValue = 0;
                if (window.innerWidth < 1024) this.cartOpen = false;

                if (this.selectedTable) {
                    await this.refreshTableOrders();
                } else {
                    window.open(data.invoice_url, '_blank');
                }
            } catch (e) {
                alert(e.message);
            } finally {
                this.loading = false;
            }
        },

        openSettle() { this.settleOpen = true; },
        async settle() {
            this.loading = true;
            try {
                const res = await fetch(`${this.settleUrl}/${this.selectedTable.id}/settle`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', 'X-CSRF-TOKEN': document.querySelector('meta[name=csrf-token]').content },
                    body: JSON.stringify({ payment_method: this.settlePayment }),
                });
                const data = await res.json();
                if (!res.ok) throw new Error(data.message || 'حدث خطأ');
                alert(`✅ ${data.message}\nالمجموع: ${this.format(data.summary.total)}`);
                const t = this.tables.find(x => x.id === this.selectedTable.id);
                if (t) { t.status = 'available'; t.orders_count = 0; t.running_total = 0; }
                this.selectedTable = null;
                this.tableOrders = [];
                this.settleOpen = false;
            } catch (e) {
                alert(e.message);
            } finally {
                this.loading = false;
            }
        },
    };
}
</script>
@endpush
