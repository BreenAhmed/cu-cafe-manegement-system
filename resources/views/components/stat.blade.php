@props(['label', 'value', 'icon' => 'chart', 'color' => 'brand', 'sub' => null])

@php
    $colors = [
        'brand' => 'from-brand-500 to-brand-600',
        'melon' => 'from-melon-500 to-melon-600',
        'blue' => 'from-blue-500 to-blue-600',
        'amber' => 'from-amber-500 to-amber-600',
        'violet' => 'from-violet-500 to-violet-600',
        'slate' => 'from-slate-600 to-slate-700',
    ];
@endphp

<div class="card p-5 flex items-center gap-4">
    <div class="w-12 h-12 rounded-xl bg-gradient-to-br {{ $colors[$color] ?? $colors['brand'] }} text-white flex items-center justify-center shrink-0">
        <x-icon :name="$icon" class="w-6 h-6" />
    </div>
    <div class="min-w-0">
        <div class="text-sm text-slate-500">{{ $label }}</div>
        <div class="text-2xl font-extrabold text-slate-800 truncate">{{ $value }}</div>
        @if ($sub)
            <div class="text-xs text-slate-400">{{ $sub }}</div>
        @endif
    </div>
</div>
