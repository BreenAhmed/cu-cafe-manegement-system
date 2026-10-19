<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('order_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->cascadeOnDelete();
            $table->foreignId('item_id')->nullable()->constrained('items')->nullOnDelete();
            $table->string('name'); // لقطة من اسم الصنف وقت البيع

            $table->decimal('unit_price', 12, 2);   // السعر الأصلي للوحدة (محفوظ دائماً)
            $table->decimal('unit_cost', 12, 2)->default(0); // تكلفة الوحدة (لقطة)
            $table->unsignedInteger('quantity')->default(1);
            $table->decimal('line_subtotal', 14, 2); // unit_price * quantity (الأصلي)

            $table->string('discount_type')->nullable(); // percent, fixed
            $table->decimal('discount_value', 12, 2)->default(0);
            $table->decimal('discount_amount', 14, 2)->default(0); // قيمة الخصم الفعلية
            $table->decimal('net_total', 14, 2);     // السعر الفعلي المُباع = line_subtotal - discount_amount

            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('order_items');
    }
};
