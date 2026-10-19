<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\KitchenController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PosController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ShiftController;
use App\Http\Controllers\Menu\CategoryController;
use App\Http\Controllers\Menu\ItemController;
use App\Http\Controllers\Inventory\IngredientController;
use App\Http\Controllers\Inventory\UnitController;
use App\Http\Controllers\Inventory\SupplierController;
use App\Http\Controllers\Inventory\PurchaseController;
use App\Http\Controllers\Inventory\StockController;
use App\Http\Controllers\Accounting\ExpenseController;
use App\Http\Controllers\Accounting\ExpenseCategoryController;
use App\Http\Controllers\Accounting\TransactionController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\TableController;
use App\Http\Controllers\Admin\ActivityLogController;
use Illuminate\Support\Facades\Route;

// الصفحة الرئيسية: توجيه كل دور لشاشته المناسبة
Route::get('/', function () {
    if (! auth()->check()) {
        return redirect()->route('login');
    }
    $user = auth()->user();
    if ($user->can('access dashboard')) {
        return redirect()->route('dashboard');
    }
    if ($user->can('use pos')) {
        return redirect()->route('pos.index');
    }
    if ($user->can('view kitchen')) {
        return redirect()->route('kitchen.index');
    }
    return redirect()->route('orders.index');
});

// المصادقة
Route::get('login', [LoginController::class, 'show'])->name('login');
Route::post('login', [LoginController::class, 'login'])->middleware('throttle:10,1');
Route::post('logout', [LoginController::class, 'logout'])->name('logout');

Route::middleware('auth')->group(function () {
    Route::get('dashboard', [DashboardController::class, 'index'])
        ->middleware('permission:access dashboard')
        ->name('dashboard');

    // الإشعارات
    Route::get('notifications', [NotificationController::class, 'index'])->name('notifications.index');
    Route::post('notifications/{id}/read', [NotificationController::class, 'markRead'])->name('notifications.read');
    Route::post('notifications/read-all', [NotificationController::class, 'markAllRead'])->name('notifications.readAll');

    // الطاولات
    Route::middleware('permission:use pos')->group(function () {
        Route::get('tables', [TableController::class, 'index'])->name('tables.index');
        Route::get('tables/{table}', [TableController::class, 'show'])->name('tables.show');
        Route::post('tables/{table}/settle', [TableController::class, 'settle'])->name('tables.settle');
        Route::post('tables/{table}/clear', [TableController::class, 'clear'])->name('tables.clear');
    });
    Route::middleware('permission:manage menu')->group(function () {
        Route::post('tables', [TableController::class, 'store'])->name('tables.store');
        Route::put('tables/{table}', [TableController::class, 'update'])->name('tables.update');
        Route::delete('tables/{table}', [TableController::class, 'destroy'])->name('tables.destroy');
    });

    // نقطة البيع (الكاشير)
    Route::middleware('permission:use pos')->group(function () {
        Route::get('pos', [PosController::class, 'index'])->name('pos.index');
        Route::post('orders', [OrderController::class, 'store'])->name('orders.store');
        Route::get('orders/{order}/invoice', [OrderController::class, 'invoice'])->name('orders.invoice');
    });

    Route::get('orders', [OrderController::class, 'index'])->name('orders.index');
    Route::get('orders/{order}', [OrderController::class, 'show'])->name('orders.show');
    Route::post('orders/{order}/cancel', [OrderController::class, 'cancel'])
        ->middleware('permission:use pos|manage accounting')->name('orders.cancel');

    // شاشة المطبخ
    Route::middleware('permission:view kitchen')->group(function () {
        Route::get('kitchen', [KitchenController::class, 'index'])->name('kitchen.index');
        Route::get('kitchen/feed', [KitchenController::class, 'feed'])->name('kitchen.feed');
        Route::post('kitchen/{order}/status', [KitchenController::class, 'updateStatus'])
            ->middleware('permission:update order status')->name('kitchen.status');
    });

    // الورديات
    Route::middleware('permission:manage shifts')->group(function () {
        Route::get('shifts', [ShiftController::class, 'index'])->name('shifts.index');
        Route::post('shifts/open', [ShiftController::class, 'open'])->name('shifts.open');
        Route::post('shifts/{shift}/close', [ShiftController::class, 'close'])->name('shifts.close');
        Route::get('shifts/{shift}', [ShiftController::class, 'show'])->name('shifts.show');
    });

    // إدارة القائمة
    Route::middleware('permission:manage menu')->group(function () {
        Route::resource('categories', CategoryController::class)->except('show');
        Route::resource('items', ItemController::class);
    });

    // المخزون
    Route::middleware('permission:manage inventory')->group(function () {
        Route::resource('ingredients', IngredientController::class)
            ->parameters(['ingredients' => 'ingredient'])->names('inventory.ingredients');
        Route::resource('units', UnitController::class)->except('show')->names('inventory.units');
        Route::get('stock', [StockController::class, 'index'])->name('inventory.stock.index');
        Route::post('stock/waste', [StockController::class, 'waste'])->name('inventory.stock.waste');
        Route::post('stock/adjust', [StockController::class, 'adjust'])->name('inventory.stock.adjust');
    });
    Route::middleware('permission:manage suppliers')->group(function () {
        Route::resource('suppliers', SupplierController::class)->except('show')->names('inventory.suppliers');
    });
    Route::middleware('permission:manage purchases')->group(function () {
        Route::resource('purchases', PurchaseController::class)->only(['index', 'create', 'store', 'show'])->names('inventory.purchases');
    });

    // المحاسبة
    Route::middleware('permission:manage expenses')->group(function () {
        Route::resource('expenses', ExpenseController::class)->except('show')->names('accounting.expenses');
        Route::resource('expense-categories', ExpenseCategoryController::class)
            ->only(['index', 'store', 'update', 'destroy'])->names('accounting.expense-categories');
    });
    Route::middleware('permission:manage accounting')->group(function () {
        Route::get('accounting', [TransactionController::class, 'index'])->name('accounting.index');
        Route::get('transactions', [TransactionController::class, 'list'])->name('accounting.transactions');
    });

    // التقارير
    Route::middleware('permission:view reports')->group(function () {
        Route::get('reports', [ReportController::class, 'index'])->name('reports.index');
        Route::get('reports/sales', [ReportController::class, 'sales'])->name('reports.sales');
        Route::get('reports/inventory', [ReportController::class, 'inventory'])->name('reports.inventory');
        Route::get('reports/profit', [ReportController::class, 'profit'])->name('reports.profit');
        Route::get('reports/export/{type}', [ReportController::class, 'export'])
            ->middleware('permission:export reports')->name('reports.export');
    });

    // الإدارة
    Route::middleware('permission:manage users')->group(function () {
        Route::resource('users', UserController::class)->except('show')->names('admin.users');
    });
    Route::middleware('permission:manage roles')->group(function () {
        Route::get('roles', [RoleController::class, 'index'])->name('admin.roles.index');
        Route::put('roles/{role}', [RoleController::class, 'update'])->name('admin.roles.update');
    });
    Route::middleware('permission:manage settings')->group(function () {
        Route::get('settings', [SettingController::class, 'index'])->name('admin.settings.index');
        Route::put('settings', [SettingController::class, 'update'])->name('admin.settings.update');
        Route::post('settings/backup', [SettingController::class, 'backup'])->name('admin.settings.backup');
    });
    Route::middleware('permission:view audit logs')->group(function () {
        Route::get('activity-logs', [ActivityLogController::class, 'index'])->name('admin.activity.index');
    });
});
