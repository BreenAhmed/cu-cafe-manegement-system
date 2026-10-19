<?php

namespace App\Events;

use App\Models\Order;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class OrderCreated implements ShouldBroadcastNow
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function __construct(public Order $order)
    {
    }

    public function broadcastOn(): array
    {
        return [new PrivateChannel('kitchen')];
    }

    public function broadcastAs(): string
    {
        return 'order.created';
    }

    public function broadcastWith(): array
    {
        return ['order' => $this->orderPayload()];
    }

    protected function orderPayload(): array
    {
        $this->order->loadMissing('items', 'user', 'table');

        return [
            'id' => $this->order->id,
            'order_number' => $this->order->order_number,
            'type' => $this->order->type,
            'type_label' => $this->order->type_label,
            'status' => $this->order->status,
            'status_label' => $this->order->status_label,
            'customer_name' => $this->order->customer_name,
            'table_name' => $this->order->table?->name,
            'notes' => $this->order->notes,
            'cashier' => $this->order->user?->name,
            'created_at' => $this->order->created_at->toIso8601String(),
            'created_human' => $this->order->created_at->format('H:i'),
            'items' => $this->order->items->map(fn ($i) => [
                'name' => $i->name,
                'quantity' => $i->quantity,
                'notes' => $i->notes,
            ])->values(),
        ];
    }
}
