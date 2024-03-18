<?php

use App\Http\Controllers\Admin\AboutController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\BlogCategoryController;
use App\Http\Controllers\Admin\BlogController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CampaignController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\CounterController;
use App\Http\Controllers\Admin\EmailController;
use App\Http\Controllers\Admin\FeatureController;
use App\Http\Controllers\Admin\GeneralSettingController;
use App\Http\Controllers\Admin\LoginController;
use App\Http\Controllers\Admin\ManageCurrencyController;
use App\Http\Controllers\Admin\ManageRoleController;
use App\Http\Controllers\Admin\ManageStaffController;
use App\Http\Controllers\Admin\ManageTestimonialController;
use App\Http\Controllers\Admin\PageController;
use App\Http\Controllers\Admin\PaymentGatewayController;
use App\Http\Controllers\Admin\PreloadedController;
use App\Http\Controllers\Admin\SocialController;
use App\Http\Controllers\Admin\VolunteerController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\ManageTicketController;



Route::prefix('admin')->name('admin.')->group(function () {

    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'login']);

    Route::get('/forgot-password', [LoginController::class, 'forgotPasswordForm'])->name('forgot.password');
    Route::post('/forgot-password', [LoginController::class, 'forgotPasswordSubmit']);
    Route::get('forgot-password/verify-code', [LoginController::class, 'verifyCode'])->name('verify.code');
    Route::post('forgot-password/verify-code', [LoginController::class, 'verifyCodeSubmit']);
    Route::get('reset-password', [LoginController::class, 'resetPassword'])->name('reset.password');
    Route::post('reset-password', [LoginController::class, 'resetPasswordSubmit']);

    Route::middleware('auth:admin')->group(function () {
        Route::get('/logout', [LoginController::class, 'logout'])->name('logout');
        Route::get('/', [AdminController::class, 'index'])->name('dashboard');
        Route::get('/profile', [AdminController::class, 'profile'])->name('profile');
        Route::post('/profile/update', [AdminController::class, 'profileupdate'])->name('profile.update');
        Route::get('/password', [AdminController::class, 'passwordreset'])->name('password');
        Route::post('/password/update', [AdminController::class, 'changepass'])->name('password.update');


        Route::group(['middleware' => 'permission:Manage Campaigns'], function () {
            // category
            Route::get('category', [CategoryController::class, 'index'])->name('category.index');
            Route::post('category/store', [CategoryController::class, 'store'])->name('category.store');
            Route::put('category/update/{id}', [CategoryController::class, 'update'])->name('category.update');
            Route::delete('category/destroy', [CategoryController::class, 'destroy'])->name('category.destroy');


            // Preloaded 
            Route::get('preloaded', [PreloadedController::class, 'index'])->name('preloaded.index');
            Route::post('preloaded/store', [PreloadedController::class, 'store'])->name('preloaded.store');
            Route::put('preloaded/update/{id}', [PreloadedController::class, 'update'])->name('preloaded.update');
            Route::delete('preloaded/destroy', [PreloadedController::class, 'destroy'])->name('preloaded.destroy');


            // campaign
            Route::get('campaign', [CampaignController::class, 'index'])->name('campaign.index');
            Route::get('campaign/create', [CampaignController::class, 'create'])->name('campaign.create');
            Route::post('campaign/store', [CampaignController::class, 'store'])->name('campaign.store');
            Route::get('campaign/edit/{campaign}', [CampaignController::class, 'edit'])->name('campaign.edit');
            Route::put('campaign/update/{campaign}', [CampaignController::class, 'update'])->name('campaign.update');
            Route::get('campaign/status/{id}/{status}', [CampaignController::class, 'status'])->name('campaign.status');
            Route::delete('campaign-delete', [CampaignController::class, 'destroy'])->name('campaign.destroy');
            Route::get('campaign/gallery/remove/{id}', [CampaignController::class, 'galleryRemove'])->name('campaign.gallery.remove');
        });


        // Currency
        Route::get('/manage-currency', [ManageCurrencyController::class, 'index'])->name('currency.index');
        Route::get('/add-currency', [ManageCurrencyController::class, 'addCurrency'])->name('currency.add');
        Route::post('/add/currency/store', [ManageCurrencyController::class, 'store'])->name('currency.store');
        Route::get('/edit-currency/{id}', [ManageCurrencyController::class, 'editCurrency'])->name('currency.edit');
        Route::put('/update-currency/{id}', [ManageCurrencyController::class, 'updateCurrency'])->name('currency.update');
        Route::get('/currency/set-default/{id}', [ManageCurrencyController::class, 'setDefault'])->name('currency.default');
        Route::delete('/delete-currency', [ManageCurrencyController::class, 'deleteCurrency'])->name('currency.delete');


        Route::get('/payment-gateways', [PaymentGatewayController::class, 'index'])->name('gateway');
        Route::get('add/payment-gateway', [PaymentGatewayController::class, 'create'])->name('gateway.create');
        Route::post('/store/payment-gateway', [PaymentGatewayController::class, 'store'])->name('gateway.store');
        Route::get('/payment-gateway/edit/{paymentgateway}', [PaymentGatewayController::class, 'edit'])->name('gateway.edit');
        Route::post('/payment-gateway/update/{gateway}', [PaymentGatewayController::class, 'update'])->name('gateway.update');



        //support ticket
        Route::get('manage/tickets', [ManageTicketController::class, 'index'])->name('ticket.manage')->middleware('permission:manage ticket');
        Route::post('reply/ticket/{ticket_num}',   [ManageTicketController::class, 'replyTicket'])->name('ticket.reply')->middleware('permission:manage ticket')->middleware('permission:reply ticket');



    //==================================== EMAIL SETTING SECTION ==============================================//

        Route::get('/email-templates',      [EmailController::class,'index'])->name('mail.index');
        Route::get('/email-templates/{id}', [EmailController::class,'edit'])->name('mail.edit');
        Route::post('/email-templates/{id}',[EmailController::class,'update'])->name('mail.update');
        Route::get('/email-config',         [EmailController::class,'config'])->name('mail.config');
        Route::get('/group-email',           [EmailController::class,'groupEmail'])->name('mail.group.show');
        Route::post('/groupemailpost',      [EmailController::class,'groupemailpost'])->name('group.submit');

    //==================================== EMAIL SETTING SECTION END ==============================================//






        Route::group(['middleware' => 'permission:Manage Pages'], function () {
            //pages
            Route::get('page', [PageController::class, 'index'])->name('page.index');
            Route::get('page/create', [PageController::class, 'create'])->name('page.create');
            Route::post('page/store', [PageController::class, 'store'])->name('page.store');
            Route::get('page/edit/{page}', [PageController::class, 'edit'])->name('page.edit');
            Route::put('page/update/{page}', [PageController::class, 'update'])->name('page.update');
            Route::post('page/remove', [PageController::class, 'destroy'])->name('page.remove');
        });

        Route::group(['middleware' => 'permission:Manage Project'], function () {
            //manage blogs
            Route::get('blog-category', [BlogCategoryController::class, 'index'])->name('bcategory.index');
            Route::post('blog-category/store', [BlogCategoryController::class, 'store'])->name('bcategory.store');
            Route::put('blog-category/update/{id}', [BlogCategoryController::class, 'update'])->name('bcategory.update');
            Route::delete('blog-category/destroy', [BlogCategoryController::class, 'destroy'])->name('bcategory.destroy');

            Route::get('blog', [BlogController::class, 'index'])->name('blog.index');
            Route::get('blog/create', [BlogController::class, 'create'])->name('blog.create');
            Route::post('blog/store', [BlogController::class, 'store'])->name('blog.store');
            Route::get('blog/edit/{blog}', [BlogController::class, 'edit'])->name('blog.edit');
            Route::put('blog/update/{blog}', [BlogController::class, 'update'])->name('blog.update');
            Route::delete('blog-delete/{blog}', [BlogController::class, 'destroy'])->name('blog.destroy');

            // Comment
            Route::get('blog/comment', [BlogController::class, 'comment'])->name('blog.comment');
            Route::delete('blog/comment/delete/{comment}', [BlogController::class, 'commentDelete'])->name('blog.comment.delete');
        });

        // counter section
        Route::get('counter', [CounterController::class, 'index'])->name('counter.index');
        Route::post('counter/store', [CounterController::class, 'store'])->name('counter.store');
        Route::put('counter/update/{counter}', [CounterController::class, 'update'])->name('counter.update');
        Route::delete('counter-delete', [CounterController::class, 'destroy'])->name('counter.destroy');


        Route::group(['middleware' => 'permission:Manage Volunteer'], function () {
            // manage team
            Route::get('/volunteer', [VolunteerController::class, 'index'])->name('volunteer.index');
            Route::get('/create-volunteer', [VolunteerController::class, 'create'])->name('volunteer.create');
            Route::post('/store-volunteer', [VolunteerController::class, 'store'])->name('volunteer.store');
            Route::get('/edit-volunteer/{id}', [VolunteerController::class, 'edit'])->name('volunteer.edit');
            Route::put('/update-volunteer/{id}', [VolunteerController::class, 'update'])->name('volunteer.update');
            Route::delete('/delete-volunteer', [VolunteerController::class, 'destroy'])->name('volunteer.destroy');
        });

        Route::group(['middleware' => 'permission:Frontend Settings'], function () {
            // HERO SECTION

            Route::get('/hero', [GeneralSettingController::class, 'hero'])->name('hero.index');
            Route::post('/hero/store', [GeneralSettingController::class, 'heroStore'])->name('hero.store');
            Route::get('/cta/section', [GeneralSettingController::class, 'ctaSection'])->name('cta.index');
            Route::post('/cta/section/update', [GeneralSettingController::class, 'ctaSectionUpdate'])->name('cta.section.update');

            Route::get('home/page/sections', [GeneralSettingController::class, 'homeSections'])->name('home.sections');
            Route::post('home/page/sections/update', [GeneralSettingController::class, 'homeSectionUpdate'])->name('home.sections.update');


            // About section
            Route::get('about', [AboutController::class, 'index'])->name('about.index');
            Route::put('about/update', [AboutController::class, 'update'])->name('about.update');
            // About Section feature
            Route::post('/feature/store', [FeatureController::class, 'store'])->name('feature.store');
            Route::put('/feature/update/{id}', [FeatureController::class, 'update'])->name('feature.update');
            Route::delete('/feature/delete', [FeatureController::class, 'destroy'])->name('feature.destroy');


            // brand section 
            Route::get('/brands', [BrandController::class, 'index'])->name('brand.index');
            Route::post('/brand/store', [BrandController::class, 'store'])->name('brand.store');
            Route::put('/brand/update/{id}', [BrandController::class, 'update'])->name('brand.update');
            Route::delete('/brand/delete', [BrandController::class, 'destroy'])->name('brand.destroy');



            // Contact section
            Route::get('contact/section', [GeneralSettingController::class, 'contact_section'])->name('contact.section');
            // manage testimonail
            Route::get('/manage-testimonial', [ManageTestimonialController::class, 'index'])->name('testimonial.index');
            Route::post('/add-testimonial', [ManageTestimonialController::class, 'store'])->name('testimonial.store');
            Route::put('/update-testimonial/{id}', [ManageTestimonialController::class, 'update'])->name('testimonial.update');
            Route::delete('/delete-testimonial', [ManageTestimonialController::class, 'destroy'])->name('testimonial.destroy');
        });

        Route::group(['middleware' => 'permission:General Settings'], function () {
            //==================================== GENERAL SETTING SECTION ==============================================//

            Route::get('/general-settings', [GeneralSettingController::class, 'siteSettings'])->name('gs.site.settings');
            Route::get('/plugin-settings', [GeneralSettingController::class, 'pluginSettings'])->name('gs.plugin.settings');
            Route::get('/maintainance-settings', [GeneralSettingController::class, 'maintainance'])->name('gs.maintainance.settings');
            Route::post('/general-settings/update', [GeneralSettingController::class, 'update'])->name('gs.update');
            Route::get('/general-settings/logo-favicon', [GeneralSettingController::class, 'logo'])->name('gs.logo');
            Route::get('/general-settings/breadcumb', [GeneralSettingController::class, 'breadcumb'])->name('gs.breadcumb');
            Route::get('/general-settings/maintenance', [GeneralSettingController::class, 'maintenance'])->name('gs.maintenance');
            Route::get('/general-settings/status/update/{value}', [GeneralSettingController::class, 'StatusUpdate'])->name('gs.status');
            //cookie
            Route::get('/manage-cookie', [AdminController::class, 'cookie'])->name('cookie');
            Route::post('/manage-cookie', [AdminController::class, 'updateCookie'])->name('update.cookie');
            Route::get('/manage-language', [AdminController::class, 'language'])->name('language');
            Route::post('/language/update', [AdminController::class, 'languageUpdate'])->name('language.update');
            Route::get('social/link', [SocialController::class, 'index'])->name('social.manage');
            Route::post('add/social/link', [SocialController::class, 'store'])->name('social.store');
            Route::put('update/social/link/{id}', [SocialController::class, 'update'])->name('social.update');
            Route::delete('destroy/social/link', [SocialController::class, 'destroy'])->name('social.destroy');
            // theme
            Route::get('/theme-settings', [GeneralSettingController::class, 'themeSettings'])->name('gs.theme.settings');
            //==================================== GENERAL SETTING SECTION ==============================================//

        });

        Route::group(['middleware' => 'permission:Manage Contact'], function () {
            // ==================================== ADMIN CONTACT SECTION ====================================//
            Route::get('/contact/page/setting', [ContactController::class, 'index'])->name('contact.setting.index');
            Route::put('/contact/page/setting/update', [ContactController::class, 'update'])->name('contact.setting.update');
            Route::get('/contact/message', [ContactController::class, 'contactMessage'])->name('contact.message');
            Route::get('/getintouch/message', [ContactController::class, 'getintouch'])->name('contact.getintouch.message');
            Route::delete('/contact/message/delete', [ContactController::class, 'contactMessageDelete'])->name('contact.message.delete');
        });

        Route::group(['middleware' => 'permission:Manage Role'], function () {
            //role manage
            Route::get('/role', [ManageRoleController::class, 'index'])->name('role.index');
            Route::get('/role/create', [ManageRoleController::class, 'create'])->name('role.create');
            Route::post('/role/store', [ManageRoleController::class, 'store'])->name('role.store');
            Route::get('/role/edit/{id}', [ManageRoleController::class, 'edit'])->name('role.edit');
            Route::put('/role/update/{id}', [ManageRoleController::class, 'update'])->name('role.update');
            Route::delete('/role/delete', [ManageRoleController::class, 'destroy'])->name('role.destroy');
        });

        Route::group(['middleware' => 'permission:Manage Staff'], function () {
            //manage staff
            Route::get('manage/staff', [ManageStaffController::class, 'index'])->name('staff.manage');
            Route::post('add/staff', [ManageStaffController::class, 'addStaff'])->name('staff.add');
            Route::post('update/staff/{id}', [ManageStaffController::class, 'updateStaff'])->name('staff.update');
            Route::delete('destroy/staff', [ManageStaffController::class, 'destroy'])->name('staff.destroy');
        });

        Route::get('/clear-cache', function () {
            Artisan::call('optimize:clear');
            return back()->with('success', 'Cache cleared successfully');
        })->name('clear.cache');
    });
});
