<?php

namespace App\Models;

use App\Models\Concerns\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ingredient extends Model
{
    use SoftDeletes, Auditable;

    protected $fillable = [
        'name', 'unit_id', 'current_stock', 'reorder_level', 'cost_per_unit', 'is_active',
    ];

    protected $casts = [
        'current_stock' => 'decimal:3',
        'reorder_level' => 'decimal:3',
        'cost_per_unit' => 'decimal:4',
        'is_active' => 'boolean',
    ];

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function recipeItems()
    {
        return $this->hasMany(RecipeItem::class);
    }

    public function stockMovements()
    {
        return $this->hasMany(StockMovement::class);
    }

    public function scopeLowStock($query)
    {
        return $query->whereColumn('current_stock', '<=', 'reorder_level');
    }

    public function isLowStock(): bool
    {
        return $this->current_stock <= $this->reorder_level;
    }
}
