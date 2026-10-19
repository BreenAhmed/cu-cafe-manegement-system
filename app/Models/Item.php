<?php

namespace App\Models;

use App\Models\Concerns\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Item extends Model
{
    use SoftDeletes, Auditable;

    protected $fillable = [
        'category_id', 'name', 'sku', 'price', 'manual_cost', 'description',
        'image', 'prep_time_minutes', 'track_inventory', 'is_available',
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'manual_cost' => 'decimal:2',
        'prep_time_minutes' => 'integer',
        'track_inventory' => 'boolean',
        'is_available' => 'boolean',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function recipeItems()
    {
        return $this->hasMany(RecipeItem::class);
    }

    public function ingredients()
    {
        return $this->belongsToMany(Ingredient::class, 'recipe_items')
            ->withPivot('quantity')
            ->withTimestamps();
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function scopeAvailable($query)
    {
        return $query->where('is_available', true);
    }

    /**
     * تكلفة الصنف: التكلفة اليدوية إن وُجدت وإلا تكلفة الوصفة المحسوبة.
     */
    public function getCostAttribute(): float
    {
        if (! is_null($this->manual_cost)) {
            return (float) $this->manual_cost;
        }

        return $this->recipeCost();
    }

    public function recipeCost(): float
    {
        return (float) $this->recipeItems->sum(function (RecipeItem $recipe) {
            $ingredient = $recipe->ingredient;
            return $ingredient ? $recipe->quantity * $ingredient->cost_per_unit : 0;
        });
    }

    public function getProfitAttribute(): float
    {
        return round($this->price - $this->cost, 2);
    }

    public function getMarginAttribute(): float
    {
        if ($this->price <= 0) {
            return 0;
        }

        return round((($this->price - $this->cost) / $this->price) * 100, 1);
    }

    public function getImageUrlAttribute(): string
    {
        if ($this->image && Storage::disk('public')->exists($this->image)) {
            return Storage::disk('public')->url($this->image);
        }

        return 'https://placehold.co/400x300/16a34a/ffffff?text=CU';
    }
}
