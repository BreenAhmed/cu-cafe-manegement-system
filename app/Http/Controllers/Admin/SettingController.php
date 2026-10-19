<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;

class SettingController extends Controller
{
    public function index()
    {
        $settings = Setting::all();

        return view('admin.settings.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'brand_name' => ['required', 'string', 'max:100'],
            'currency' => ['required', 'string', 'max:10'],
            'phone' => ['nullable', 'string', 'max:30'],
            'address' => ['nullable', 'string', 'max:200'],
            'invoice_footer' => ['nullable', 'string', 'max:255'],
            'tax_rate' => ['nullable', 'numeric', 'min:0', 'max:100'],
        ]);

        foreach ($data as $key => $value) {
            Setting::put($key, $value, 'general', $key === 'tax_rate' ? 'integer' : 'string');
        }

        return back()->with('success', 'تم حفظ الإعدادات.');
    }

    public function backup()
    {
        try {
            Artisan::call('cu:backup');

            return back()->with('success', 'تم إنشاء نسخة احتياطية لقاعدة البيانات بنجاح.');
        } catch (\Throwable $e) {
            return back()->with('error', 'تعذّر إنشاء النسخة الاحتياطية: ' . $e->getMessage());
        }
    }
}
