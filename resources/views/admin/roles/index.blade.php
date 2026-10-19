@extends('layouts.app')
@section('title', 'الأدوار والصلاحيات')

@section('content')
<div class="space-y-6">
    @foreach ($roles as $role)
        <div class="card p-6">
            <form method="POST" action="{{ route('admin.roles.update', $role) }}">
                @csrf @method('PUT')
                <div class="flex items-center justify-between mb-4">
                    <div>
                        <h3 class="font-bold text-slate-700">{{ $role->name }}</h3>
                        <span class="text-xs text-slate-400">{{ $role->users_count }} مستخدم · {{ $role->permissions->count() }} صلاحية</span>
                    </div>
                    @if ($role->name !== 'مدير')
                        <button class="bg-brand-600 text-white px-4 py-2 rounded-xl text-sm font-semibold">حفظ</button>
                    @else
                        <span class="text-xs text-slate-400">المدير يملك جميع الصلاحيات</span>
                    @endif
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2">
                    @foreach ($permissions as $perm)
                        <label class="flex items-center gap-2 text-sm px-3 py-2 rounded-xl bg-slate-50 {{ $role->name === 'مدير' ? 'opacity-60' : '' }}">
                            <input type="checkbox" name="permissions[]" value="{{ $perm->name }}"
                                   @checked($role->hasPermissionTo($perm->name)) @disabled($role->name === 'مدير')
                                   class="rounded text-brand-600">
                            {{ $labels[$perm->name] ?? $perm->name }}
                        </label>
                    @endforeach
                </div>
            </form>
        </div>
    @endforeach
</div>
@endsection
