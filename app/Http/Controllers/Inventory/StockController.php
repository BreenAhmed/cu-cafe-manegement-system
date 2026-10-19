<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Ingredient;
use App\Models\StockMovement;
use App\Services\InventoryService;
use Illuminate\Http\Request;

class StockController extends Controller
{
    public function __construct(protected InventoryService $inventory)
    {
    }

    public function index(Request $request)
    {
        $query = StockMovement::with('ingredient.unit', 'user')->latest();

        if ($request->filled('ingredient')) {
            $query->where('ingredient_id', $request->get('ingredient'));
        }
        if ($request->filled('type')) {
            $query->where('type', $request->get('type'));
        }

        $movements = $query->paginate(25)->withQueryString();
        $ingredients = Ingredient::with('unit')->orderBy('name')->get();
        $lowStock = Ingredient::lowStock()->where('is_active', true)->with('unit')->get();

        return view('inventory.stock.index', compact('movements', 'ingredients', 'lowStock'));
    }

    public function waste(Request $request)
    {
        $data = $request->validate([
            'ingredient_id' => ['required', 'exists:ingredients,id'],
            'quantity' => ['required', 'numeric', 'min:0.001'],
            'notes' => ['nullable', 'string', 'max:255'],
        ]);

        $ingredient = Ingredient::findOrFail($data['ingredient_id']);
        $this->inventory->waste($ingredient, $data['quantity'], auth()->id(), $data['notes'] ?? null);

        return back()->with('success', 'تم تسجيل الهدر وخصمه من المخزون.');
    }

    public function adjust(Request $request)
    {
        $data = $request->validate([
            'ingredient_id' => ['required', 'exists:ingredients,id'],
            'target_stock' => ['required', 'numeric', 'min:0'],
            'notes' => ['nullable', 'string', 'max:255'],
        ]);

        $ingredient = Ingredient::findOrFail($data['ingredient_id']);
        $this->inventory->adjustTo($ingredient, $data['target_stock'], auth()->id(), $data['notes'] ?? null);

        return back()->with('success', 'تمت تسوية المخزون بنجاح.');
    }
}
