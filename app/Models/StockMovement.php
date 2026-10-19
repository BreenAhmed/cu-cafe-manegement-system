<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StockMovement extends Model
{
    public const TYPE_PURCHASE = 'purchase';
    public const TYPE_SALE = 'sale';
    public const TYPE_WASTE = 'waste';
    public const TYPE_ADJUSTMENT = 'adjustment';

    protected $fillable = [
        'ingredient_id', 'type', 'quantity', 'unit_cost', 'balance_after',
        'reference_type', 'reference_id', 'user_id', 'notes',
    ];

    protected $casts = [
        'quantity' => 'decimal:3',
        'unit_cost' => 'decimal:4',
        'balance_after' => 'decimal:3',
    ];

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function reference()
    {
        return $this->morphTo();
    }

    public static function typeLabel(string $type): string
    {
        return match ($type) {
            self::TYPE_PURCHASE => 'شراء',
            self::TYPE_SALE => 'بيع',
            self::TYPE_WASTE => 'هدر',
            self::TYPE_ADJUSTMENT => 'تسوية',
            default => $type,
        };
    }
}
