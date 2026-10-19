<?php

namespace App\Http\Controllers;

use App\Models\Table;
use App\Services\TableService;
use Illuminate\Http\Request;

class TableController extends Controller
{
    public function __construct(protected TableService $tables)
    {
    }

    /** لوحة إدارة الطاولات (للمدير والكاشير). */
    public function index()
    {
        $tables = Table::active()
            ->with(['activeOrders.items'])
            ->get();

        return view('tables.index', compact('tables'));
    }

    /** CRUD — إضافة / تعديل / حذف الطاولات (للمدير فقط). */
    public function store(Request $request)
    {
        $data = $this->validateData($request);
        Table::create($data);

        return back()->with('success', 'تمت إضافة الطاولة.');
    }

    public function update(Request $request, Table $table)
    {
        $table->update($this->validateData($request, $table));

        return back()->with('success', 'تم تحديث الطاولة.');
    }

    public function destroy(Table $table)
    {
        if ($table->isOccupied()) {
            return back()->with('error', 'لا يمكن حذف طاولة مشغولة.');
        }
        $table->delete();

        return back()->with('success', 'تم حذف الطاولة.');
    }

    /** ─── تسوية الطاولة (دفع الحساب وتحرير الطاولة) ─── */
    public function settle(Request $request, Table $table)
    {
        $data = $request->validate([
            'payment_method' => ['required', 'in:cash,card,transfer'],
        ]);

        $summary = $this->tables->settle($table, $data['payment_method']);

        if ($request->wantsJson()) {
            return response()->json([
                'message' => "تمت تسوية الطاولة {$table->name} بنجاح.",
                'summary' => $summary,
            ]);
        }

        return redirect()->route('tables.index')
            ->with('success', "تمت تسوية الطاولة {$table->name} — {$summary['orders']} طلبات، المجموع: " . money($summary['total']));
    }

    /** تحرير الطاولة بإلغاء الطلبات (حالات الإلغاء). */
    public function clear(Table $table)
    {
        $this->tables->clear($table);

        return back()->with('success', "تم إلغاء طلبات الطاولة {$table->name} وتحريرها.");
    }

    /** بيانات الطاولة لواجهة POS (Ajax) — طلب واحد مجمّع لكل جلسة. */
    public function show(Table $table)
    {
        $table->load('activeOrders.items');

        // الطلب الوحيد المفتوح (نموذج طلب واحد لكل طاولة)
        $order = $table->activeOrders->first();

        $orderData = $order ? [
            'id'           => $order->id,
            'order_number' => $order->order_number,
            'total'        => (float) $order->total,
            'status'       => $order->status,
            'status_label' => $order->status_label,
            'created_at'   => $order->created_at->format('H:i'),
            'items'        => $order->items->map(fn ($i) => [
                'name'     => $i->name,
                'quantity' => $i->quantity,
                'total'    => (float) $i->net_total,
                'notes'    => $i->notes,
            ])->values(),
        ] : null;

        return response()->json([
            'table' => [
                'id'            => $table->id,
                'name'          => $table->name,
                'status'        => $table->status,
                'status_label'  => $table->status_label,
                'running_total' => $order ? (float) $order->total : 0,
                // POS يستخدم مصفوفة "orders" — نعيد قائمة بطلب واحد للتوافق
                'orders'        => $orderData ? [$orderData] : [],
            ],
        ]);
    }

    protected function validateData(Request $request, ?Table $table = null): array
    {
        $data = $request->validate([
            'name'       => ['required', 'string', 'max:60'],
            'capacity'   => ['required', 'integer', 'min:1', 'max:100'],
            'sort_order' => ['nullable', 'integer', 'min:0'],
            'is_active'  => ['boolean'],
        ]);
        $data['is_active'] = $request->boolean('is_active');

        return $data;
    }
}
