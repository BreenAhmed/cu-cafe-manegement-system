<?php

namespace App\Http\Controllers\Inventory;

use App\Http\Controllers\Controller;
use App\Models\Ingredient;
use App\Models\Purchase;
use App\Models\Supplier;
use App\Services\AccountingService;
use App\Services\InventoryService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PurchaseController extends Controller
{
    public function __construct(
        protected InventoryService $inventory,
        protected AccountingService $accounting,
    ) {
    }

    public function index()
    {
        $purchases = Purchase::with('supplier', 'user')->latest()->paginate(20);

        return view('inventory.purchases.index', compact('purchases'));
    }

    public function create()
    {
        return view('inventory.purchases.create', [
            'suppliers' => Supplier::where('is_active', true)->orderBy('name')->get(),
            'ingredients' => Ingredient::with('unit')->orderBy('name')->get(),
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'supplier_id' => ['nullable', 'exists:suppliers,id'],
            'purchased_at' => ['required', 'date'],
            'notes' => ['nullable', 'string', 'max:500'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.ingredient_id' => ['required', 'exists:ingredients,id'],
            'items.*.quantity' => ['required', 'numeric', 'min:0.001'],
            'items.*.unit_cost' => ['required', 'numeric', 'min:0'],
        ]);

        $purchase = DB::transaction(function () use ($data) {
            $purchase = Purchase::create([
                'reference' => 'PO-' . now()->format('Ymd') . '-' . strtoupper(substr(uniqid(), -5)),
                'supplier_id' => $data['supplier_id'] ?? null,
                'user_id' => auth()->id(),
                'purchased_at' => $data['purchased_at'],
                'notes' => $data['notes'] ?? null,
                'total' => 0,
            ]);

            $total = 0;
            foreach ($data['items'] as $line) {
                $ingredient = Ingredient::findOrFail($line['ingredient_id']);
                $lineTotal = round($line['quantity'] * $line['unit_cost'], 2);
                $total += $lineTotal;

                $purchase->items()->create([
                    'ingredient_id' => $ingredient->id,
                    'quantity' => $line['quantity'],
                    'unit_cost' => $line['unit_cost'],
                    'total' => $lineTotal,
                ]);

                // إضافة للمخزون وتحديث متوسط التكلفة
                $this->inventory->purchase($ingredient, $line['quantity'], $line['unit_cost'], $purchase, auth()->id());
            }

            $purchase->update(['total' => $total]);

            // مزامنة محاسبية: تسجيل المصروف
            $this->accounting->recordPurchase($purchase);

            return $purchase;
        });

        return redirect()->route('inventory.purchases.show', $purchase)->with('success', 'تم تسجيل فاتورة الشراء وتحديث المخزون.');
    }

    public function show(Purchase $purchase)
    {
        $purchase->load('items.ingredient.unit', 'supplier', 'user');

        return view('inventory.purchases.show', compact('purchase'));
    }
}
