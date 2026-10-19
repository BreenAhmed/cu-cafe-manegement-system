<?php

use App\Models\Setting;

if (! function_exists('money')) {
    /**
     * تنسيق المبالغ المالية بعملة النظام.
     */
    function money($amount, bool $withSymbol = true): string
    {
        $formatted = number_format((float) $amount, 2);
        if (! $withSymbol) {
            return $formatted;
        }

        $currency = Setting::get('currency', 'ل.س');

        return $formatted . ' ' . $currency;
    }
}

if (! function_exists('arabic_date')) {
    function arabic_date($date, string $format = 'd M Y'): string
    {
        if (! $date) {
            return '—';
        }

        return \Illuminate\Support\Carbon::parse($date)->locale('ar')->translatedFormat($format);
    }
}

if (! function_exists('safe_broadcast')) {
    /**
     * بث الحدث دون إفشال الطلب إذا كان خادم الـ WebSocket غير متاح.
     */
    function safe_broadcast(object $event): void
    {
        try {
            broadcast($event)->toOthers();
        } catch (\Throwable $e) {
            report($e);
        }
    }
}
