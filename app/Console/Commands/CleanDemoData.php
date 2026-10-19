<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class CleanDemoData extends Command
{
    protected $signature   = 'cu:clean {--force : تخطي طلب التأكيد}';
    protected $description = 'حذف جميع بيانات النظام مع الاحتفاظ بالمستخدمين وصلاحياتهم (للنشر الإنتاجي)';

    /** الجداول التي تُحذف بالترتيب الصحيح (الأبناء قبل الآباء). */
    private array $tables = [
        'notifications',
        'activity_log',
        'transactions',
        'expenses',
        'stock_movements',
        'purchase_items',
        'purchases',
        'order_items',
        'orders',
        'shifts',
        'recipe_items',
        'items',
        'categories',
        'ingredients',
        'units',
        'suppliers',
        'expense_categories',
        'tables',
        'jobs',
        'failed_jobs',
        'cache',
        'cache_locks',
    ];

    public function handle(): int
    {
        if (! $this->option('force')) {
            $this->warn('⚠️  هذا الأمر سيحذف جميع البيانات من قاعدة البيانات.');
            $this->warn('   سيتم الاحتفاظ فقط بـ: المستخدمين، الأدوار، الصلاحيات، الإعدادات.');
            $this->newLine();

            if (! $this->confirm('هل أنت متأكد من المتابعة؟', false)) {
                $this->info('تم الإلغاء.');
                return self::SUCCESS;
            }
        }

        $this->info('جاري تنظيف قاعدة البيانات...');

        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        $bar = $this->output->createProgressBar(count($this->tables));
        $bar->start();

        foreach ($this->tables as $table) {
            DB::table($table)->truncate();
            $bar->advance();
        }

        DB::statement('SET FOREIGN_KEY_CHECKS=1');

        $bar->finish();
        $this->newLine(2);

        $this->info('✅  تم التنظيف بنجاح. ما تبقى في قاعدة البيانات:');
        $this->table(
            ['الجدول', 'العدد'],
            [
                ['users',               DB::table('users')->count()],
                ['roles',               DB::table('roles')->count()],
                ['permissions',         DB::table('permissions')->count()],
                ['model_has_roles',     DB::table('model_has_roles')->count()],
                ['settings',            DB::table('settings')->count()],
            ]
        );

        return self::SUCCESS;
    }
}
