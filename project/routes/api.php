<?php

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CampaignController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\FrontendController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('user')->group(function () {

    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('token', [AuthController::class, 'token']);
    Route::post('/otp', [DashboardController::class, 'otp'])->name('user.otp.submit')->middleware('auth:api');


    Route::middleware(['auth:sanctum',"email_verify"])->group(function () {

        Route::get('dashboard', [DashboardController::class, 'dashboard']);
        // Profile Routes
        Route::get('get-details',  [DashboardController::class, 'getDetails']);
        Route::post('profile-settings',  [DashboardController::class, 'profileSubmit']);
        Route::post('change-password',  [DashboardController::class, 'changePass'])->name('change.pass');

        // Twofactor Routes
        Route::get('/twoFactor', [DashboardController::class, 'twoFactor'])->name('user.twoFactor');
        Route::post('/createTwoFactor', [DashboardController::class, 'createTwoFactor'])->name('user.createTwoFactor');
        Route::post('/disableTwoFactor', [DashboardController::class, 'disableTwoFactor']);

        // Kyc Routes
        Route::get('/kyc-form-data',               [DashboardController::class, 'kycForm']);
        Route::post('/kyc-form',                   [DashboardController::class, 'kycFormSubmit']);
        Route::get('/user-kyc',                   [DashboardController::class, 'kycShow']);

        Route::get('logout',   [AuthController::class, 'logout'])->name('user.logout');


        // Campaign Routes
        Route::get('get/category', [DashboardController::class, 'getCategory']);
        Route::get('campaigns', [CampaignController::class, 'index']);
        Route::post('campaign/store', [CampaignController::class, 'store']);
        Route::get('campaign/{id}', [CampaignController::class, 'edit']);
    });
});


// FRONTEND
Route::get('home-content', [FrontendController::class, 'homeContent']);
Route::post('newsletter/submit', [FrontendController::class, 'newsletterSubmit']);
Route::post('contact/submit', [FrontendController::class, 'contactSubmit']);
Route::get('setting', [FrontendController::class, 'setting']);
Route::get('get/currency', [FrontendController::class, 'getCurrency']);
Route::get('single/currency/{code}', [FrontendController::class, 'singleCurrency']);

// Campaign Routes
Route::get('get/category', [FrontendController::class, 'getCategory']);
Route::get('campaigns', [FrontendController::class, 'getCampaign']);
Route::get('campaign/{slug}', [FrontendController::class, 'singleCampaign']);

// Blog Routes
Route::get('blogs', [FrontendController::class, 'getBlogs']);
Route::get('blog/{slug}', [FrontendController::class, 'singleBlog']);

Route::get('/contact/page', [FrontendController::class, 'contactPage']);
Route::get('/about/page', [FrontendController::class, 'aboutPage']);
Route::get('/page/{slug}', [FrontendController::class, 'page']);
