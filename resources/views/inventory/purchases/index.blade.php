@extends('layouts.app')
@section('title', 'المشتريات')

@section('content')
<div class="flex justify-between items-center mb-4">
    <h2 class="text-lg font-bold text-slate-700">فواتير المشتريات</h2>
    <a href="{{ route('inventory.purchases.create') }}" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2">
        <x-icon name="plus" class="w-5 h-5" /> فاتورة شراء
    </a>
</div>

<div class="card p-5 overflow-x-auto scrollbar-thin">
    <table class="w-full text-sm">
        <thead class="text-slate-400 text-right border-b">
            <tr><th class="py-2">المرجع</th><th class="py-2">المورد</th><th class="py-2">الإجمالي</th><th class="py-2">المستخدم</th><th class="py-2">التاريخ</th><th class="py-2"></th></tr>
        </thead>
        <tbody class="divide-y">
            @forelse ($purchases as $p)
                <tr class="hover:bg-slate-50">
                    <td class="py-3 font-bold">{{ $p->reference }}</td>
                    <td class="py-3 text-slate-500">{{ $p->supplier?->name ?? 'بدون مورد' }}</td>
                    <td class="py-3 font-semibold">{{ money($p->total) }}</td>
                    <td class="py-3 text-slate-500">{{ $p->user?->name }}</td>
                    <td class="py-3 text-slate-400">{{ $p->purchased_at->format('Y-m-d') }}</td>
                    <td class="py-3"><a href="{{ route('inventory.purchases.show', $p) }}" class="text-brand-600 hover:underline">عرض</a></td>
                </tr>
            @empty
                <tr><td colspan="6" class="py-10 text-center text-slate-400">لا توجد مشتريات</td></tr>
            @endforelse
        </tbody>
    </table>
</div>
<div class="mt-4">{{ $purchases->links() }}</div>
@endsection
