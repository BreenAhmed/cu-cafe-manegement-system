<?php

namespace App\Http\Controllers\Accounting;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use App\Models\ExpenseCategory;
use App\Services\AccountingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ExpenseController extends Controller
{
    public function __construct(protected AccountingService $accounting)
    {
    }

    public function index(Request $request)
    {
        $query = Expense::with('category', 'user')->latest('spent_at');

        if ($request->filled('category')) {
            $query->where('expense_category_id', $request->get('category'));
        }
        if ($request->filled('from')) {
            $query->whereDate('spent_at', '>=', $request->date('from'));
        }
        if ($request->filled('to')) {
            $query->whereDate('spent_at', '<=', $request->date('to'));
        }

        $expenses = $query->paginate(20)->withQueryString();
        $categories = ExpenseCategory::where('is_active', true)->orderBy('name')->get();
        $total = (clone $query)->getQuery()->sum('amount');

        return view('accounting.expenses.index', compact('expenses', 'categories', 'total'));
    }

    public function create()
    {
        return redirect()->route('accounting.expenses.index');
    }

    public function edit()
    {
        return redirect()->route('accounting.expenses.index');
    }

    public function store(Request $request)
    {
        $data = $this->validateData($request);

        DB::transaction(function () use ($data, $request) {
            $expense = Expense::create([
                ...$data,
                'user_id' => auth()->id(),
                'attachment' => $request->hasFile('attachment')
                    ? $request->file('attachment')->store('expenses', 'public') : null,
            ]);

            $this->accounting->recordExpense($expense);
        });

        return back()->with('success', 'تم تسجيل المصروف.');
    }

    public function update(Request $request, Expense $expense)
    {
        $data = $this->validateData($request);

        DB::transaction(function () use ($data, $expense) {
            $expense->update($data);
            $expense->transaction()->delete();
            $this->accounting->recordExpense($expense->fresh('category'));
        });

        return back()->with('success', 'تم تحديث المصروف.');
    }

    public function destroy(Expense $expense)
    {
        DB::transaction(function () use ($expense) {
            $expense->transaction()->delete();
            $expense->delete();
        });

        return back()->with('success', 'تم حذف المصروف.');
    }

    protected function validateData(Request $request): array
    {
        return $request->validate([
            'expense_category_id' => ['required', 'exists:expense_categories,id'],
            'amount' => ['required', 'numeric', 'min:0.01'],
            'description' => ['required', 'string', 'max:255'],
            'payment_method' => ['required', 'in:cash,card,transfer'],
            'spent_at' => ['required', 'date'],
            'attachment' => ['nullable', 'file', 'max:4096'],
        ]);
    }
}
