@extends('layouts.app')
@section('title', 'لوحة التحكم')

@section('content')
<div class="space-y-6">
    {{-- ترحيب --}}
    <div class="card p-6 bg-gradient-to-l from-brand-600 to-emerald-700 text-white">
        <h2 class="text-xl font-bold">مرحباً، {{ auth()->user()->name }} 👋</h2>
        <p class="text-brand-100 text-sm mt-1">{{ arabic_date(now(), 'l، d F Y') }}</p>
    </div>

    {{-- بطاقات الإحصائيات --}}
    <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <x-stat label="مبيعات اليوم (صافي)" :value="money($todaySales['net'])" icon="money" color="brand"
                :sub="$todaySales['orders'].' طلب'" />
        <x-stat label="ربح اليوم" :value="money($todaySales['profit'])" icon="chart" color="violet" />
        <x-stat label="طلبات نشطة بالمطبخ" :value="$activeOrders" icon="kitchen" color="amber" />
        <x-stat label="مكوّنات منخفضة" :value="$lowStockCount" icon="box" color="melon" />
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {{-- رسم المبيعات --}}
        <div class="card p-6 lg:col-span-2">
            <h3 class="font-bold text-slate-700 mb-4">مبيعات آخر 14 يوماً</h3>
            <canvas id="salesChart" height="110"></canvas>
        </div>

        {{-- الأكثر مبيعاً --}}
        <div class="card p-6">
            <h3 class="font-bold text-slate-700 mb-4">الأكثر مبيعاً (هذا الشهر)</h3>
            <div class="space-y-3">
                @forelse ($bestSellers as $i => $b)
                    <div class="flex items-center justify-between">
                        <div class="flex items-center gap-2">
                            <span class="w-6 h-6 rounded-lg bg-brand-50 text-brand-700 text-xs font-bold flex items-center justify-center">{{ $i + 1 }}</span>
                            <span class="text-sm text-slate-700">{{ $b['name'] }}</span>
                        </div>
                        <span class="text-sm font-bold text-slate-500">{{ (int) $b['qty'] }}</span>
                    </div>
                @empty
                    <p class="text-sm text-slate-400 text-center py-6">لا توجد مبيعات بعد</p>
                @endforelse
            </div>
        </div>
    </div>

    {{-- أحدث الطلبات --}}
    <div class="card p-6">
        <div class="flex items-center justify-between mb-4">
            <h3 class="font-bold text-slate-700">أحدث الطلبات</h3>
            <a href="{{ route('orders.index') }}" class="text-sm text-brand-600 hover:underline">عرض الكل</a>
        </div>
        <div class="overflow-x-auto scrollbar-thin">
            <table class="w-full text-sm">
                <thead class="text-slate-400 text-right border-b">
                    <tr>
                        <th class="py-2 font-medium">الطلب</th>
                        <th class="py-2 font-medium">الكاشير</th>
                        <th class="py-2 font-medium">النوع</th>
                        <th class="py-2 font-medium">الإجمالي</th>
                        <th class="py-2 font-medium">الحالة</th>
                        <th class="py-2 font-medium">الوقت</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @forelse ($recentOrders as $order)
                        <tr class="hover:bg-slate-50">
                            <td class="py-3 font-bold text-slate-700">
                                <a href="{{ route('orders.show', $order) }}" class="hover:text-brand-600">#{{ $order->order_number }}</a>
                            </td>
                            <td class="py-3 text-slate-500">{{ $order->user?->name }}</td>
                            <td class="py-3">{{ $order->type_label }}</td>
                            <td class="py-3 font-semibold">{{ money($order->total) }}</td>
                            <td class="py-3"><x-order-status :status="$order->status" /></td>
                            <td class="py-3 text-slate-400">{{ $order->created_at->format('H:i') }}</td>
                        </tr>
                    @empty
                        <tr><td colspan="6" class="py-8 text-center text-slate-400">لا توجد طلبات</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const ctx = document.getElementById('salesChart');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: @json($series['labels']),
                datasets: [
                    { label: 'المبيعات', data: @json($series['net']), borderColor: '#16a34a', backgroundColor: 'rgba(22,163,74,.1)', fill: true, tension: .35 },
                    { label: 'الربح', data: @json($series['profit']), borderColor: '#7c3aed', backgroundColor: 'rgba(124,58,237,.08)', fill: true, tension: .35 },
                ]
            },
            options: {
                responsive: true,
                plugins: { legend: { labels: { font: { family: 'Cairo' } } } },
                scales: { x: { ticks: { font: { family: 'Cairo' } } }, y: { ticks: { font: { family: 'Cairo' } } } }
            }
        });
    });
</script>
@endpush
