@if (session('success'))
    <div x-data="{ show: true }" x-show="show" x-init="setTimeout(() => show = false, 5000)"
         class="mb-4 flex items-center justify-between gap-3 bg-brand-50 border border-brand-200 text-brand-800 px-4 py-3 rounded-xl">
        <div class="flex items-center gap-2"><x-icon name="check" class="w-5 h-5" /> {{ session('success') }}</div>
        <button @click="show = false"><x-icon name="x" class="w-4 h-4" /></button>
    </div>
@endif

@if (session('error'))
    <div class="mb-4 flex items-center gap-2 bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-xl">
        <x-icon name="x" class="w-5 h-5" /> {{ session('error') }}
    </div>
@endif

@if ($errors->any())
    <div class="mb-4 bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-xl">
        <ul class="list-disc pr-5 space-y-1 text-sm">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
