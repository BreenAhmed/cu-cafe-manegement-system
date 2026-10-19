<?php

namespace App\Http\Controllers;

class NotificationController extends Controller
{
    public function index()
    {
        $notifications = auth()->user()->notifications()->paginate(30);

        return view('notifications.index', compact('notifications'));
    }

    public function markRead(string $id)
    {
        auth()->user()->notifications()->where('id', $id)->update(['read_at' => now()]);

        return back();
    }

    public function markAllRead()
    {
        auth()->user()->unreadNotifications->markAsRead();

        return back()->with('success', 'تم تعليم جميع الإشعارات كمقروءة.');
    }
}
