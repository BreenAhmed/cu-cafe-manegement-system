@extends('layouts.app')
@section('title', 'المستخدمون')

@section('content')
<div class="flex justify-between items-center mb-4">
    <h2 class="text-lg font-bold text-slate-700">المستخدمون والموظفون</h2>
    <a href="{{ route('admin.users.create') }}" class="bg-brand-600 text-white px-4 py-2 rounded-xl font-semibold flex items-center gap-2"><x-icon name="plus" class="w-5 h-5" /> مستخدم جديد</a>
</div>

<div class="card p-5">
    <form method="GET" class="mb-4">
        <input type="text" name="q" value="{{ request('q') }}" placeholder="بحث بالاسم أو البريد" class="w-full sm:w-80 px-3 py-2 rounded-xl border border-slate-200 outline-none focus:border-brand-500">
    </form>
    <div class="overflow-x-auto scrollbar-thin">
        <table class="w-full text-sm">
            <thead class="text-slate-400 text-right border-b"><tr><th class="py-2">المستخدم</th><th class="py-2">البريد</th><th class="py-2">الدور</th><th class="py-2">الحالة</th><th class="py-2">آخر دخول</th><th class="py-2"></th></tr></thead>
            <tbody class="divide-y">
                @forelse ($users as $user)
                    <tr class="hover:bg-slate-50">
                        <td class="py-3 font-semibold text-slate-700 flex items-center gap-2">
                            <span class="w-8 h-8 rounded-full bg-brand-100 text-brand-700 flex items-center justify-center font-bold">{{ mb_substr($user->name,0,1) }}</span>
                            {{ $user->name }}
                        </td>
                        <td class="py-3 text-slate-500">{{ $user->email }}</td>
                        <td class="py-3"><span class="px-2 py-0.5 rounded-full bg-slate-100 text-xs">{{ $user->roles->pluck('name')->first() ?? '—' }}</span></td>
                        <td class="py-3"><span class="px-2 py-0.5 rounded-full text-xs {{ $user->is_active ? 'bg-brand-100 text-brand-700' : 'bg-red-100 text-red-600' }}">{{ $user->is_active ? 'نشط' : 'موقوف' }}</span></td>
                        <td class="py-3 text-slate-400">{{ $user->last_login_at?->diffForHumans() ?? '—' }}</td>
                        <td class="py-3">
                            <div class="flex gap-1">
                                <a href="{{ route('admin.users.edit', $user) }}" class="p-2 text-slate-400 hover:text-brand-600"><x-icon name="edit" class="w-5 h-5" /></a>
                                <form method="POST" action="{{ route('admin.users.destroy', $user) }}" onsubmit="return confirm('حذف المستخدم؟')">@csrf @method('DELETE')<button class="p-2 text-slate-400 hover:text-red-600"><x-icon name="trash" class="w-5 h-5" /></button></form>
                            </div>
                        </td>
                    </tr>
                @empty
                    <tr><td colspan="6" class="py-10 text-center text-slate-400">لا يوجد مستخدمون</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $users->links() }}</div>
</div>
@endsection
