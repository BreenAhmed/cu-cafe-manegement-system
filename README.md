# CU — Cafe Management System
Arabic-first (RTL) web application for running a cafe or small restaurant: point of sale, kitchen display, table service, inventory, accounting, reports, and admin tools.
Built with **Laravel 13**, **Blade**, **Vite**, **Alpine.js**, and **Tailwind CSS**. Role-based access uses [Spatie Laravel Permission](https://github.com/spatie/laravel-permission). Real-time kitchen and cashier updates use [Laravel Reverb](https://laravel.com/docs/reverb) with Laravel Echo.
## Features
| Area | Capabilities |
|------|----------------|
| **POS (Cashier)** | Create orders, invoices (PDF), discounts, table linking |
| **Kitchen** | Live order board, status updates, WebSocket feed |
| **Tables** | Open, settle, and clear tables; CRUD for managers |
| **Shifts** | Open and close cashier shifts |
| **Menu** | Categories and items with recipes (ingredient consumption) |
| **Inventory** | Ingredients, units, stock adjustments, waste, suppliers, purchases |
| **Accounting** | Expenses, expense categories, transaction ledger |
| **Reports** | Sales, inventory consumption, profit; PDF export |
| **Admin** | Users, roles and permissions, settings, database backup, activity audit log |
After login, users are redirected by permission: dashboard, then POS, then kitchen, then the orders list.
## Tech stack
- PHP 8.3+
- Laravel 13.x
- MySQL
- Session, cache, and queue via database drivers (configurable)
- PDF: `barryvdh/laravel-dompdf`
- Audit: `spatie/laravel-activitylog`
- Frontend: Vite, Cairo font, RTL layout
## Requirements
- PHP 8.3+ with Laravel-required extensions
- Composer
- Node.js and npm (for frontend assets)
- MySQL 8+ (or compatible)
- Optional: Redis; Reverb or another WebSocket server for live kitchen updates
## Local setup
1. Install PHP dependencies:
   ```bash
   composer install
   ```
2. Configure environment:
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```
   Set at minimum: `APP_NAME`, `APP_URL`, `APP_LOCALE=ar`, database credentials, and session/queue/cache drivers.
3. Migrate and seed:
   ```bash
   php artisan migrate
   php artisan db:seed
   ```
   Or use the Composer setup script (install, key, migrate, npm build):
   ```bash
   composer setup
   ```
4. Link storage and ensure `storage/` and `bootstrap/cache/` are writable:
   ```bash
   php artisan storage:link
   ```
5. Build frontend assets:
   ```bash
   npm install
   npm run build
   ```
   For local development with hot reload:
   ```bash
   composer dev
   ```
6. Run a queue worker if the app dispatches jobs:
   ```bash
   php artisan queue:work
   ```
## Default seeded users (development only)
After `db:seed`, demo accounts use password **`password`**. Change these immediately in production.
| Role | Email |
|------|--------|
| Manager (مدير) | `manager@cu.local` |
| Cashier (كاشير) | `cashier@cu.local` |
| Kitchen (مطبخ) | `chef@cu.local` |
| Accountant (محاسب) | `accountant@cu.local` |
| Store (مسؤول المخزن) | `storage@cu.local` |
Demo menu and inventory data is loaded by `DemoDataSeeder`.
## Roles and permissions
Defined in `database/seeders/RolePermissionSeeder.php`:
- **مدير** — all permissions
- **كاشير** — POS, shifts, kitchen view and update
- **مطبخ** — kitchen only
- **محاسب** — dashboard, accounting, expenses, reports
- **مسؤول المخزن** — inventory, suppliers, purchases, reports
Permission slugs are English (e.g. `use pos`, `manage inventory`); labels in the UI are Arabic.
## Real-time (kitchen / cashier)
Broadcast channels: `kitchen`, `cashier` (see `routes/channels.php`).
1. Set `BROADCAST_CONNECTION=reverb` in `.env`.
2. Configure `REVERB_*` and matching `VITE_REVERB_*` variables.
3. Run `php artisan reverb:start`.
4. Rebuild assets: `npm run build`.
Client setup lives in `resources/js/echo.js`.
## Deployment
This project can be deployed with the web root at `public_html` (`index.php` at the project root). Typical production steps:
- `APP_ENV=production`, `APP_DEBUG=false`
- `composer install --no-dev --optimize-autoloader`
- `php artisan migrate --force` (avoid demo seeders on production unless intended)
- `npm ci && npm run build`
- `php artisan storage:link`
- Optional: `php artisan config:cache`, `route:cache`, `view:cache`
- Cron: `* * * * * php /path/to/artisan schedule:run`
- Process supervisor for `queue:work` and Reverb if used
**Never commit `.env` or expose secrets in the repository.**
## Testing
```bash
composer test
```
Or:
```bash
php artisan test
```
## Project structure
```
app/                 Controllers, models, services
database/migrations  Orders, recipes, stock, shifts, etc.
database/seeders     Roles, permissions, demo data
resources/views/     Blade UI (RTL)
routes/web.php       Auth and permission-protected routes
resources/js/        Echo / Reverb client
```
## License
MIT (Laravel application skeleton). Application-specific licensing is up to the project owner.