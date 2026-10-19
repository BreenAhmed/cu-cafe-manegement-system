<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('category_id')->constrained('categories')->restrictOnDelete();
            $table->string('name');
            $table->string('sku', 50)->nullable()->unique();
            $table->decimal('price', 12, 2)->default(0);          // سعر البيع
            $table->decimal('manual_cost', 12, 2)->nullable();    // تكلفة يدوية اختيارية (تتجاوز تكلفة الوصفة)
            $table->text('description')->nullable();
            $table->string('image')->nullable();
            $table->unsignedInteger('prep_time_minutes')->default(5);
            $table->boolean('track_inventory')->default(true);    // هل يخصم من المخزون عبر الوصفة
            $table->boolean('is_available')->default(true);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('items');
    }
};
