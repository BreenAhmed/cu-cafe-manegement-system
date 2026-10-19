<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Setting extends Model
{
    protected $fillable = ['key', 'value', 'group', 'type'];

    protected static function booted(): void
    {
        static::saved(fn () => Cache::forget('settings.all'));
        static::deleted(fn () => Cache::forget('settings.all'));
    }

    public static function all(...$args)
    {
        $values = Cache::rememberForever('settings.all', function () {
            return static::query()->get()->mapWithKeys(function (Setting $setting) {
                return [$setting->key => static::castValue($setting->value, $setting->type)];
            })->toArray();
        });

        return collect($values);
    }

    public static function get(string $key, $default = null)
    {
        return static::all()->get($key, $default);
    }

    public static function put(string $key, $value, string $group = 'general', string $type = 'string'): void
    {
        static::updateOrCreate(
            ['key' => $key],
            ['value' => is_array($value) ? json_encode($value) : $value, 'group' => $group, 'type' => $type]
        );
    }

    protected static function castValue($value, string $type)
    {
        return match ($type) {
            'integer' => (int) $value,
            'boolean' => filter_var($value, FILTER_VALIDATE_BOOLEAN),
            'json' => json_decode($value, true),
            default => $value,
        };
    }
}
