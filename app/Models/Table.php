<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Table extends Model
{
    public const STATUS_AVAILABLE = 'available';
    public const STATUS_OCCUPIED  = 'occupied';

    protected $fillable = ['name', 'capacity', 'status', 'sort_order', 'is_active'];

    protected $casts = [
        'capacity'   => 'integer',
        'sort_order' => 'integer',
        'is_active'  => 'boolean',
    ];

    // ─── Relations ────────────────────────────────────────────────────────────

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    /** الطلبات النشطة المفتوحة على الطاولة (لم يُسدَّد ثمنها بعد، ولم تُلغَ). */
    public function activeOrders()
    {
        return $this->hasMany(Order::class)
            ->where('is_paid', false)
            ->where('status', '!=', Order::STATUS_CANCELLED);
    }

    // ─── Helpers ──────────────────────────────────────────────────────────────

    public function isAvailable(): bool
    {
        return $this->status === self::STATUS_AVAILABLE;
    }

    public function isOccupied(): bool
    {
        return $this->status === self::STATUS_OCCUPIED;
    }

    /** مجموع كل الطلبات النشطة على الطاولة. */
    public function getRunningTotalAttribute(): float
    {
        return round((float) $this->activeOrders()->sum('total'), 2);
    }

    /** عدد الأصناف المفتوحة. */
    public function getActiveItemCountAttribute(): int
    {
        return (int) $this->activeOrders()->withCount('items')->get()->sum('items_count');
    }

    public function getStatusLabelAttribute(): string
    {
        return $this->status === self::STATUS_OCCUPIED ? 'مشغولة' : 'فارغة';
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true)->orderBy('sort_order');
    }
}
