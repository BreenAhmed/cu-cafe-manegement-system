<?php

namespace App\Http\Controllers\Accounting;

use App\Http\Controllers\Controller;
use App\Models\ExpenseCategory;
use Illuminate\Http\Request;

class ExpenseCategoryController extends Controller
{
    public function index()
    {
        $categories = ExpenseCategory::withCount('expenses')->orderBy('name')->get();

        return view('accounting.expense-categories.index', compact('categories'));
    }

    public function store(Request $request)
    {
        ExpenseCategory::create($this->validateData($request));

        return back()->with('success', 'تمت إضافة فئة المصروف.');
    }

    public function update(Request $request, ExpenseCategory $expenseCategory)
    {
        $expenseCategory->update($this->validateData($request));

        return back()->with('success', 'تم تحديث الفئة.');
    }

    public function destroy(ExpenseCategory $expenseCategory)
    {
        if ($expenseCategory->expenses()->exists()) {
            return back()->with('error', 'لا يمكن حذف فئة مرتبطة بمصروفات.');
        }

        $expenseCategory->delete();

        return back()->with('success', 'تم حذف الفئة.');
    }

    protected function validateData(Request $request): array
    {
        $data = $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'is_active' => ['boolean'],
        ]);
        $data['is_active'] = $request->boolean('is_active');

        return $data;
    }
}
