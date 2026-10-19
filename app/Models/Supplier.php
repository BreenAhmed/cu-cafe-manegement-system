<?php

namespace App\Models;

use App\Models\Concerns\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Supplier extends Model
{
    use SoftDeletes, Auditable;

    protected $fillable = ['name', 'phone', 'email', 'address', 'notes', 'is_active'];

    protected $casts = ['is_active' => 'boolean'];

    public function purchases()
    {
        return $this->hasMany(Purchase::class);
    }
}
