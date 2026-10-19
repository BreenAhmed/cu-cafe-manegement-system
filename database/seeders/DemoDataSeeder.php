<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\ExpenseCategory;
use App\Models\Ingredient;
use App\Models\Item;
use App\Models\Setting;
use App\Models\Unit;
use App\Models\User;
use App\Services\OrderService;
use App\Services\ShiftService;
use Illuminate\Database\Seeder;

class DemoDataSeeder extends Seeder
{
    public function run(): void
    {
        $this->settings();
        $units = $this->units();
        $ingredients = $this->ingredients($units);
        $categories = $this->categories();
        $this->items($categories, $ingredients);
        $this->expenseCategories();
        $this->demoOrders();
    }

    protected function settings(): void
    {
        Setting::put('brand_name', 'CU', 'general');
        Setting::put('currency', 'ل.س', 'general');
        Setting::put('phone', '01000000000', 'general');
        Setting::put('address', 'القاهرة - مصر', 'general');
        Setting::put('invoice_footer', 'شكراً لزيارتكم كافيه البطيخ! 🍉', 'general');
        Setting::put('tax_rate', 0, 'general', 'integer');
    }

    protected function units(): array
    {
        $data = [
            'g' => ['name' => 'جرام', 'abbreviation' => 'جم'],
            'ml' => ['name' => 'مليلتر', 'abbreviation' => 'مل'],
            'pc' => ['name' => 'قطعة', 'abbreviation' => 'قطعة'],
            'cup' => ['name' => 'كوب', 'abbreviation' => 'كوب'],
        ];

        $units = [];
        foreach ($data as $key => $attrs) {
            $units[$key] = Unit::firstOrCreate(['name' => $attrs['name']], $attrs);
        }

        return $units;
    }

    protected function ingredients(array $units): array
    {
        $data = [
            'watermelon' => ['name' => 'بطيخ طازج', 'unit' => 'g', 'stock' => 50000, 'reorder' => 5000, 'cost' => 0.01],
            'sugar' => ['name' => 'سكر', 'unit' => 'g', 'stock' => 20000, 'reorder' => 2000, 'cost' => 0.02],
            'mint' => ['name' => 'نعناع', 'unit' => 'g', 'stock' => 1000, 'reorder' => 200, 'cost' => 0.05],
            'ice' => ['name' => 'ثلج', 'unit' => 'g', 'stock' => 30000, 'reorder' => 3000, 'cost' => 0.005],
            'cup' => ['name' => 'كوب تقديم', 'unit' => 'pc', 'stock' => 1000, 'reorder' => 100, 'cost' => 1.5],
            'milk' => ['name' => 'حليب', 'unit' => 'ml', 'stock' => 20000, 'reorder' => 2000, 'cost' => 0.03],
            'coffee' => ['name' => 'بُن', 'unit' => 'g', 'stock' => 5000, 'reorder' => 500, 'cost' => 0.2],
            'lemon' => ['name' => 'ليمون', 'unit' => 'pc', 'stock' => 300, 'reorder' => 50, 'cost' => 2],
            'cheese' => ['name' => 'جبنة', 'unit' => 'g', 'stock' => 8000, 'reorder' => 1000, 'cost' => 0.15],
            'bread' => ['name' => 'خبز', 'unit' => 'pc', 'stock' => 200, 'reorder' => 40, 'cost' => 3],
        ];

        $ingredients = [];
        foreach ($data as $key => $attrs) {
            $ingredients[$key] = Ingredient::firstOrCreate(
                ['name' => $attrs['name']],
                [
                    'unit_id' => $units[$attrs['unit']]->id,
                    'current_stock' => $attrs['stock'],
                    'reorder_level' => $attrs['reorder'],
                    'cost_per_unit' => $attrs['cost'],
                    'is_active' => true,
                ]
            );
        }

        return $ingredients;
    }

    protected function categories(): array
    {
        $data = [
            'juices' => ['name' => 'عصائر طازجة', 'color' => '#ef4444', 'sort_order' => 1],
            'hot' => ['name' => 'مشروبات ساخنة', 'color' => '#b45309', 'sort_order' => 2],
            'cold' => ['name' => 'مشروبات باردة', 'color' => '#0ea5e9', 'sort_order' => 3],
            'food' => ['name' => 'مأكولات خفيفة', 'color' => '#16a34a', 'sort_order' => 4],
        ];

        $categories = [];
        foreach ($data as $key => $attrs) {
            $categories[$key] = Category::firstOrCreate(['name' => $attrs['name']], $attrs);
        }

        return $categories;
    }

    protected function items(array $cat, array $ing): void
    {
        $items = [
            ['name' => 'عصير بطيخ', 'category' => 'juices', 'price' => 35, 'prep' => 4, 'recipe' => [['watermelon', 300], ['sugar', 20], ['ice', 100], ['cup', 1]]],
            ['name' => 'عصير بطيخ بالنعناع', 'category' => 'juices', 'price' => 40, 'prep' => 5, 'recipe' => [['watermelon', 300], ['sugar', 15], ['mint', 5], ['ice', 100], ['cup', 1]]],
            ['name' => 'ليموناضة', 'category' => 'juices', 'price' => 30, 'prep' => 4, 'recipe' => [['lemon', 2], ['sugar', 25], ['ice', 120], ['cup', 1]]],
            ['name' => 'قهوة تركي', 'category' => 'hot', 'price' => 25, 'prep' => 6, 'recipe' => [['coffee', 12], ['sugar', 10]]],
            ['name' => 'كابتشينو', 'category' => 'hot', 'price' => 38, 'prep' => 5, 'recipe' => [['coffee', 14], ['milk', 120]]],
            ['name' => 'آيس كوفي', 'category' => 'cold', 'price' => 42, 'prep' => 5, 'recipe' => [['coffee', 14], ['milk', 100], ['ice', 80], ['cup', 1]]],
            ['name' => 'ميلك شيك بطيخ', 'category' => 'cold', 'price' => 45, 'prep' => 6, 'recipe' => [['watermelon', 200], ['milk', 150], ['sugar', 20], ['ice', 60], ['cup', 1]]],
            ['name' => 'ساندويتش جبنة', 'category' => 'food', 'price' => 50, 'prep' => 8, 'recipe' => [['cheese', 80], ['bread', 1]]],
        ];

        foreach ($items as $data) {
            $item = Item::firstOrCreate(
                ['name' => $data['name']],
                [
                    'category_id' => $cat[$data['category']]->id,
                    'price' => $data['price'],
                    'prep_time_minutes' => $data['prep'],
                    'is_available' => true,
                    'track_inventory' => true,
                ]
            );

            if ($item->recipeItems()->count() === 0) {
                foreach ($data['recipe'] as [$ingKey, $qty]) {
                    $item->recipeItems()->create([
                        'ingredient_id' => $ing[$ingKey]->id,
                        'quantity' => $qty,
                    ]);
                }
            }
        }
    }

    protected function expenseCategories(): void
    {
        foreach (['إيجار', 'رواتب', 'مكوّنات', 'صيانة', 'مرافق', 'متنوعة'] as $name) {
            ExpenseCategory::firstOrCreate(['name' => $name], ['is_active' => true]);
        }
    }

    protected function demoOrders(): void
    {
        $cashier = User::where('email', 'cashier@cu.local')->first();
        if (! $cashier || \App\Models\Order::exists()) {
            return;
        }

        /** @var ShiftService $shiftService */
        $shiftService = app(ShiftService::class);
        /** @var OrderService $orderService */
        $orderService = app(OrderService::class);

        if (! $cashier->activeShift()->exists()) {
            $shiftService->open($cashier, 500, 'وردية تجريبية');
        }

        $items = Item::all();
        for ($i = 0; $i < 12; $i++) {
            $picked = $items->random(rand(1, 3));
            $orderService->create([
                'type' => collect(['dine_in', 'takeaway'])->random(),
                'customer_name' => collect(['أحمد', 'سارة', 'محمد', null])->random(),
                'payment_method' => collect(['cash', 'card'])->random(),
                'is_paid' => true,
                'discount' => rand(0, 3) === 0 ? ['type' => 'percent', 'value' => 10] : null,
                'items' => $picked->map(fn ($it) => [
                    'item_id' => $it->id,
                    'quantity' => rand(1, 3),
                    'notes' => null,
                ])->toArray(),
            ], $cashier);
        }
    }
}
