<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <style>
        * { font-family: 'DejaVu Sans', sans-serif; }
        body { direction: rtl; color: #1e293b; font-size: 12px; }
        h1 { font-size: 18px; color: #16a34a; margin-bottom: 2px; }
        .muted { color: #64748b; font-size: 11px; }
        .cards { width: 100%; margin: 16px 0; }
        .cards td { background: #f1f5f9; padding: 10px; border-radius: 6px; width: 25%; }
        .cards .label { color: #64748b; font-size: 10px; }
        .cards .val { font-size: 15px; font-weight: bold; }
        table.data { width: 100%; border-collapse: collapse; margin-top: 10px; }
        table.data th { background: #16a34a; color: #fff; padding: 6px; text-align: right; }
        table.data td { padding: 6px; border-bottom: 1px solid #e2e8f0; }
        h3 { margin-top: 20px; border-right: 3px solid #16a34a; padding-right: 8px; }
    </style>
</head>
<body>
    <h1>كافيه البطيخ CU — تقرير {{ ['summary'=>'ملخص','sales'=>'مبيعات'][$type] ?? $type }}</h1>
    <div class="muted">الفترة: {{ $from->format('Y-m-d') }} إلى {{ $to->format('Y-m-d') }} · تاريخ الإصدار: {{ now()->format('Y-m-d H:i') }}</div>

    <table class="cards"><tr>
        <td><div class="label">المبيعات الصافية</div><div class="val">{{ money($sales['net']) }}</div></td>
        <td><div class="label">الأرباح</div><div class="val">{{ money($sales['profit']) }}</div></td>
        <td><div class="label">المصروفات</div><div class="val">{{ money($expenses) }}</div></td>
        <td><div class="label">عدد الطلبات</div><div class="val">{{ $sales['orders'] }}</div></td>
    </tr></table>

    <h3>الأصناف الأكثر مبيعاً</h3>
    <table class="data">
        <thead><tr><th>الصنف</th><th>الكمية</th><th>الإيراد</th></tr></thead>
        <tbody>
            @forelse ($bestSellers as $b)<tr><td>{{ $b['name'] }}</td><td>{{ (int)$b['qty'] }}</td><td>{{ money($b['revenue']) }}</td></tr>@empty<tr><td colspan="3">لا بيانات</td></tr>@endforelse
        </tbody>
    </table>

    <h3>المبيعات حسب الكاشير</h3>
    <table class="data">
        <thead><tr><th>الكاشير</th><th>الطلبات</th><th>المبيعات</th></tr></thead>
        <tbody>
            @forelse ($byCashier as $c)<tr><td>{{ $c['cashier'] }}</td><td>{{ (int)$c['orders'] }}</td><td>{{ money($c['net']) }}</td></tr>@empty<tr><td colspan="3">لا بيانات</td></tr>@endforelse
        </tbody>
    </table>

    <h3>استهلاك المخزون</h3>
    <table class="data">
        <thead><tr><th>المكوّن</th><th>الكمية المستهلكة</th><th>التكلفة</th></tr></thead>
        <tbody>
            @forelse ($consumption as $c)<tr><td>{{ $c['ingredient'] }}</td><td>{{ number_format($c['consumed'],3) }}</td><td>{{ money($c['cost']) }}</td></tr>@empty<tr><td colspan="3">لا بيانات</td></tr>@endforelse
        </tbody>
    </table>
</body>
</html>
