<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_number')->unique();   // رقم الطلب اليومي المتسلسل
            $table->string('invoice_number')->unique();  // رقم الفاتورة الفريد
            $table->foreignId('user_id')->constrained('users')->restrictOnDelete(); // الكاشير
            $table->foreignId('shift_id')->nullable()->constrained('shifts')->nullOnDelete();
            $table->string('type')->default('dine_in'); // dine_in, takeaway
            $table->string('status')->default('new');    // new, preparing, ready, delivered, cancelled
            $table->string('customer_name')->nullable();

            // المبالغ — مصممة للحفاظ على سلامة الحسابات المحاسبية
            $table->decimal('subtotal', 14, 2)->default(0);          // إجمالي الأسعار الأصلية
            $table->decimal('item_discount_total', 14, 2)->default(0); // مجموع خصومات الأصناف
            $table->string('discount_type')->nullable();             // percent, fixed (خصم على الفاتورة)
            $table->decimal('discount_value', 14, 2)->default(0);    // القيمة المُدخلة للخصم على الفاتورة
            $table->decimal('order_discount_amount', 14, 2)->default(0); // قيمة خصم الفاتورة المحسوبة
            $table->decimal('discount_total', 14, 2)->default(0);    // إجمالي الخصومات (أصناف + فاتورة)
            $table->decimal('total', 14, 2)->default(0);             // الصافي للدفع
            $table->decimal('cost_total', 14, 2)->default(0);        // تكلفة المكوّنات (لقطة)
            $table->decimal('profit', 14, 2)->default(0);            // الربح = total - cost_total

            $table->string('payment_method')->default('cash'); // cash, card, transfer
            $table->boolean('is_paid')->default(false);
            $table->text('notes')->nullable();

            $table->timestamp('prepared_at')->nullable(); // بدء التحضير
            $table->timestamp('ready_at')->nullable();    // أصبح جاهزاً
            $table->timestamp('delivered_at')->nullable();// تم التسليم
            $table->timestamp('cancelled_at')->nullable();

            $table->timestamps();
            $table->softDeletes();

            $table->index(['status', 'created_at']);
            $table->index(['shift_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
