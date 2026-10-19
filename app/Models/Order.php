<?php

namespace App\Models;

use App\Models\Concerns\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use SoftDeletes, Auditable;

    public const STATUS_NEW = 'new';
    public const STATUS_PREPARING = 'preparing';
    public const STATUS_READY = 'ready';
    public const STATUS_DELIVERED = 'delivered';
    public const STATUS_CANCELLED = 'cancelled';

    public const TYPE_DINE_IN = 'dine_in';
    public const TYPE_TAKEAWAY = 'takeaway';

    protected $fillable = [
        'order_number', 'invoice_number', 'user_id', 'shift_id', 'table_id', 'type', 'status',
        'customer_name', 'subtotal', 'item_discount_total', 'discount_type',
        'discount_value', 'order_discount_amount', 'discount_total', 'total',
        'cost_total', 'profit', 'payment_method', 'is_paid', 'notes',
        'prepared_at', 'ready_at', 'delivered_at', 'cancelled_at',
    ];

    protected $casts = [
        'subtotal' => 'decimal:2',
        'item_discount_total' => 'decimal:2',
        'discount_value' => 'decimal:2',
        'order_discount_amount' => 'decimal:2',
        'discount_total' => 'decimal:2',
        'total' => 'decimal:2',
        'cost_total' => 'decimal:2',
        'profit' => 'decimal:2',
        'is_paid' => 'boolean',
        'prepared_at' => 'datetime',
        'ready_at' => 'datetime',
        'delivered_at' => 'datetime',
        'cancelled_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function shift()
    {
        return $this->belongsTo(Shift::class);
    }

    public function table()
    {
        return $this->belongsTo(Table::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function transaction()
    {
        return $this->morphOne(Transaction::class, 'source');
    }

    public function scopeToday($query)
    {
        return $query->whereDate('created_at', today());
    }

    public function scopeActiveKitchen($query)
    {
        return $query->whereIn('status', [self::STATUS_NEW, self::STATUS_PREPARING, self::STATUS_READY]);
    }

    public static function statuses(): array
    {
        return [
            self::STATUS_NEW => 'جديد',
            self::STATUS_PREPARING => 'قيد التحضير',
            self::STATUS_READY => 'جاهز',
            self::STATUS_DELIVERED => 'تم التسليم',
            self::STATUS_CANCELLED => 'ملغي',
        ];
    }

    public function getStatusLabelAttribute(): string
    {
        return self::statuses()[$this->status] ?? $this->status;
    }

    public function getTypeLabelAttribute(): string
    {
        return $this->type === self::TYPE_DINE_IN ? 'محلي' : 'سفري';
    }

    public function getPaymentMethodLabelAttribute(): string
    {
        return match ($this->payment_method) {
            'cash' => 'نقدي',
            'card' => 'بطاقة',
            'transfer' => 'تحويل',
            default => $this->payment_method,
        };
    }

    /**
     * زمن التحضير بالدقائق (من الإنشاء حتى الجهوزية).
     */
    public function getPrepDurationAttribute(): ?int
    {
        if (! $this->ready_at) {
            return null;
        }

        return $this->created_at->diffInMinutes($this->ready_at);
    }
}
