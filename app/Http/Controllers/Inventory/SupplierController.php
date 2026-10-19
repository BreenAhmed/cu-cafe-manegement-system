<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Supplier;
use Illuminate\Http\Request;

class SupplierController extends Controller
{
    public function index()
    {
        $suppliers = Supplier::withCount('purchases')->orderBy('name')->paginate(20);

        return view('inventory.suppliers.index', compact('suppliers'));
    }

    public function create()
    {
        return redirect()->route('inventory.suppliers.index');
    }

    public function edit()
    {
        return redirect()->route('inventory.suppliers.index');
    }

    public function store(Request $request)
    {
        Supplier::create($this->validateData($request));

        return back()->with('success', 'تمت إضافة المورد.');
    }

    public function update(Request $request, Supplier $supplier)
    {
        $supplier->update($this->validateData($request));

        return back()->with('success', 'تم تحديث المورد.');
    }

    public function destroy(Supplier $supplier)
    {
        $supplier->delete();

        return back()->with('success', 'تم حذف المورد.');
    }

    protected function validateData(Request $request): array
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:120'],
            'phone' => ['nullable', 'string', 'max:30'],
            'email' => ['nullable', 'email', 'max:120'],
            'address' => ['nullable', 'string', 'max:200'],
            'notes' => ['nullable', 'string', 'max:500'],
            'is_active' => ['boolean'],
        ]);
        $data['is_active'] = $request->boolean('is_active');

        return $data;
    }
}
