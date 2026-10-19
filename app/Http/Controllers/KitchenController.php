<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Services\OrderService;
use Illuminate\Http\Request;

class KitchenController extends Controller
{
    public function index()
    {
        return view('kitchen.index');
    }

    /**
     * بيانات الطلبات النشطة (تستخدم للتحميل الأولي وكبديل احتياطي للبث المباشر).
     */
    public function feed()
    {
        $orders = Order::activeKitchen()
            ->with('items', 'user', 'table')
            ->orderBy('created_at')
            ->get()
            ->map(fn (Order $order) => [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'type' => $order->type,
                'type_label' => $order->type_label,
                'status' => $order->status,
                'status_label' => $order->status_label,
                'customer_name' => $order->customer_name,
                'notes' => $order->notes,
                'cashier' => $order->user?->name,
                'table_name' => $order->table?->name,
                'created_at' => $order->created_at->toIso8601String(),
                'created_human' => $order->created_at->format('H:i'),
                'items' => $order->items->map(fn ($i) => [
                    'name' => $i->name,
                    'quantity' => $i->quantity,
                    'notes' => $i->notes,
                ])->values(),
            ]);

        return response()->json(['orders' => $orders]);
    }

    public function updateStatus(Request $request, Order $order, OrderService $service)
    {
        $data = $request->validate([
            'status' => ['required', 'in:new,preparing,ready,delivered'],
        ]);

        $service->updateStatus($order, $data['status']);

        if ($request->wantsJson()) {
            return response()->json(['status' => $order->status, 'label' => $order->status_label]);
        }

        return back();
    }
}
