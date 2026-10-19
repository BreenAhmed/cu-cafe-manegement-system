@extends('layouts.app')
@section('title', $user->exists ? 'تعديل مستخدم' : 'مستخدم جديد')

@section('content')
<div class="max-w-xl">
    <form method="POST" action="{{ $user->exists ? route('admin.users.update', $user) : route('admin.users.store') }}" class="card p-6 space-y-4">
        @csrf
        @if ($user->exists) @method('PUT') @endif

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">الاسم</label>
                <input name="name" value="{{ old('name', $user->name) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">الهاتف</label>
                <input name="phone" value="{{ old('phone', $user->phone) }}" class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
        </div>
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">البريد الإلكتروني</label>
            <input type="email" name="email" value="{{ old('email', $user->email) }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
        </div>
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">الدور</label>
            <select name="role" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
                @foreach ($roles as $role)
                    <option value="{{ $role->name }}" @selected(old('role', $user->roles->pluck('name')->first()) === $role->name)>{{ $role->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">كلمة المرور {{ $user->exists ? '(اتركها فارغة للإبقاء)' : '' }}</label>
                <input type="password" name="password" class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">تأكيد كلمة المرور</label>
                <input type="password" name="password_confirmation" class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
        </div>
        <label class="flex items-center gap-2 text-sm"><input type="checkbox" name="is_active" value="1" @checked(old('is_active', $user->is_active ?? true)) class="rounded text-brand-600"> حساب نشط</label>

        <div class="flex gap-2 pt-2">
            <button class="flex-1 bg-brand-600 text-white py-2.5 rounded-xl font-bold">حفظ</button>
            <a href="{{ route('admin.users.index') }}" class="px-4 py-2.5 bg-slate-100 rounded-xl">إلغاء</a>
        </div>
    </form>
</div>
@endsection
