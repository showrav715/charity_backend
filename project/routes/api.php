<?php

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\FrontendController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('user')->group(function () {

    Route::post('register', [AuthController::class,'register']);
    Route::post('login', [AuthController::class,'login']);
    Route::post('token', [AuthController::class,'token']);
    Route::post('/otp', [DashboardController::class,'otp'])->name('user.otp.submit')->middleware('auth:api');


    Route::middleware(['auth:sanctum'])->group(function () {

        Route::get('dashboard',[DashboardController::class,'dashboard']);

        // Profile Routes
        Route::get('get-details',  [DashboardController::class,'getDetails']);
        Route::post('profile-settings',  [DashboardController::class,'profileSubmit']);
        Route::post('change-password',  [DashboardController::class,'changePass'])->name('change.pass');

         // Twofactor Routes
         Route::get('/twoFactor', [DashboardController::class,'twoFactor'])->name('user.twoFactor');
         Route::post('/createTwoFactor', [DashboardController::class,'createTwoFactor'])->name('user.createTwoFactor');
         Route::post('/disableTwoFactor', [DashboardController::class,'disableTwoFactor']);

          // Kyc Routes
        Route::get('/kyc-form-data',               [DashboardController::class, 'kycForm']);
        Route::post('/kyc-form',                   [DashboardController::class, 'kycFormSubmit']);
        Route::get('/user-kyc',                   [DashboardController::class, 'kycShow']);

        // Support Ticket 
        Route::get('logout',   [AuthController::class,'logout'])->name('user.logout');




    });
});



// FRONTEND
Route::get('home-content',[FrontendController::class, 'homeContent']);
Route::get('setting',[FrontendController::class, 'setting']);