<?php

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\FrontendController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('user')->group(function () {
Route::post('login',                           [AuthController::class, 'login']);
Route::post('register',                        [AuthController::class, 'register']);
Route::post('forgot-password',                 [AuthController::class, 'forgotPasswordSubmit']);
Route::post('forgot-password/verify-code',     [AuthController::class, 'verifyCodeSubmit']);
Route::post('reset-password',                  [AuthController::class, 'resetPasswordSubmit']);

Route::post('verify-email',                    [AuthController::class, 'verifyEmailSubmit'])->middleware('auth:sanctum');

Route::get('resend/verify-email/code',         [AuthController::class, 'verifyEmailResendCode'])->name('verify.email.resend')->middleware('auth:sanctum');

Route::post('two-step/verification',           [AuthController::class, 'twoStepVerify'])->middleware('auth:sanctum');
Route::post('send/two-step/verify-code/',      [AuthController::class, 'twoStepsendCode'])->middleware('auth:sanctum');
Route::post('/two-step/code/verify',            [AuthController::class, 'twoStepCodeVerify'])->middleware('auth:sanctum');
Route::get('resend/two-step/verify-code',      [AuthController::class, 'twoStepResendCode'])->middleware('auth:sanctum');


Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user-info',[AuthController::class, 'userInfo']);
    // REFRESH TOKEN
    Route::get('/refresh-token', [AuthController::class, 'refreshToken']);
    // LOGOUT
    Route::post('/logout', [AuthController::class, 'logout']);
});


});



// FRONTEND
Route::get('home-content',[FrontendController::class, 'homeContent']);
Route::get('setting',[FrontendController::class, 'setting']);