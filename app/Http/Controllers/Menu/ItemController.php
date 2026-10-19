<?php

namespace App\Http\Controllers\Menu;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Ingredient;
use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ItemController extends Controller
{
    public function index(Request $request)
    {
        $query = Item::with('category', 'recipeItems.ingredient');

        if ($search = $request->get('q')) {
            $query->where('name', 'like', "%$search%");
        }
        if ($request->filled('category')) {
            $query->where('category_id', $request->get('category'));
        }
        if ($request->filled('status')) {
            $query->where('is_available', $request->get('status') === 'available');
        }

        $items = $query->orderBy('name')->paginate(15)->withQueryString();
        $categories = Category::orderBy('name')->get();

        return view('menu.items.index', compact('items', 'categories'));
    }

    public function create()
    {
        return view('menu.items.form', [
            'item' => new Item(['is_available' => true, 'track_inventory' => true, 'prep_time_minutes' => 5]),
            'categories' => Category::orderBy('name')->get(),
            'ingredients' => Ingredient::with('unit')->orderBy('name')->get(),
        ]);
    }

    public function edit(Item $item)
    {
        $item->load('recipeItems');

        return view('menu.items.form', [
            'item' => $item,
            'categories' => Category::orderBy('name')->get(),
            'ingredients' => Ingredient::with('unit')->orderBy('name')->get(),
        ]);
    }

    public function store(Request $request)
    {
        $data = $this->validateData($request);

        DB::transaction(function () use ($request, $data) {
            $item = Item::create($this->payload($data, $request));
            $this->syncRecipe($item, $request);
        });

        return redirect()->route('items.index')->with('success', 'تمت إضافة الصنف بنجاح.');
    }

    public function update(Request $request, Item $item)
    {
        $data = $this->validateData($request, $item);

        DB::transaction(function () use ($request, $data, $item) {
            $item->update($this->payload($data, $request, $item));
            $this->syncRecipe($item, $request);
        });

        return redirect()->route('items.index')->with('success', 'تم تحديث الصنف بنجاح.');
    }

    public function destroy(Item $item)
    {
        $item->delete();

        return back()->with('success', 'تم حذف الصنف.');
    }

    protected function validateData(Request $request, ?Item $item = null): array
    {
        return $request->validate([
            'category_id' => ['required', 'exists:categories,id'],
            'name' => ['required', 'string', 'max:120'],
            'sku' => ['nullable', 'string', 'max:50', 'unique:items,sku' . ($item ? ",{$item->id}" : '')],
            'price' => ['required', 'numeric', 'min:0'],
            'manual_cost' => ['nullable', 'numeric', 'min:0'],
            'description' => ['nullable', 'string', 'max:1000'],
            'prep_time_minutes' => ['required', 'integer', 'min:1', 'max:240'],
            'track_inventory' => ['boolean'],
            'is_available' => ['boolean'],
            'image' => ['nullable', 'image', 'max:2048'],
            'recipe' => ['nullable', 'array'],
            'recipe.*.ingredient_id' => ['nullable', 'exists:ingredients,id'],
            'recipe.*.quantity' => ['nullable', 'numeric', 'min:0'],
        ]);
    }

    protected function payload(array $data, Request $request, ?Item $item = null): array
    {
        $payload = collect($data)->except('image', 'recipe')->toArray();
        $payload['track_inventory'] = $request->boolean('track_inventory');
        $payload['is_available'] = $request->boolean('is_available');

        if ($request->hasFile('image')) {
            $payload['image'] = $request->file('image')->store('items', 'public');
        }

        return $payload;
    }

    protected function syncRecipe(Item $item, Request $request): void
    {
        $item->recipeItems()->delete();

        foreach ($request->input('recipe', []) as $line) {
            if (! empty($line['ingredient_id']) && ! empty($line['quantity'])) {
                $item->recipeItems()->create([
                    'ingredient_id' => $line['ingredient_id'],
                    'quantity' => $line['quantity'],
                ]);
            }
        }
    }
}
