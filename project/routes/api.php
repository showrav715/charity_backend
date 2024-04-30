<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CampaignController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\DonationController;
use App\Http\Controllers\Api\FrontendController;
use App\Http\Controllers\Api\PaymentGatewayController;
use App\Http\Controllers\Api\SupportTicketController;
use App\Http\Controllers\Api\WithdrawController;
use App\Http\Controllers\Gateway\Flutterwave;
use App\Http\Controllers\Gateway\Paypal;
use App\Http\Controllers\Gateway\Paystack;
use App\Http\Controllers\Gateway\SslCommerce;
use App\Http\Controllers\Gateway\Sslcommerz;
use App\Http\Controllers\Gateway\Stripe;
use Illuminate\Support\Facades\Route;

Route::prefix('user')->group(function () {

    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('forgot-password', [AuthController::class, 'forgotPasswordSubmit']);
    Route::post('reset-password', [AuthController::class, 'resetPasswordSubmit']);
    Route::post('verify-email', [AuthController::class, 'verifyEmailSubmit']);
    Route::post('resend/verify-email/code', [AuthController::class, 'verifyEmailResendCode']);

    Route::post('token', [AuthController::class, 'token']);

    Route::middleware(['auth:sanctum', "email_verify"])->group(function () {

        Route::get('dashboard', [DashboardController::class, 'dashboard']);
        // Profile Routes
        Route::get('get-details', [DashboardController::class, 'getDetails']);
        Route::post('profile-settings', [DashboardController::class, 'profileSubmit']);
        Route::post('change-password', [DashboardController::class, 'changePass']);
        Route::get('logout', [AuthController::class, 'logout'])->name('user.logout');

        // Campaign Routes
        Route::get('get/category', [DashboardController::class, 'getCategory']);
        Route::get('campaigns', [CampaignController::class, 'index']);
        Route::post('campaign/store', [CampaignController::class, 'store']);
        Route::post('campaign/update/{id}', [CampaignController::class, 'update']);
        Route::get('campaign/{id}', [CampaignController::class, 'edit']);
        Route::get('campaign/gallery/remove/{id}', [CampaignController::class, 'galleryRemove']);

        //support ticket
        Route::get('support/tickets', [SupportTicketController::class, 'index']);
        Route::get('support/ticket/messages/{ticket_num}', [SupportTicketController::class, 'messages']);
        Route::post('open/support/ticket', [SupportTicketController::class, 'openTicket']);
        Route::post('reply/ticket/{ticket_num}', [SupportTicketController::class, 'replyTicket']);
        Route::get('close/ticket/{ticket_num}', [SupportTicketController::class, 'closeTicket']);

        // Donation Routes
        Route::get('donations', [DonationController::class, 'donations']);
        Route::get('funds-raised', [DonationController::class, 'fundRised']);

        // withdraw
        Route::get('withdraws', [WithdrawController::class, 'getWithdraws']);
        Route::post('withdraw/request', [WithdrawController::class, 'withdrawStore']);

        // transaction
        Route::get('transactions', [DonationController::class, 'transactions']);
    });
});

// FRONTEND
Route::get('/language', [FrontendController::class, 'language']);
Route::get('home-content', [FrontendController::class, 'homeContent']);
Route::post('newsletter/submit', [FrontendController::class, 'newsletterSubmit']);
Route::post('contact/submit', [FrontendController::class, 'contactSubmit']);
Route::post('comment/submit', [FrontendController::class, 'blogCommentSubmit']);
Route::post('volunteer/submit', [FrontendController::class, 'volunteerSubmit']);
Route::get('events', [FrontendController::class, 'GetEvents']);
Route::get('event/{slug}', [FrontendController::class, 'singleEvent']);
Route::get('get/gallery', [FrontendController::class, 'getGallery']);
Route::get('testimonials', [FrontendController::class, 'getTestimonials']);
Route::get('get/donations', [FrontendController::class, 'donorList']);
Route::get('get/faqs', [FrontendController::class, 'getFaq']);
Route::get('get/volunteer', [FrontendController::class, 'volunteerList']);

// Campaign Routes
Route::get('get/category', [FrontendController::class, 'getCategory']);
Route::get('/campaigns', [FrontendController::class, 'getCampaign']);
Route::get('campaign/{slug}', [FrontendController::class, 'singleCampaign']);

// Blog Routes
Route::get('blogs', [FrontendController::class, 'getBlogs']);
Route::get('blog/{slug}', [FrontendController::class, 'singleBlog']);

// Page Routes
Route::get('/contact/page', [FrontendController::class, 'contactPage']);
Route::get('/about/page', [FrontendController::class, 'aboutPage']);
Route::get('/page/{slug}', [FrontendController::class, 'page']);

// Setting Routes
Route::get('setting', [FrontendController::class, 'setting']);
Route::get('get/currency', [FrontendController::class, 'getCurrency']);
Route::get('single/currency/{code}', [FrontendController::class, 'singleCurrency']);

// Gateway Routes
Route::get('get/gateways', [PaymentGatewayController::class, 'getGateways']);
Route::post('/campaign/submit', [PaymentGatewayController::class, 'campaignSubmit']);

// notify route
Route::get('stripe/notify', [Stripe::class, 'notify'])->name('stripe.notify');
Route::get('paypal/notify', [Paypal::class, 'notify'])->name('paypal.notify');
Route::post('flutterwave/notify', [Flutterwave::class, 'notify'])->name('flutterwave.notify');
Route::post('paystack/notify', [Paystack::class, 'notify'])->name('paystack.notify');
Route::post('sslcommerz/notify', [Sslcommerz::class, 'notify'])->name('sslcommerz.notify');
