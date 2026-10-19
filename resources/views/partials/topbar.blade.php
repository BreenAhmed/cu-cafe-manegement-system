@php
    $unread = auth()->user()->unreadNotifications()->take(8)->get();
    $activeShift = auth()->user()->activeShift()->first();
@endphp

<header class="h-16 bg-white border-b border-slate-200 flex items-center justify-between px-4 sm:px-6 sticky top-0 z-20">
    <div class="flex items-center gap-3">
        <button @click="sidebarOpen = !sidebarOpen" class="lg:hidden p-2 rounded-lg hover:bg-slate-100">
            <x-icon name="list" class="w-6 h-6" />
        </button>
        <h1 class="text-lg font-bold text-slate-800">@yield('title', 'لوحة التحكم')</h1>
    </div>

    <div class="flex items-center gap-2 sm:gap-4">
        @if ($activeShift)
            <span class="hidden sm:inline-flex items-center gap-1.5 text-xs font-semibold text-brand-700 bg-brand-50 px-3 py-1.5 rounded-full">
                <span class="w-2 h-2 rounded-full bg-brand-500 animate-pulse"></span>
                وردية مفتوحة
            </span>
        @endif

        {{-- الإشعارات --}}
        <div x-data="{ open: false }" class="relative">
            <button @click="open = !open" class="relative p-2 rounded-lg hover:bg-slate-100">
                <x-icon name="bell" class="w-6 h-6 text-slate-600" />
                @if ($unread->count())
                    <span class="absolute top-1 left-1 w-4 h-4 text-[10px] flex items-center justify-center bg-melon-500 text-white rounded-full">{{ $unread->count() }}</span>
                @endif
            </button>
            <div x-show="open" x-cloak @click.outside="open = false"
                 class="absolute left-0 mt-2 w-80 bg-white rounded-2xl shadow-xl border border-slate-100 overflow-hidden z-50">
                <div class="flex items-center justify-between px-4 py-3 border-b">
                    <span class="font-bold text-sm">الإشعارات</span>
                    @if ($unread->count())
                        <form method="POST" action="{{ route('notifications.readAll') }}">
                            @csrf
                            <button class="text-xs text-brand-600 hover:underline">تعليم الكل كمقروء</button>
                        </form>
                    @endif
                </div>
                <div class="max-h-80 overflow-y-auto scrollbar-thin divide-y">
                    @forelse ($unread as $note)
                        <a href="{{ $note->data['url'] ?? route('notifications.index') }}"
                           class="flex gap-3 px-4 py-3 hover:bg-slate-50">
                            <span class="mt-0.5 w-2 h-2 rounded-full shrink-0
                                {{ ['info'=>'bg-blue-500','warning'=>'bg-amber-500','danger'=>'bg-red-500','success'=>'bg-brand-500'][$note->data['type'] ?? 'info'] }}"></span>
                            <div class="min-w-0">
                                <div class="text-sm font-semibold text-slate-700">{{ $note->data['title'] ?? '' }}</div>
                                <div class="text-xs text-slate-500 truncate">{{ $note->data['message'] ?? '' }}</div>
                                <div class="text-[10px] text-slate-400 mt-1">{{ $note->created_at->diffForHumans() }}</div>
                            </div>
                        </a>
                    @empty
                        <div class="px-4 py-8 text-center text-sm text-slate-400">لا توجد إشعارات جديدة</div>
                    @endforelse
                </div>
            </div>
        </div>

        {{-- المستخدم --}}
        <div x-data="{ open: false }" class="relative">
            <button @click="open = !open" class="flex items-center gap-2 p-1.5 rounded-lg hover:bg-slate-100">
                <div class="w-9 h-9 rounded-full bg-brand-100 text-brand-700 flex items-center justify-center font-bold">
                    {{ mb_substr(auth()->user()->name, 0, 1) }}
                </div>
                <div class="hidden sm:block text-right leading-tight">
                    <div class="text-sm font-semibold text-slate-700">{{ auth()->user()->name }}</div>
                    <div class="text-[11px] text-slate-400">{{ auth()->user()->role_label }}</div>
                </div>
            </button>
        </div>
    </div>
</header>
