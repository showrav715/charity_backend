<?php

namespace App\Providers;

use App\Models\Generalsetting;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        // if (!file_exists('project/storage/installed') && !request()->is('install') && !request()->is('install/*')) {
        //     header("Location: install/");
        //     exit;
        // }
        view()->composer('*', function ($settings) {
            $settings->with('gs', Generalsetting::first());
        });
        
      

    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrap();
    }
}
