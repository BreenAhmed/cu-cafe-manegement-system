@extends('layouts.app')
@section('title', 'شاشة المطبخ')

@section('content')
<div x-data="kitchenBoard({ feedUrl: '{{ route('kitchen.feed') }}', statusUrl: '{{ url('kitchen') }}', canUpdate: {{ auth()->user()->can('update order status') ? 'true' : 'false' }} })"
     x-init="init()" class="space-y-4">

    <div class="flex items-center justify-between flex-wrap gap-3">
        <div class="flex items-center gap-2">
            <span class="w-2.5 h-2.5 rounded-full" :class="connected ? 'bg-brand-500 animate-pulse' : 'bg-slate-300'"></span>
            <span class="text-sm text-slate-500" x-text="connected ? 'متصل مباشرة' : 'وضع التحديث الدوري'"></span>
        </div>
        <div class="flex gap-2 text-sm">
            <span class="px-3 py-1 rounded-full bg-blue-100 text-blue-700 font-semibold">جديد: <span x-text="byStatus('new').length"></span></span>
            <span class="px-3 py-1 rounded-full bg-amber-100 text-amber-700 font-semibold">قيد التحضير: <span x-text="byStatus('preparing').length"></span></span>
            <span class="px-3 py-1 rounded-full bg-brand-100 text-brand-700 font-semibold">جاهز: <span x-text="byStatus('ready').length"></span></span>
        </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <template x-for="col in columns" :key="col.status">
            <div class="bg-slate-200/60 rounded-2xl p-3 min-h-[60vh]">
                <div class="flex items-center justify-between px-2 py-2 mb-2">
                    <h3 class="font-bold text-slate-700" x-text="col.label"></h3>
                    <span class="text-xs bg-white px-2 py-0.5 rounded-full text-slate-500" x-text="byStatus(col.status).length"></span>
                </div>
                <div class="space-y-3">
                    <template x-for="order in byStatus(col.status)" :key="order.id">
                        <div class="bg-white rounded-2xl shadow-sm border-r-4 p-3 animate-pop"
                             :class="{'border-blue-400': order.status==='new','border-amber-400': order.status==='preparing','border-brand-400': order.status==='ready'}">
                            <div class="flex items-center justify-between">
                                <span class="font-extrabold text-slate-800">#<span x-text="order.order_number"></span></span>
                                <span class="text-xs px-2 py-0.5 rounded-full"
                                      :class="order.type==='dine_in' ? 'bg-brand-50 text-brand-700' : 'bg-violet-50 text-violet-700'"
                                      x-text="order.type_label"></span>
                            </div>
                            <div class="text-xs text-slate-400 mt-0.5 flex items-center gap-2">
                                <span x-text="order.created_human"></span>
                                <span x-show="order.table_name" class="font-semibold text-brand-700" x-text="'🪑 ' + order.table_name"></span>
                                <span x-show="order.customer_name && !order.table_name" x-text="'· ' + order.customer_name"></span>
                            </div>
                            <ul class="mt-2 space-y-1">
                                <template x-for="it in order.items" :key="it.name + it.notes">
                                    <li class="text-sm text-slate-700">
                                        <span class="font-bold text-brand-600" x-text="'×' + it.quantity"></span>
                                        <span x-text="it.name"></span>
                                        <span x-show="it.notes" class="block text-xs text-amber-600 pr-5" x-text="'📝 ' + it.notes"></span>
                                    </li>
                                </template>
                            </ul>
                            <div x-show="order.notes" class="mt-2 text-xs bg-amber-50 text-amber-700 rounded-lg px-2 py-1" x-text="order.notes"></div>

                            <div class="mt-3 flex gap-2" x-show="canUpdate">
                                <button x-show="order.status==='new'" @click="setStatus(order, 'preparing')"
                                        class="flex-1 bg-amber-500 hover:bg-amber-600 text-white text-sm font-bold py-2 rounded-xl">بدء التحضير</button>
                                <button x-show="order.status==='preparing'" @click="setStatus(order, 'ready')"
                                        class="flex-1 bg-brand-600 hover:bg-brand-700 text-white text-sm font-bold py-2 rounded-xl">جاهز</button>
                                <button x-show="order.status==='ready'" @click="setStatus(order, 'delivered')"
                                        class="flex-1 bg-slate-700 hover:bg-slate-800 text-white text-sm font-bold py-2 rounded-xl">تم التسليم</button>
                            </div>
                        </div>
                    </template>
                    <p x-show="byStatus(col.status).length === 0" class="text-center text-slate-400 text-sm py-8">لا توجد طلبات</p>
                </div>
            </div>
        </template>
    </div>

    <audio id="newOrderSound" preload="auto" src="data:audio/wav;base64,UklGRl9vT19XQVZFZm10IBAAAAABAAEAQB8AAEAfAAABAAgAZGF0YQAAAAA="></audio>
</div>
@endsection

@push('scripts')
<script>
function kitchenBoard(config) {
    return {
        orders: [],
        connected: false,
        canUpdate: config.canUpdate,
        columns: [
            { status: 'new', label: 'جديد' },
            { status: 'preparing', label: 'قيد التحضير' },
            { status: 'ready', label: 'جاهز' },
        ],
        byStatus(s) { return this.orders.filter(o => o.status === s); },

        async init() {
            await this.load();
            this.subscribe();
            setInterval(() => this.load(), 12000); // تحديث دوري احتياطي
        },
        async load() {
            try {
                const res = await fetch(config.feedUrl, { headers: { 'Accept': 'application/json' } });
                const data = await res.json();
                this.orders = data.orders;
            } catch (e) {}
        },
        subscribe() {
            if (!window.Echo) return;
            try {
                window.Echo.private('kitchen')
                    .listen('.order.created', (e) => {
                        const existing = this.orders.find(o => o.id === e.order.id);
                        if (existing) {
                            // طلب موجود تمت إضافة أصناف جديدة إليه — حدّث بياناته
                            Object.assign(existing, e.order);
                        } else {
                            // طلب جديد — أضفه للقمة
                            this.orders.unshift(e.order);
                            this.notify();
                        }
                    })
                    .listen('.order.status', (e) => {
                        const o = this.orders.find(x => x.id === e.id);
                        if (o) o.status = e.status;
                        if (['delivered','cancelled'].includes(e.status)) {
                            this.orders = this.orders.filter(x => x.id !== e.id);
                        }
                    });
                // Check if already connected (connection established before binding)
                if (window.Echo.connector.pusher.connection.state === 'connected') {
                    this.connected = true;
                }
                window.Echo.connector.pusher.connection.bind('connected', () => this.connected = true);
                window.Echo.connector.pusher.connection.bind('disconnected', () => this.connected = false);
                window.Echo.connector.pusher.connection.bind('unavailable', () => this.connected = false);
            } catch (e) {}
        },
        notify() {
            try { document.getElementById('newOrderSound').play(); } catch (e) {}
        },
        async setStatus(order, status) {
            const prev = order.status;
            order.status = status;
            if (status === 'delivered') this.orders = this.orders.filter(o => o.id !== order.id);
            try {
                await fetch(`${config.statusUrl}/${order.id}/status`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', 'Accept': 'application/json', 'X-CSRF-TOKEN': document.querySelector('meta[name=csrf-token]').content },
                    body: JSON.stringify({ status }),
                });
            } catch (e) { order.status = prev; this.load(); }
        },
    };
}
</script>
@endpush
