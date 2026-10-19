<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // سجل حركة المخزون: شراء، بيع، هدر، تسوية
        Schema::create('stock_movements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ingredient_id')->constrained('ingredients')->cascadeOnDelete();
            $table->string('type'); // purchase, sale, waste, adjustment
            $table->decimal('quantity', 14, 3);     // موجب = إضافة، سالب = خصم
            $table->decimal('unit_cost', 14, 4)->default(0);
            $table->decimal('balance_after', 14, 3); // الرصيد بعد الحركة
            $table->nullableMorphs('reference');     // المصدر: طلب، فاتورة شراء، تسوية...
            $table->foreignId('user_id')->nullable()->constrained('users')->nullOnDelete();
            $table->text('notes')->nullable();
            $table->timestamps();

            $table->index(['ingredient_id', 'type']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('stock_movements');
    }
};
