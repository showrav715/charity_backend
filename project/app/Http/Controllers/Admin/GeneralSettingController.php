<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Helpers\MediaHelper;
use App\Models\Generalsetting;
use App\Models\HomePageSection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class GeneralSettingController extends Controller
{

    public function update(Request $request)
    {

        $gs = Generalsetting::first();
        if ($request->basic) {
            $request->validate([
                'title' => 'required',
                'phone' => 'required',
                'email' => 'required',
                'address' => 'required',
                'frontend_url' => 'required',
                'footer_text' => 'required',
                'copyright_text' => 'required',
            ]);

            $gs->title = $request->title;
            $gs->phone = $request->phone;
            $gs->email = $request->email;
            $gs->address = $request->address;
            $gs->header_text = $request->header_text;
            $gs->frontend_url = $request->frontend_url;
            $gs->footer_text = $request->footer_text;
            $gs->copyright_text = $request->copyright_text;
        }

        if ($request->type == 'cta') {
            $gs->cta_title = $request->cta_title;
            $gs->cta_btn_text = $request->cta_btn_text;
            $gs->cta_btn_url = $request->cta_btn_url;
        }

        if ($request->check_smtp) {
            $request->validate([
                'smtp_host' => 'required',
                'smtp_port' => 'required',
                'smtp_user' => 'required',
                'smtp_pass' => 'required',
                'from_email' => 'required',
                'from_name' => 'required',
            ]);
            $gs->smtp_host = $request->smtp_host;
            $gs->smtp_port = $request->smtp_port;
            $gs->smtp_user = $request->smtp_user;
            $gs->smtp_pass = $request->smtp_pass;
            $gs->from_email = $request->from_email;
            $gs->from_name = $request->from_name;
            $gs->mail_type = $request->mail_type;
            $gs->mail_encryption = $request->mail_encryption;
        }
        if ($request->type == 'cta') {
            $gs->cta_title = $request->cta_title;
            $gs->cta_btn_text = $request->cta_btn_text;
            $gs->cta_btn_url = $request->cta_btn_url;
        }

        if ($request->hero) {
            $gs->hero_subtitle = $request->hero_subtitle;
            $gs->hero_title = $request->hero_title;
            $gs->hero_video_link = $request->hero_video_link;
        }

        if ($request->maintenance) {
            $gs->is_maintenance = $request->is_maintenance;
            $gs->maintenance = $request->maintenance_message;
        }

        $images = ['header_logo', 'footer_logo', 'maintenance_photo', 'contact_section_photo', 'breadcumb', 'hero_photo', 'cta_photo'];
        foreach ($images as $image) {
            if (isset($request[$image])) {
                $gs[$image] = MediaHelper::handleUpdateImage($request[$image], $gs[$image]);
                $gs->update();
                
                $array_forapi = ['header_logo', 'footer_logo', 'breadcumb'];
                // dd(in_array($image, $array_forapi));
                if (in_array($image, $array_forapi)) {
                    //$this->callApi($image, $request[$image]->getClientOriginalExtension());


                    $gs = Generalsetting::first();
                    // call a api to update the logo in the frontend
                    $url = 'http://localhost:3000/api/upload';
                    $data = [
                        'url' => getPhoto($gs[$image]),
                        'filename' => $image.".png",
                    ];
                    $res = Http::get($url, $data);
                }
            }
        }

        return redirect()->back()->with('success', 'Data updated successfully');
    }

    function logo() {
        return view('admin.generalsetting.logo');
    }

  

    public function breadcumb()
    {
        return view('admin.generalsetting.breadcumb');
    }

    public function contact_section()
    {
        return view('admin.generalsetting.contact_section');
    }

    public function hero()
    {
        return view('admin.generalsetting.hero_section');
    }

    public function ctaSection()
    {
        return view('admin.generalsetting.cta_section');
    }

    public function siteSettings()
    {
        return view('admin.generalsetting.settings');
    }

    public function banner_section()
    {
        return view('admin.generalsetting.banner_section');
    }

    public function homeSections()
    {
        $data = HomePageSection::first();
        return view('admin.generalsetting.home_sections', compact('data'));
    }

    public function homeSectionUpdate(Request $request)
    {

        $data = HomePageSection::first();
        $data->service_title = $request->service_title;
        $data->service_text = $request->service_text;
        $data->choose_title = $request->choose_title;
        $data->choose_text = $request->choose_text;
        $data->team_title = $request->team_title;
        $data->team_text = $request->team_text;
        $data->testimonial_title = $request->testimonial_title;
        $data->testimonial_text = $request->testimonial_text;
        $data->blog_title = $request->blog_title;
        $data->blog_text = $request->blog_text;
        $data->update();
        return redirect()->back()->with('success', 'Data updated successfully');
    }

    public function maintainance()
    {
        return view('admin.generalsetting.maintainance');
    }
}
