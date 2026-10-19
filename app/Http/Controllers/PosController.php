<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Table;

class PosController extends Controller
{
    public function index()
    {
        $categories = Category::active()
            ->with(['items' => fn ($q) => $q->available()->orderBy('name')])
            ->orderBy('sort_order')
            ->get()
            ->filter(fn ($c) => $c->items->isNotEmpty())
            ->values();

        $activeShift = auth()->user()->activeShift()->first();

        $tables = Table::active()
            ->with(['activeOrders.items'])
            ->get()
            ->map(fn (Table $t) => [
                'id'            => $t->id,
                'name'          => $t->name,
                'capacity'      => $t->capacity,
                'status'        => $t->status,
                'running_total' => $t->running_total,
                // الدائرة الحمراء تعرض عدد الأصناف في الفاتورة المفتوحة
                'orders_count'  => $t->activeOrders->first()?->items->count() ?? 0,
            ]);

        return view('pos.index', compact('categories', 'activeShift', 'tables'));
    }
}
