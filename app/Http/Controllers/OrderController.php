<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Services\OrderService;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function __construct(protected OrderService $orders)
    {
    }

    public function index(Request $request)
    {
        $query = Order::with('user')->latest();

        if ($status = $request->get('status')) {
            $query->where('status', $status);
        }
        if ($search = $request->get('q')) {
            $query->where(fn ($q) => $q->where('order_number', 'like', "%$search%")
                ->orWhere('invoice_number', 'like', "%$search%")
                ->orWhere('customer_name', 'like', "%$search%"));
        }
        if ($request->filled('date')) {
            $query->whereDate('created_at', $request->date('date'));
        }

        $orders = $query->paginate(20)->withQueryString();

        return view('orders.index', compact('orders'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'type' => ['required', 'in:dine_in,takeaway'],
            'table_id' => ['nullable', 'exists:tables,id'],
            'customer_name' => ['nullable', 'string', 'max:120'],
            'payment_method' => ['required', 'in:cash,card,transfer'],
            'is_paid' => ['boolean'],
            'notes' => ['nullable', 'string', 'max:500'],
            'discount.type' => ['nullable', 'in:percent,fixed'],
            'discount.value' => ['nullable', 'numeric', 'min:0'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.item_id' => ['required', 'exists:items,id'],
            'items.*.quantity' => ['required', 'integer', 'min:1', 'max:999'],
            'items.*.notes' => ['nullable', 'string', 'max:255'],
            'items.*.discount.type' => ['nullable', 'in:percent,fixed'],
            'items.*.discount.value' => ['nullable', 'numeric', 'min:0'],
        ]);

        // التحقق من صلاحية الخصم
        if (! auth()->user()->can('apply discounts')) {
            unset($data['discount']);
            foreach ($data['items'] as &$line) {
                unset($line['discount']);
            }
        }

        $order = $this->orders->create($data, auth()->user());

        if ($request->wantsJson()) {
            return response()->json([
                'message' => 'تم إرسال الطلب للمطبخ بنجاح.',
                'order' => ['id' => $order->id, 'order_number' => $order->order_number],
                'invoice_url' => route('orders.invoice', $order),
            ]);
        }

        return redirect()->route('orders.invoice', $order)->with('success', 'تم إنشاء الطلب بنجاح.');
    }

    public function show(Order $order)
    {
        $order->load('items.item', 'user', 'shift');

        return view('orders.show', compact('order'));
    }

    public function invoice(Order $order)
    {
        $order->load('items', 'user');

        return view('orders.invoice', compact('order'));
    }

    public function cancel(Order $order)
    {
        $this->orders->cancel($order, auth()->user());

        return back()->with('success', 'تم إلغاء الطلب وعكس آثاره على المخزون والحسابات.');
    }
}
