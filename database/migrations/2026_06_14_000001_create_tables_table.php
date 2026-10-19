<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tables', function (Blueprint $table) {
            $table->id();
            $table->string('name');              // طاولة 1، طاولة VIP، إلخ
            $table->unsignedInteger('capacity')->default(4);
            $table->string('status')->default('available'); // available, occupied
            $table->unsignedInteger('sort_order')->default(0);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        Schema::table('orders', function (Blueprint $table) {
            $table->foreignId('table_id')
                ->nullable()
                ->after('shift_id')
                ->constrained('tables')
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('orders', fn (Blueprint $t) => $t->dropForeignIdFor(\App\Models\Table::class));
        Schema::dropIfExists('tables');
    }
};
