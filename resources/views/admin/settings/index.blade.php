@extends('layouts.app')
@section('title', 'إعدادات النظام')

@section('content')
<div class="max-w-2xl space-y-6">
    <form method="POST" action="{{ route('admin.settings.update') }}" class="card p-6 space-y-4">
        @csrf @method('PUT')
        <h3 class="font-bold text-slate-700">الإعدادات العامة</h3>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">اسم العلامة التجارية</label>
                <input name="brand_name" value="{{ $settings['brand_name'] ?? 'CU' }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">العملة</label>
                <input name="currency" value="{{ $settings['currency'] ?? 'ل.س' }}" required class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">الهاتف</label>
                <input name="phone" value="{{ $settings['phone'] ?? '' }}" class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
            <div>
                <label class="block text-sm font-semibold text-slate-600 mb-1">نسبة الضريبة (٪)</label>
                <input type="number" name="tax_rate" value="{{ $settings['tax_rate'] ?? 0 }}" class="w-full px-3 py-2 rounded-xl border border-slate-200">
            </div>
        </div>
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">العنوان</label>
            <input name="address" value="{{ $settings['address'] ?? '' }}" class="w-full px-3 py-2 rounded-xl border border-slate-200">
        </div>
        <div>
            <label class="block text-sm font-semibold text-slate-600 mb-1">تذييل الفاتورة</label>
            <input name="invoice_footer" value="{{ $settings['invoice_footer'] ?? 'شكراً لزيارتكم!' }}" class="w-full px-3 py-2 rounded-xl border border-slate-200">
        </div>
        <button class="bg-brand-600 text-white px-6 py-2.5 rounded-xl font-bold">حفظ الإعدادات</button>
    </form>

    <div class="card p-6">
        <h3 class="font-bold text-slate-700 mb-2">النسخ الاحتياطي</h3>
        <p class="text-sm text-slate-500 mb-4">إنشاء نسخة احتياطية فورية من قاعدة البيانات (تُحفظ في storage/app/private/backups).</p>
        <form method="POST" action="{{ route('admin.settings.backup') }}">
            @csrf
            <button class="bg-slate-700 text-white px-6 py-2.5 rounded-xl font-bold">إنشاء نسخة احتياطية الآن</button>
        </form>
    </div>
</div>
@endsection
