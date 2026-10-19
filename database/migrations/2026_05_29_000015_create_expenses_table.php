<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('expenses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('expense_category_id')->constrained('expense_categories')->restrictOnDelete();
            $table->foreignId('user_id')->constrained('users')->restrictOnDelete();
            $table->decimal('amount', 14, 2);
            $table->string('description');
            $table->string('payment_method')->default('cash');
            $table->date('spent_at');
            $table->string('attachment')->nullable();
            $table->nullableMorphs('reference'); // ربط بفاتورة شراء عند الحاجة
            $table->timestamps();
            $table->softDeletes();

            $table->index(['spent_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('expenses');
    }
};
