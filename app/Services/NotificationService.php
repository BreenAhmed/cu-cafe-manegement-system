<?php

namespace App\Services;

use App\Models\User;
use App\Notifications\GeneralNotification;
use Illuminate\Support\Facades\Notification;

class NotificationService
{
    /**
     * إرسال إشعار لكل المستخدمين الذين يملكون أحد الأدوار المحددة.
     */
    public function notifyRoles(array $roles, string $title, string $message, string $type = 'info', ?string $url = null, ?string $icon = null): void
    {
        $users = User::role($roles)->where('is_active', true)->get();

        if ($users->isEmpty()) {
            return;
        }

        Notification::send($users, new GeneralNotification($title, $message, $type, $url, $icon));
    }

    public function notifyUser(User $user, string $title, string $message, string $type = 'info', ?string $url = null, ?string $icon = null): void
    {
        $user->notify(new GeneralNotification($title, $message, $type, $url, $icon));
    }
}
