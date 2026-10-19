@props(['status'])

@php
    $map = [
        'new' => ['جديد', 'bg-blue-100 text-blue-700'],
        'preparing' => ['قيد التحضير', 'bg-amber-100 text-amber-700'],
        'ready' => ['جاهز', 'bg-brand-100 text-brand-700'],
        'delivered' => ['تم التسليم', 'bg-slate-100 text-slate-600'],
        'cancelled' => ['ملغي', 'bg-red-100 text-red-700'],
    ];
    [$label, $classes] = $map[$status] ?? [$status, 'bg-slate-100 text-slate-600'];
@endphp

<span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold {{ $classes }}">{{ $label }}</span>
