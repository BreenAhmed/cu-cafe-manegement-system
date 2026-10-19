<?php

namespace App\Models;

use App\Models\Concerns\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use SoftDeletes, Auditable;

    protected $fillable = ['name', 'color', 'sort_order', 'is_active'];

    protected $casts = [
        'is_active' => 'boolean',
        'sort_order' => 'integer',
    ];

    public function items()
    {
        return $this->hasMany(Item::class);
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}
