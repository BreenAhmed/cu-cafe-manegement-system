<?php

namespace App\Http\Controllers\Menu;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::withCount('items')->orderBy('sort_order')->get();

        return view('menu.categories.index', compact('categories'));
    }

    public function create()
    {
        return redirect()->route('categories.index');
    }

    public function edit()
    {
        return redirect()->route('categories.index');
    }

    public function store(Request $request)
    {
        $data = $this->validateData($request);
        Category::create($data);

        return back()->with('success', 'تمت إضافة التصنيف بنجاح.');
    }

    public function update(Request $request, Category $category)
    {
        $category->update($this->validateData($request));

        return back()->with('success', 'تم تحديث التصنيف بنجاح.');
    }

    public function destroy(Category $category)
    {
        if ($category->items()->exists()) {
            return back()->with('error', 'لا يمكن حذف تصنيف يحتوي على أصناف.');
        }

        $category->delete();

        return back()->with('success', 'تم حذف التصنيف.');
    }

    protected function validateData(Request $request): array
    {
        return $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'color' => ['nullable', 'string', 'max:20'],
            'sort_order' => ['nullable', 'integer', 'min:0'],
            'is_active' => ['boolean'],
        ]);
    }
}
