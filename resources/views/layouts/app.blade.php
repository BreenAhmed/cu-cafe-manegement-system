<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'لوحة التحكم') · {{ \App\Models\Setting::get('brand_name', 'CU') }}</title>
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=cairo:400,500,600,700,800&display=swap" rel="stylesheet">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @stack('head')
</head>
<body class="bg-slate-100 text-slate-800 antialiased">
<div class="flex min-h-screen" x-data="{ sidebarOpen: false }">

    @include('partials.sidebar')

    {{-- خلفية معتمة للجوال --}}
    <div x-show="sidebarOpen" x-cloak @click="sidebarOpen = false"
         class="fixed inset-0 z-30 bg-black/40 lg:hidden"></div>

    <div class="flex-1 flex flex-col min-w-0">
        @include('partials.topbar')

        <main class="flex-1 p-4 sm:p-6">
            @include('partials.flash')
            @yield('content')
        </main>

        <footer class="px-6 py-4 text-center text-xs text-slate-400">
            نظام إدارة كافيه {{ \App\Models\Setting::get('brand_name', 'CU') }} · جميع الحقوق محفوظة {{ date('Y') }}
        </footer>
    </div>
</div>
@stack('scripts')
</body>
</html>
