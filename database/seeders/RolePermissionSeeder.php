<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;
use App\Models\User;

class RolePermissionSeeder extends Seeder
{
    public const PERMISSIONS = [
        'access dashboard' => 'الوصول للوحة التحكم',
        'manage users' => 'إدارة المستخدمين',
        'manage roles' => 'إدارة الأدوار والصلاحيات',
        'manage settings' => 'إدارة إعدادات النظام',
        'view audit logs' => 'عرض سجل التدقيق',
        'use pos' => 'استخدام نقطة البيع',
        'apply discounts' => 'تطبيق الخصومات',
        'manage shifts' => 'إدارة الورديات',
        'view kitchen' => 'عرض شاشة المطبخ',
        'update order status' => 'تحديث حالة الطلبات',
        'manage menu' => 'إدارة قائمة الأصناف',
        'manage inventory' => 'إدارة المخزون',
        'manage suppliers' => 'إدارة الموردين',
        'manage purchases' => 'إدارة المشتريات',
        'manage accounting' => 'إدارة الحسابات',
        'manage expenses' => 'إدارة المصروفات',
        'view reports' => 'عرض التقارير',
        'export reports' => 'تصدير التقارير',
    ];

    public const ROLES = [
        'مدير' => 'all',
        'كاشير' => [
            'use pos', 'apply discounts', 'manage shifts',
            'view kitchen', 'update order status',
        ],
        'مطبخ' => [
            'view kitchen', 'update order status',
        ],
        'محاسب' => [
            'access dashboard', 'manage accounting', 'manage expenses',
            'view reports', 'export reports',
        ],
        'مسؤول المخزن' => [
            'access dashboard', 'manage inventory', 'manage suppliers',
            'manage purchases', 'view reports',
        ],
    ];

    public function run(): void
    {
        app(PermissionRegistrar::class)->forgetCachedPermissions();

        foreach (array_keys(self::PERMISSIONS) as $permission) {
            Permission::firstOrCreate(['name' => $permission, 'guard_name' => 'web']);
        }

        foreach (self::ROLES as $roleName => $permissions) {
            $role = Role::firstOrCreate(['name' => $roleName, 'guard_name' => 'web']);
            $role->syncPermissions($permissions === 'all' ? Permission::all() : $permissions);
        }

        $this->createUser('مدير النظام', 'manager@cu.local', 'مدير');
        $this->createUser('كاشير الفرع', 'cashier@cu.local', 'كاشير');
        $this->createUser('شيف المطبخ', 'chef@cu.local', 'مطبخ');
        $this->createUser('المحاسب', 'accountant@cu.local', 'محاسب');
        $this->createUser('مسؤول المخزن', 'storage@cu.local', 'مسؤول المخزن');
    }

    protected function createUser(string $name, string $email, string $role): void
    {
        $user = User::firstOrCreate(
            ['email' => $email],
            ['name' => $name, 'password' => Hash::make('password'), 'is_active' => true]
        );

        $user->syncRoles([$role]);
    }
}
