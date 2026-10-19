<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RecipeItem extends Model
{
    protected $fillable = ['item_id', 'ingredient_id', 'quantity'];

    protected $casts = ['quantity' => 'decimal:3'];

    public function item()
    {
        return $this->belongsTo(Item::class);
    }

    public function ingredient()
    {
        return $this->belongsTo(Ingredient::class);
    }
}
