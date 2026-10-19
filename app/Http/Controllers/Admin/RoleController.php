<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Database\Seeders\RolePermissionSeeder;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    public function index()
    {
        $roles = Role::with('permissions')->withCount('users')->orderBy('name')->get();
        $permissions = Permission::orderBy('name')->get();
        $labels = RolePermissionSeeder::PERMISSIONS;

        return view('admin.roles.index', compact('roles', 'permissions', 'labels'));
    }

    public function update(Request $request, Role $role)
    {
        $data = $request->validate([
            'permissions' => ['array'],
            'permissions.*' => ['exists:permissions,name'],
        ]);

        $role->syncPermissions($data['permissions'] ?? []);

        return back()->with('success', "تم تحديث صلاحيات الدور «{$role->name}».");
    }
}
