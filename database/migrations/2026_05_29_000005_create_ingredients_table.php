<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ingredients', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->foreignId('unit_id')->constrained('units')->restrictOnDelete();
            $table->decimal('current_stock', 14, 3)->default(0);
            $table->decimal('reorder_level', 14, 3)->default(0); // حد التنبيه للمخزون المنخفض
            $table->decimal('cost_per_unit', 14, 4)->default(0); // متوسط تكلفة الوحدة
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ingredients');
    }
};
