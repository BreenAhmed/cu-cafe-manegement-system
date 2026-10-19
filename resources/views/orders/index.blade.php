@extends('layouts.app')
@section('title', 'الطلبات')

@section('content')
<div class="card p-5">
    <form method="GET" class="flex flex-wrap gap-3 mb-4">
        <div class="relative flex-1 min-w-48">
            <input type="text" name="q" value="{{ request('q') }}" placeholder="بحث برقم الطلب أو العميل"
                   class="w-full pr-10 pl-3 py-2 rounded-xl border border-slate-200 outline-none focus:border-brand-500">
            <span class="absolute right-3 top-2.5 text-slate-400"><x-icon name="search" class="w-5 h-5" /></span>
        </div>
        <select name="status" class="px-3 py-2 rounded-xl border border-slate-200">
            <option value="">كل الحالات</option>
            @foreach (\App\Models\Order::statuses() as $key => $label)
                <option value="{{ $key }}" @selected(request('status') === $key)>{{ $label }}</option>
            @endforeach
        </select>
        <input type="date" name="date" value="{{ request('date') }}" class="px-3 py-2 rounded-xl border border-slate-200">
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">تصفية</button>
    </form>

    <div class="overflow-x-auto scrollbar-thin">
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b">
                <tr>
                    <th class="py-2 font-medium">الطلب</th>
                    <th class="py-2 font-medium">العميل</th>
                    <th class="py-2 font-medium">الكاشير</th>
                    <th class="py-2 font-medium">النوع</th>
                    <th class="py-2 font-medium">الإجمالي</th>
                    <th class="py-2 font-medium">الحالة</th>
                    <th class="py-2 font-medium">التاريخ</th>
                    <th class="py-2 font-medium"></th>
                </tr>
            </thead>
            <tbody class="divide-y">
                @forelse ($orders as $order)
                    <tr class="hover:bg-slate-50">
                        <td class="py-3 font-bold">#{{ $order->order_number }}</td>
                        <td class="py-3 text-slate-500">{{ $order->customer_name ?? '—' }}</td>
                        <td class="py-3 text-slate-500">{{ $order->user?->name }}</td>
                        <td class="py-3">{{ $order->type_label }}</td>
                        <td class="py-3 font-semibold">{{ money($order->total) }}</td>
                        <td class="py-3"><x-order-status :status="$order->status" /></td>
                        <td class="py-3 text-slate-400">{{ $order->created_at->format('Y-m-d H:i') }}</td>
                        <td class="py-3"><a href="{{ route('orders.show', $order) }}" class="text-brand-600 hover:underline">تفاصيل</a></td>
                    </tr>
                @empty
                    <tr><td colspan="8" class="py-10 text-center text-slate-400">لا توجد طلبات</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <div class="mt-4">{{ $orders->links() }}</div>
</div>
@endsection
