@extends('layouts.app')
@section('title', 'الإشعارات')

@section('content')
<div class="card p-5 max-w-3xl">
    <div class="flex justify-between items-center mb-4">
        <h2 class="font-bold text-slate-700">جميع الإشعارات</h2>
        <form method="POST" action="{{ route('notifications.readAll') }}">@csrf<button class="text-sm text-brand-600 hover:underline">تعليم الكل كمقروء</button></form>
    </div>
    <div class="divide-y">
        @forelse ($notifications as $note)
            <div class="flex gap-3 py-4 {{ $note->read_at ? 'opacity-60' : '' }}">
                <span class="mt-1 w-2.5 h-2.5 rounded-full shrink-0 {{ ['info'=>'bg-blue-500','warning'=>'bg-amber-500','danger'=>'bg-red-500','success'=>'bg-brand-500'][$note->data['type'] ?? 'info'] }}"></span>
                <div class="flex-1">
                    <div class="font-semibold text-slate-700">{{ $note->data['title'] ?? '' }}</div>
                    <div class="text-sm text-slate-500">{{ $note->data['message'] ?? '' }}</div>
                    <div class="text-xs text-slate-400 mt-1">{{ $note->created_at->diffForHumans() }}</div>
                </div>
                @unless ($note->read_at)
                    <form method="POST" action="{{ route('notifications.read', $note->id) }}">@csrf<button class="text-xs text-brand-600">تعليم كمقروء</button></form>
                @endunless
            </div>
        @empty
            <p class="py-10 text-center text-slate-400">لا توجد إشعارات</p>
        @endforelse
    </div>
    <div class="mt-4">{{ $notifications->links() }}</div>
</div>
@endsection
