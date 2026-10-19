<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>فاتورة #{{ $order->order_number }}</title>
    <link href="https://fonts.bunny.net/css?family=cairo:400,600,700&display=swap" rel="stylesheet">
    <style>
        /* ─── شاشة العرض ─────────────────────────────────────────────────── */
        * { font-family: 'Cairo', sans-serif; box-sizing: border-box; }
        body { background: #f1f5f9; margin: 0; padding: 20px; color: #1e293b; }
        .receipt { background: #fff; max-width: 360px; margin: 0 auto; padding: 24px; border-radius: 12px; box-shadow: 0 4px 24px #0001; }
        .center { text-align: center; }
        .logo-img { width: 90px; height: auto; display: block; margin: 0 auto 6px; }
        h1 { font-size: 17px; margin: 6px 0 2px; }
        .muted { color: #64748b; font-size: 11.5px; }
        hr.dashed { border: none; border-top: 1px dashed #cbd5e1; margin: 8px 0; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; font-size: 12.5px; }
        th, td { text-align: right; padding: 5px 2px; }
        thead th { border-bottom: 1px dashed #cbd5e1; color: #64748b; font-weight: 600; font-size: 11.5px; }
        tbody td { border-bottom: 1px dashed #e2e8f0; }
        .totals { margin-top: 10px; font-size: 12.5px; }
        .totals .row { display: flex; justify-content: space-between; padding: 3px 0; }
        .grand { font-size: 17px; font-weight: 800; border-top: 2px solid #1e293b; padding-top: 7px; margin-top: 4px; }
        .footer-note { font-size: 11.5px; color: #64748b; text-align: center; margin-top: 16px; }
        .actions { max-width: 360px; margin: 16px auto 0; display: flex; gap: 8px; flex-wrap: wrap; }
        .btn { flex: 1; min-width: 120px; text-align: center; padding: 10px 6px; border-radius: 10px; text-decoration: none; font-weight: 700; font-size: 13px; cursor: pointer; border: none; }
        .btn-80 { background: #16a34a; color: #fff; }
        .btn-58 { background: #0f766e; color: #fff; }
        .btn-a4 { background: #64748b; color: #fff; }
        .btn-back { background: #e2e8f0; color: #1e293b; }
        .print-hint { max-width: 360px; margin: 8px auto 0; font-size: 11.5px; color: #94a3b8; text-align: center; }

        /* ─── طباعة حرارية عامة ──────────────────────────────────────────── */
        @media print {
            body { background: #fff !important; margin: 0; padding: 0; }
            .actions, .print-hint { display: none !important; }
            .receipt {
                box-shadow: none !important;
                border-radius: 0 !important;
                padding: 3mm 2mm !important;
                margin: 0 !important;
            }
            /* إخفاء الألوان للطابعة الحرارية */
            * { color: #000 !important; background: transparent !important; }
            .logo-img { width: 60px; }
            h1 { font-size: 14px; }
            .muted { font-size: 10px; }
            table { font-size: 11px; }
            thead th { font-size: 10px; }
            .totals { font-size: 11px; }
            .grand { font-size: 14px; }
            .footer-note { font-size: 10px; margin-top: 8px; }
            hr.dashed { border-top: 1px dashed #000; }
        }

        /* ─── ورق 80 مم (الأكثر شيوعاً في المطاعم) ─────────────────────── */
        @media print and (max-width: 82mm) {
            @page { size: 80mm auto; margin: 0; }
            body { width: 80mm; }
            .receipt { max-width: 80mm; width: 80mm; }
        }

        /* ─── ورق 58 مم (الطابعات الصغيرة) ─────────────────────────────── */
        @media print and (max-width: 60mm) {
            @page { size: 58mm auto; margin: 0; }
            body { width: 58mm; }
            .receipt { max-width: 58mm; width: 58mm; }
            table { font-size: 10px; }
            th, td { padding: 3px 1px; }
        }
    </style>
    <script>
        /* ضبط حجم الورق قبل الطباعة */
        function printReceipt(mm) {
            const old = document.getElementById('print-page-style');
            if (old) old.remove();
            const style = document.createElement('style');
            style.id = 'print-page-style';
            // كل القواعد داخل @media print حتى لا تؤثر على شاشة العرض
            style.textContent = `@media print { @page { size: ${mm}mm auto; margin: 0; } body { width: ${mm}mm !important; } .receipt { max-width: ${mm}mm !important; width: ${mm}mm !important; } }`;
            document.head.appendChild(style);
            window.print();
            // إزالة النمط بعد الطباعة حتى تعود الصفحة لمظهرها الطبيعي
            window.addEventListener('afterprint', () => {
                document.getElementById('print-page-style')?.remove();
            }, { once: true });
        }
        function printA4() {
            const old = document.getElementById('print-page-style');
            if (old) old.remove();
            const style = document.createElement('style');
            style.id = 'print-page-style';
            style.textContent = `@media print { @page { size: A4; margin: 15mm; } body { width: auto !important; } .receipt { max-width: 360px !important; } }`;
            document.head.appendChild(style);
            window.print();
            window.addEventListener('afterprint', () => {
                document.getElementById('print-page-style')?.remove();
            }, { once: true });
        }
    </script>
</head>
<body>
    <div class="receipt">
        <div class="center">
            <img src="{{ asset('cu_logo.png') }}" alt="CU" class="logo-img">
            <h1>{{ \App\Models\Setting::get('brand_name', 'CU') }}</h1>
            @if(\App\Models\Setting::get('phone'))
                <div class="muted">{{ \App\Models\Setting::get('phone') }}</div>
            @endif
            @if(\App\Models\Setting::get('address'))
                <div class="muted">{{ \App\Models\Setting::get('address') }}</div>
            @endif
        </div>

        <hr class="dashed">

        <div class="muted" style="display:flex; justify-content:space-between;">
            <span>{{ $order->created_at->format('Y-m-d H:i') }}</span>
            <span>{{ $order->type_label }}</span>
        </div>
        <div class="muted" style="display:flex; justify-content:space-between;">
            <span>فاتورة: {{ $order->invoice_number }}</span>
            <span>طلب #{{ $order->order_number }}</span>
        </div>
        <div class="muted" style="display:flex; justify-content:space-between;">
            <span>الكاشير: {{ $order->user?->name }}</span>
            @if($order->customer_name)<span>{{ $order->customer_name }}</span>@endif
        </div>

        <hr class="dashed">

        <table>
            <thead>
                <tr>
                    <th style="text-align:right">الصنف</th>
                    <th style="text-align:center">الكمية</th>
                    <th style="text-align:left">الإجمالي</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($order->items as $item)
                    <tr>
                        <td style="text-align:right">
                            {{ $item->name }}
                            @if($item->notes)
                                <br><span class="muted" style="font-size:10px">📝 {{ $item->notes }}</span>
                            @endif
                            @if($item->discount_amount > 0)
                                <br><span class="muted" style="font-size:10px">خصم: -{{ money($item->discount_amount, false) }}</span>
                            @endif
                        </td>
                        <td style="text-align:center">{{ $item->quantity }}</td>
                        <td style="text-align:left; font-weight:600">{{ money($item->net_total, false) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <hr class="dashed">

        <div class="totals">
            @if($order->subtotal != $order->total)
                <div class="row"><span>المجموع</span><span>{{ money($order->subtotal) }}</span></div>
            @endif
            @if($order->discount_total > 0)
                <div class="row" style="color:#dc2626"><span>الخصم</span><span>- {{ money($order->discount_total) }}</span></div>
            @endif
            <div class="row"><span>طريقة الدفع</span><span>{{ $order->payment_method_label }}</span></div>
            <div class="row grand"><span>الإجمالي</span><span>{{ money($order->total) }}</span></div>
        </div>

        @if(\App\Models\Setting::get('invoice_footer', 'شكراً لزيارتكم! 🍉'))
            <div class="footer-note">
                {{ \App\Models\Setting::get('invoice_footer', 'شكراً لزيارتكم! 🍉') }}
            </div>
        @endif
    </div>

    <div class="actions">
        <button class="btn btn-80" onclick="printReceipt(80)">🖨️ طباعة 80مم</button>
        <button class="btn btn-58" onclick="printReceipt(58)">🖨️ طباعة 58مم</button>
        <button class="btn btn-a4"  onclick="printA4()">📄 طباعة A4</button>
        <a class="btn btn-back" href="{{ route('pos.index') }}">طلب جديد</a>
    </div>
    <p class="print-hint">اختر حجم ورق الطابعة الحرارية · 80مم الأكثر شيوعاً في المطاعم</p>
</body>
</html>
