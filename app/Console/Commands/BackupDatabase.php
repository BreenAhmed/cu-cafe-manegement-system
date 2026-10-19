<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\Process\Process;

class BackupDatabase extends Command
{
    protected $signature = 'cu:backup';

    protected $description = 'إنشاء نسخة احتياطية من قاعدة بيانات النظام';

    public function handle(): int
    {
        $connection = config('database.default');
        $db = config("database.connections.$connection");

        Storage::disk('local')->makeDirectory('backups');
        $path = storage_path('app/private/backups/cu-' . now()->format('Y-m-d_His') . '.sql');
        @mkdir(dirname($path), 0775, true);

        $mysqldump = $this->locateMysqldump();

        $command = [
            $mysqldump,
            '--user=' . $db['username'],
        ];
        if (! empty($db['password'])) {
            $command[] = '--password=' . $db['password'];
        }
        if (! empty($db['unix_socket'])) {
            $command[] = '--socket=' . $db['unix_socket'];
        } else {
            $command[] = '--host=' . $db['host'];
            $command[] = '--port=' . $db['port'];
        }
        $command[] = $db['database'];

        $process = new Process($command);
        $process->setTimeout(300);
        $process->run();

        if (! $process->isSuccessful()) {
            $this->error('فشل النسخ الاحتياطي: ' . $process->getErrorOutput());

            return self::FAILURE;
        }

        file_put_contents($path, $process->getOutput());
        $this->info('تم إنشاء النسخة الاحتياطية: ' . $path);

        return self::SUCCESS;
    }

    protected function locateMysqldump(): string
    {
        foreach (['/Applications/XAMPP/xamppfiles/bin/mysqldump', 'mysqldump'] as $candidate) {
            if ($candidate === 'mysqldump' || is_executable($candidate)) {
                return $candidate;
            }
        }

        return 'mysqldump';
    }
}
