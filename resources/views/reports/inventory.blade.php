@extends('layouts.app')
@section('title', 'تقرير استهلاك المخزون')

@section('content')
<div class="space-y-6">
    <form method="GET" class="card p-4 flex flex-wrap gap-3 items-end">
        <div><label class="block text-xs text-slate-500 mb-1">من</label><input type="date" name="from" value="{{ $from->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <div><label class="block text-xs text-slate-500 mb-1">إلى</label><input type="date" name="to" value="{{ $to->toDateString() }}" class="px-3 py-2 rounded-xl border border-slate-200"></div>
        <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">عرض</button>
        <a href="{{ route('reports.index', request()->query()) }}" class="px-4 py-2 bg-slate-100 rounded-xl text-sm ms-auto">رجوع</a>
    </form>

    <div class="card p-5 overflow-x-auto scrollbar-thin">
        <h3 class="font-bold text-slate-700 mb-4">المكوّنات المستهلكة في المبيعات</h3>
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">المكوّن</th><th class="py-2">الكمية المستهلكة</th><th class="py-2">تكلفة الاستهلاك</th></tr></thead>
            <tbody class="divide-y">
                @forelse ($consumption as $c)
                    <tr><td class="py-3 font-semibold">{{ $c['ingredient'] }}</td><td class="py-3">{{ number_format($c['consumed'], 3) }}</td><td class="py-3 font-bold">{{ money($c['cost']) }}</td></tr>
                @empty <tr><td colspan="3" class="py-10 text-center text-slate-400">لا توجد بيانات استهلاك</td></tr> @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
