<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Ingredient;
use App\Models\Unit;
use Illuminate\Http\Request;

class IngredientController extends Controller
{
    public function index(Request $request)
    {
        $query = Ingredient::with('unit');

        if ($search = $request->get('q')) {
            $query->where('name', 'like', "%$search%");
        }
        if ($request->get('filter') === 'low') {
            $query->lowStock();
        }

        $ingredients = $query->orderBy('name')->paginate(20)->withQueryString();
        $units = Unit::orderBy('name')->get();

        return view('inventory.ingredients.index', compact('ingredients', 'units'));
    }

    public function create()
    {
        return view('inventory.ingredients.form', [
            'ingredient' => new Ingredient(['is_active' => true]),
            'units' => Unit::orderBy('name')->get(),
        ]);
    }

    public function edit(Ingredient $ingredient)
    {
        return view('inventory.ingredients.form', [
            'ingredient' => $ingredient,
            'units' => Unit::orderBy('name')->get(),
        ]);
    }

    public function store(Request $request)
    {
        Ingredient::create($this->validateData($request));

        return redirect()->route('inventory.ingredients.index')->with('success', 'تمت إضافة المكوّن.');
    }

    public function update(Request $request, Ingredient $ingredient)
    {
        $ingredient->update($this->validateData($request));

        return redirect()->route('inventory.ingredients.index')->with('success', 'تم تحديث المكوّن.');
    }

    public function destroy(Ingredient $ingredient)
    {
        if ($ingredient->recipeItems()->exists()) {
            return back()->with('error', 'لا يمكن حذف مكوّن مستخدم في وصفات.');
        }

        $ingredient->delete();

        return back()->with('success', 'تم حذف المكوّن.');
    }

    protected function validateData(Request $request): array
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:120'],
            'unit_id' => ['required', 'exists:units,id'],
            'current_stock' => ['required', 'numeric', 'min:0'],
            'reorder_level' => ['required', 'numeric', 'min:0'],
            'cost_per_unit' => ['required', 'numeric', 'min:0'],
            'is_active' => ['boolean'],
        ]);
        $data['is_active'] = $request->boolean('is_active');

        return $data;
    }
}
