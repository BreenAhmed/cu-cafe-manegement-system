<?php

namespace App\Http\Controllers;

use App\Models\Shift;
use App\Services\ShiftService;
use Illuminate\Http\Request;

class ShiftController extends Controller
{
    public function __construct(protected ShiftService $shifts)
    {
    }

    public function index()
    {
        $activeShift = auth()->user()->activeShift()->first();
        $recent = Shift::with('user')->latest()->paginate(15);

        return view('shifts.index', compact('activeShift', 'recent'));
    }

    public function open(Request $request)
    {
        $data = $request->validate([
            'opening_cash' => ['required', 'numeric', 'min:0'],
            'notes' => ['nullable', 'string', 'max:255'],
        ]);

        $this->shifts->open(auth()->user(), $data['opening_cash'], $data['notes'] ?? null);

        return back()->with('success', 'تم فتح الوردية بنجاح.');
    }

    public function close(Request $request, Shift $shift)
    {
        $data = $request->validate([
            'closing_cash' => ['required', 'numeric', 'min:0'],
            'notes' => ['nullable', 'string', 'max:255'],
        ]);

        $this->shifts->close($shift, $data['closing_cash'], $data['notes'] ?? null);

        return redirect()->route('shifts.show', $shift)->with('success', 'تم إغلاق الوردية.');
    }

    public function show(Shift $shift)
    {
        $shift->load('user');
        $summary = $this->shifts->summary($shift);
        $orders = $shift->orders()->with('user')->latest()->get();

        return view('shifts.show', compact('shift', 'summary', 'orders'));
    }
}
