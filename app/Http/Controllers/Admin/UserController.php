<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $query = User::with('roles');

        if ($search = $request->get('q')) {
            $query->where(fn ($q) => $q->where('name', 'like', "%$search%")->orWhere('email', 'like', "%$search%"));
        }

        $users = $query->orderBy('name')->paginate(20)->withQueryString();
        $roles = Role::orderBy('name')->get();

        return view('admin.users.index', compact('users', 'roles'));
    }

    public function create()
    {
        return view('admin.users.form', ['user' => new User(['is_active' => true]), 'roles' => Role::orderBy('name')->get()]);
    }

    public function edit(User $user)
    {
        return view('admin.users.form', ['user' => $user, 'roles' => Role::orderBy('name')->get()]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:120'],
            'email' => ['required', 'email', 'unique:users,email'],
            'phone' => ['nullable', 'string', 'max:30'],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
            'role' => ['required', 'exists:roles,name'],
            'is_active' => ['boolean'],
        ]);

        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'] ?? null,
            'password' => Hash::make($data['password']),
            'is_active' => $request->boolean('is_active'),
        ]);
        $user->syncRoles([$data['role']]);

        return redirect()->route('admin.users.index')->with('success', 'تمت إضافة المستخدم.');
    }

    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:120'],
            'email' => ['required', 'email', Rule::unique('users', 'email')->ignore($user->id)],
            'phone' => ['nullable', 'string', 'max:30'],
            'password' => ['nullable', 'string', 'min:6', 'confirmed'],
            'role' => ['required', 'exists:roles,name'],
            'is_active' => ['boolean'],
        ]);

        $user->update([
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'] ?? null,
            'is_active' => $request->boolean('is_active'),
            ...(! empty($data['password']) ? ['password' => Hash::make($data['password'])] : []),
        ]);
        $user->syncRoles([$data['role']]);

        return redirect()->route('admin.users.index')->with('success', 'تم تحديث المستخدم.');
    }

    public function destroy(User $user)
    {
        if ($user->id === auth()->id()) {
            return back()->with('error', 'لا يمكنك حذف حسابك الخاص.');
        }

        $user->delete();

        return back()->with('success', 'تم حذف المستخدم.');
    }
}
