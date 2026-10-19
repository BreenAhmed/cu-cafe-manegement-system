<?php

namespace App\Models;

use App\Models\Concerns\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Expense extends Model
{
    use SoftDeletes, Auditable;

    protected $fillable = [
        'expense_category_id', 'user_id', 'amount', 'description',
        'payment_method', 'spent_at', 'attachment', 'reference_type', 'reference_id',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'spent_at' => 'date',
    ];

    public function category()
    {
        return $this->belongsTo(ExpenseCategory::class, 'expense_category_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function transaction()
    {
        return $this->morphOne(Transaction::class, 'source');
    }

    public function reference()
    {
        return $this->morphTo();
    }
}
