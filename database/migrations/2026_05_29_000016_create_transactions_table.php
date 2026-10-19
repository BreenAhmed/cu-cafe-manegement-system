<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // دفتر الأستاذ المحاسبي: يسجّل كل دخل ومصروف بشكل موحّد
        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->string('type'); // income, expense
            $table->string('category')->nullable(); // sales, expense:rent, purchase ...
            $table->decimal('amount', 14, 2);
            $table->string('description')->nullable();
            $table->nullableMorphs('source'); // Order, Expense, Purchase ...
            $table->foreignId('user_id')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('occurred_at');
            $table->timestamps();

            $table->index(['type', 'occurred_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
