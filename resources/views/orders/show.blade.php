@extends('layouts.app')
@section('title', 'تفاصيل الطلب #' . $order->order_number)

@section('content')
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
    <div class="lg:col-span-2 card p-6">
        <div class="flex items-center justify-between mb-4">
            <h2 class="text-lg font-bold">الأصناف</h2>
            <x-order-status :status="$order->status" />
        </div>
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b">
                <tr><th class="py-2">الصنف</th><th class="py-2">السعر</th><th class="py-2">الكمية</th><th class="py-2">الخصم</th><th class="py-2">الصافي</th></tr>
            </thead>
            <tbody class="divide-y">
                @foreach ($order->items as $item)
                    <tr>
                        <td class="py-3 font-semibold text-slate-700">{{ $item->name }}
                            @if($item->notes)<span class="block text-xs text-amber-600">{{ $item->notes }}</span>@endif
                        </td>
                        <td class="py-3">{{ money($item->unit_price) }}</td>
                        <td class="py-3">{{ $item->quantity }}</td>
                        <td class="py-3 text-melon-600">{{ $item->discount_amount > 0 ? '- '.money($item->discount_amount) : '—' }}</td>
                        <td class="py-3 font-bold">{{ money($item->net_total) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <div class="mt-6 flex flex-wrap gap-2">
            <a href="{{ route('orders.invoice', $order) }}" target="_blank" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2"><x-icon name="printer" class="w-5 h-5" /> الفاتورة</a>
            @if ($order->status !== 'cancelled' && auth()->user()->canAny(['use pos', 'manage accounting']))
                <form method="POST" action="{{ route('orders.cancel', $order) }}" onsubmit="return confirm('هل تريد إلغاء هذا الطلب؟ سيتم عكس آثاره على المخزون والحسابات.')">
                    @csrf
                    <button class="bg-red-50 text-red-600 px-4 py-2 rounded-xl font-semibold">إلغاء الطلب</button>
                </form>
            @endif
        </div>
    </div>

    <div class="space-y-4">
        <div class="card p-6 space-y-2 text-sm">
            <div class="flex justify-between"><span class="text-slate-500">رقم الفاتورة</span><span class="font-semibold">{{ $order->invoice_number }}</span></div>
            <div class="flex justify-between"><span class="text-slate-500">الكاشير</span><span>{{ $order->user?->name }}</span></div>
            <div class="flex justify-between"><span class="text-slate-500">النوع</span><span>{{ $order->type_label }}</span></div>
            <div class="flex justify-between"><span class="text-slate-500">طريقة الدفع</span><span>{{ $order->payment_method_label }}</span></div>
            <div class="flex justify-between"><span class="text-slate-500">التاريخ</span><span>{{ $order->created_at->format('Y-m-d H:i') }}</span></div>
            @if($order->prep_duration !== null)
                <div class="flex justify-between"><span class="text-slate-500">زمن التحضير</span><span>{{ $order->prep_duration }} دقيقة</span></div>
            @endif
        </div>

        <div class="card p-6 space-y-2 text-sm">
            <div class="flex justify-between"><span class="text-slate-500">المجموع</span><span>{{ money($order->subtotal) }}</span></div>
            <div class="flex justify-between text-melon-600"><span>الخصم</span><span>- {{ money($order->discount_total) }}</span></div>
            <div class="flex justify-between"><span class="text-slate-500">التكلفة</span><span>{{ money($order->cost_total) }}</span></div>
            <div class="flex justify-between text-violet-600"><span>الربح</span><span>{{ money($order->profit) }}</span></div>
            <div class="flex justify-between text-lg font-extrabold pt-2 border-t"><span>الإجمالي</span><span>{{ money($order->total) }}</span></div>
        </div>
    </div>
</div>
@endsection
