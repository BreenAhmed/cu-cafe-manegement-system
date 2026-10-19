<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>تسجيل الدخول · {{ \App\Models\Setting::get('brand_name', 'CU') }}</title>
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=cairo:400,500,600,700,800&display=swap" rel="stylesheet">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="min-h-screen bg-gradient-to-br from-brand-600 via-brand-700 to-emerald-900 flex items-center justify-center p-4">
    <div class="w-full max-w-md">
        <div class="text-center mb-8 text-white">
            <div class="inline-flex w-20 h-20 rounded-3xl bg-white/15 backdrop-blur items-center justify-center text-4xl font-extrabold mb-4 shadow-lg">CU</div>
            <h1 class="text-2xl font-extrabold">كافيه البطيخ CU</h1>
            <p class="text-brand-100 text-sm mt-1">نظام إدارة المطعم ونقاط البيع</p>
        </div>

        <div class="bg-white rounded-3xl shadow-2xl p-8">
            <h2 class="text-xl font-bold text-slate-800 mb-6">تسجيل الدخول</h2>

            @if ($errors->any())
                <div class="mb-4 bg-red-50 border border-red-200 text-red-700 text-sm px-4 py-3 rounded-xl">
                    {{ $errors->first() }}
                </div>
            @endif

            <form method="POST" action="{{ route('login') }}" class="space-y-4">
                @csrf
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1.5">البريد الإلكتروني</label>
                    <input type="email" name="email" value="{{ old('email') }}" required autofocus
                           class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-brand-500 focus:ring-2 focus:ring-brand-200 outline-none transition"
                           placeholder="manager@cu.local">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-slate-600 mb-1.5">كلمة المرور</label>
                    <input type="password" name="password" required
                           class="w-full px-4 py-3 rounded-xl border border-slate-200 focus:border-brand-500 focus:ring-2 focus:ring-brand-200 outline-none transition"
                           placeholder="••••••••">
                </div>
                <label class="flex items-center gap-2 text-sm text-slate-600">
                    <input type="checkbox" name="remember" class="rounded text-brand-600 focus:ring-brand-500">
                    تذكرني
                </label>
                <button type="submit"
                        class="w-full bg-brand-600 hover:bg-brand-700 text-white font-bold py-3 rounded-xl transition shadow-lg shadow-brand-600/30">
                    دخول
                </button>
            </form>

            <div class="mt-6 pt-4 border-t border-slate-100 text-xs text-slate-400 text-center leading-relaxed">
                حسابات تجريبية — كلمة المرور: <span class="font-mono font-bold">password</span><br>
                manager@cu.local · cashier@cu.local · chef@cu.local
            </div>
        </div>
    </div>
</body>
</html>
