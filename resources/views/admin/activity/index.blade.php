@extends('layouts.app')
@section('title', 'سجل التدقيق')

@section('content')
<form method="GET" class="card p-4 mb-4 flex gap-3">
    <select name="log" class="px-3 py-2 rounded-xl border border-slate-200">
        <option value="">كل السجلات</option>
        @foreach ($logs as $log)<option value="{{ $log }}" @selected(request('log')===$log)>{{ $log }}</option>@endforeach
    </select>
    <button class="bg-brand-600 text-white px-5 py-2 rounded-xl font-semibold">تصفية</button>
</form>

<div class="card p-5 overflow-x-auto scrollbar-thin">
    <table class="w-full text-sm">
        <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">الحدث</th><th class="py-2">الوصف</th><th class="py-2">المستخدم</th><th class="py-2">السجل</th><th class="py-2">التاريخ</th></tr></thead>
        <tbody class="divide-y">
            @forelse ($activities as $a)
                <tr class="hover:bg-slate-50">
                    <td class="py-3"><span class="px-2 py-0.5 rounded-full text-xs bg-slate-100">{{ ['created'=>'إنشاء','updated'=>'تعديل','deleted'=>'حذف'][$a->event] ?? $a->event }}</span></td>
                    <td class="py-3 text-slate-600">{{ $a->description }}</td>
                    <td class="py-3 text-slate-500">{{ $a->causer?->name ?? 'النظام' }}</td>
                    <td class="py-3 text-slate-400">{{ $a->log_name }}</td>
                    <td class="py-3 text-slate-400">{{ $a->created_at->format('Y-m-d H:i') }}</td>
                </tr>
            @empty
                <tr><td colspan="5" class="py-10 text-center text-slate-400">لا توجد سجلات</td></tr>
            @endforelse
        </tbody>
    </table>
</div>
<div class="mt-4">{{ $activities->links() }}</div>
@endsection
