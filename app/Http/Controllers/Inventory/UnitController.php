<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Unit;
use Illuminate\Http\Request;

class UnitController extends Controller
{
    public function index()
    {
        $units = Unit::withCount('ingredients')->orderBy('name')->get();

        return view('inventory.units.index', compact('units'));
    }

    public function create()
    {
        return redirect()->route('inventory.units.index');
    }

    public function edit()
    {
        return redirect()->route('inventory.units.index');
    }

    public function store(Request $request)
    {
        Unit::create($this->validateData($request));

        return back()->with('success', 'تمت إضافة الوحدة.');
    }

    public function update(Request $request, Unit $unit)
    {
        $unit->update($this->validateData($request));

        return back()->with('success', 'تم تحديث الوحدة.');
    }

    public function destroy(Unit $unit)
    {
        if ($unit->ingredients()->exists()) {
            return back()->with('error', 'لا يمكن حذف وحدة مستخدمة في مكوّنات.');
        }

        $unit->delete();

        return back()->with('success', 'تم حذف الوحدة.');
    }

    protected function validateData(Request $request): array
    {
        return $request->validate([
            'name' => ['required', 'string', 'max:50'],
            'abbreviation' => ['required', 'string', 'max:20'],
        ]);
    }
}
