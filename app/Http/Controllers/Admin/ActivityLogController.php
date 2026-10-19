<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Activitylog\Models\Activity;

class ActivityLogController extends Controller
{
    public function index(Request $request)
    {
        $query = Activity::with('causer')->latest();

        if ($request->filled('log')) {
            $query->where('log_name', $request->get('log'));
        }

        $activities = $query->paginate(40)->withQueryString();
        $logs = Activity::query()->distinct()->pluck('log_name')->filter()->values();

        return view('admin.activity.index', compact('activities', 'logs'));
    }
}
