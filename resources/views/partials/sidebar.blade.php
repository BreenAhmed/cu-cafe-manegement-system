@php
    $nav = [
        ['route' => 'dashboard', 'label' => 'لوحة التحكم', 'icon' => 'dashboard', 'can' => 'access dashboard'],
        ['route' => 'pos.index', 'label' => 'نقطة البيع', 'icon' => 'pos', 'can' => 'use pos'],
        ['route' => 'kitchen.index', 'label' => 'شاشة المطبخ', 'icon' => 'kitchen', 'can' => 'view kitchen'],
        ['route' => 'orders.index', 'label' => 'الطلبات', 'icon' => 'list', 'can' => null],
        ['route' => 'tables.index', 'label' => 'الطاولات', 'icon' => 'pos', 'can' => 'use pos'],
        ['route' => 'shifts.index', 'label' => 'الورديات', 'icon' => 'clock', 'can' => 'manage shifts'],
        ['route' => 'items.index', 'label' => 'الأصناف', 'icon' => 'menu', 'can' => 'manage menu'],
        ['route' => 'categories.index', 'label' => 'التصنيفات', 'icon' => 'menu', 'can' => 'manage menu'],
        ['route' => 'inventory.ingredients.index', 'label' => 'المكوّنات', 'icon' => 'box', 'can' => 'manage inventory'],
        ['route' => 'inventory.stock.index', 'label' => 'حركة المخزون', 'icon' => 'box', 'can' => 'manage inventory'],
        ['route' => 'inventory.units.index', 'label' => 'وحدات القياس', 'icon' => 'list', 'can' => 'manage inventory'],
        ['route' => 'inventory.suppliers.index', 'label' => 'الموردون', 'icon' => 'truck', 'can' => 'manage suppliers'],
        ['route' => 'inventory.purchases.index', 'label' => 'المشتريات', 'icon' => 'truck', 'can' => 'manage purchases'],
        ['route' => 'accounting.index', 'label' => 'المحاسبة', 'icon' => 'money', 'can' => 'manage accounting'],
        ['route' => 'accounting.expenses.index', 'label' => 'المصروفات', 'icon' => 'money', 'can' => 'manage expenses'],
        ['route' => 'reports.index', 'label' => 'التقارير', 'icon' => 'chart', 'can' => 'view reports'],
        ['route' => 'admin.users.index', 'label' => 'المستخدمون', 'icon' => 'users', 'can' => 'manage users'],
        ['route' => 'admin.roles.index', 'label' => 'الأدوار والصلاحيات', 'icon' => 'shield', 'can' => 'manage roles'],
        ['route' => 'admin.activity.index', 'label' => 'سجل التدقيق', 'icon' => 'shield', 'can' => 'view audit logs'],
        ['route' => 'admin.settings.index', 'label' => 'الإعدادات', 'icon' => 'cog', 'can' => 'manage settings'],
    ];
@endphp

<aside x-cloak
       :class="sidebarOpen ? 'translate-x-0' : 'translate-x-full'"
       class="fixed lg:static lg:translate-x-0 inset-y-0 right-0 z-40 w-72 bg-slate-900 text-slate-300 flex flex-col transition-transform duration-200">
    <div class="h-16 flex items-center gap-3 px-6 border-b border-white/10">
        <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-brand-500 to-melon-500 flex items-center justify-center font-extrabold text-white text-lg">CU</div>
        <div>
            <div class="text-white font-bold leading-tight">{{ \App\Models\Setting::get('brand_name', 'CU') }}</div>
            <div class="text-[11px] text-slate-400">كافيه البطيخ</div>
        </div>
    </div>

    <nav class="flex-1 overflow-y-auto scrollbar-thin py-4 px-3 space-y-1">
        @foreach ($nav as $link)
            @if (! $link['can'] || auth()->user()->can($link['can']))
                @php $active = request()->routeIs($link['route']) || request()->routeIs(\Illuminate\Support\Str::beforeLast($link['route'], '.').'.*') && \Illuminate\Support\Str::contains(request()->route()->getName() ?? '', \Illuminate\Support\Str::beforeLast($link['route'], '.')); @endphp
                <a href="{{ route($link['route']) }}"
                   class="flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium transition
                          {{ request()->routeIs($link['route']) ? 'bg-brand-600 text-white shadow' : 'hover:bg-white/5 hover:text-white' }}">
                    <x-icon :name="$link['icon']" class="w-5 h-5 shrink-0" />
                    <span>{{ $link['label'] }}</span>
                </a>
            @endif
        @endforeach
    </nav>

    <form method="POST" action="{{ route('logout') }}" class="p-3 border-t border-white/10">
        @csrf
        <button type="submit" class="w-full flex items-center gap-3 px-4 py-2.5 rounded-xl text-sm font-medium text-red-300 hover:bg-red-500/10 transition">
            <x-icon name="logout" class="w-5 h-5" />
            <span>تسجيل الخروج</span>
        </button>
    </form>
</aside>
