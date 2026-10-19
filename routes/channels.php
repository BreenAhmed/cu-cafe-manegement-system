<?php

use App\Models\User;
use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

// شاشة المطبخ — متاحة للمطبخ والمدير والكاشير
Broadcast::channel('kitchen', function (User $user) {
    return $user->hasAnyRole(['مدير', 'مطبخ', 'كاشير']);
});

// قناة الكاشير لاستقبال تحديثات حالة الطلب
Broadcast::channel('cashier', function (User $user) {
    return $user->hasAnyRole(['مدير', 'كاشير', 'مطبخ']);
});
