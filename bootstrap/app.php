<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        channels: __DIR__.'/../routes/channels.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->alias([
            'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
            'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
            'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
        ]);

        $middleware->web(append: [
            \App\Http\Middleware\SetArabicLocale::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        $exceptions->shouldRenderJsonWhen(
            fn (Request $request) => $request->is('api/*') || $request->expectsJson(),
        );

        $exceptions->render(function (\Spatie\Permission\Exceptions\UnauthorizedException $e, Request $request) {
            if ($request->wantsJson()) {
                return response()->json(['message' => 'ليس لديك صلاحية للوصول لهذه الصفحة.'], 403);
            }

            if (auth()->check()) {
                $user = auth()->user();
                $home = match (true) {
                    $user->can('use pos')        => route('pos.index'),
                    $user->can('view kitchen')   => route('kitchen.index'),
                    default                      => route('orders.index'),
                };
                return redirect($home)->with('error', 'ليس لديك صلاحية للوصول لهذه الصفحة.');
            }

            return redirect()->route('login');
        });
    })->create()->usePublicPath(dirname(__DIR__));
