<?php

namespace App\Http\Controllers\Api;

use App\Models\About;
use App\Models\Blog;
use App\Models\BlogCategory;
use App\Models\Campaign;
use App\Models\Category;
use App\Models\ContactPage;
use App\Models\Counter;
use App\Models\Currency;
use App\Models\Feature;
use App\Models\Generalsetting;
use App\Models\Page;
use App\Models\Preloaded;
use App\Models\Volunteer;
use Illuminate\Http\Request;

class FrontendController extends ApiController
{
    public function homeContent(Request $request)
    {
        $content = explode(',', $request->content);
        $content = array_filter($content);
        if (count($content) == 0) {
            $all = ['*'];
        } else {
            $all = $content;
        }

        if (in_array('about', $all) || in_array('*', $all)) {
            $about =  About::first();
            $about['photo'] = asset('assets/images/' . $about->photo);
            $data['about'] = $about;
        }

        if (in_array('latest_campaign', $all) || in_array('*', $all)) {
            $data['latest_campaign'] = Campaign::with('category')
                ->where('status', 1)
                ->orderBy('id', 'desc')
                ->limit(9)
                ->get()
                ->map(function ($campaign) {
                    $campaign->formatted_created_at = dateFormat($campaign->created_at->format('Y-m-d'));
                    return $campaign;
                });
        }

        if (in_array('latest_category', $all) || in_array('*', $all)) {
            $data['latest_category'] = Category::where('status', 1)
                ->orderBy('id', 'desc')
                ->limit(9)
                ->get();
        }


        if (in_array('newest_campaign', $all) || in_array('*', $all)) {
            $data['newest_campaign'] = Campaign::with('category')
                ->where('status', 1)
                ->latest()
                ->limit(9)
                ->get()
                ->map(function ($campaign) {
                    $campaign->photo = asset('assets/images/' . $campaign->photo);
                    $campaign->formatted_created_at = dateFormat($campaign->created_at->format('Y-m-d'));
                    return $campaign;
                });
        }

        if (in_array('volunteers', $all) || in_array('*', $all)) {
            $data['volunteers'] = Volunteer::orderBy('id', 'desc')->get()
                ->map(function ($volunteer) {
                    $volunteer->photo = asset('assets/images/' . $volunteer->photo);
                    return $volunteer;
                });
        }

        if (in_array('recent_blogs', $all) || in_array('*', $all)) {

            $data['recent_blogs'] = Blog::orderBy('id', 'desc')->limit(2)->get()
                ->map(function ($blog) {
                    $blog->formatted_created_at = dateFormat($blog->created_at->format('Y-m-d'));
                    $blog->photo = asset('assets/images/' . $blog->photo);
                    return $blog;
                });
        }




        return $this->sendResponse($data, 'Home Content');
    }

    public function setting()
    {
        $hero_section = Generalsetting::first();
        $hero_section['header_logo'] = getPhoto($hero_section->header_logo);
        $hero_section['footer_logo'] = getPhoto($hero_section->footer_logo);
        $hero_section['breadcumb'] = getPhoto($hero_section->breadcumb);
        $hero_section['maintenance_photo'] = getPhoto($hero_section->maintenance_photo);
        $hero_section['hero_photo'] = getPhoto($hero_section->hero_photo);
        $hero_section['cta_photo'] = getPhoto($hero_section->cta_photo);
        return $this->sendResponse($hero_section, 'Setting Data');
    }


    public function getCategory()
    {
        $categories = Category::where('status', 1)->get();

        return $this->sendResponse($categories, 'Category Data');
    }


    public function getCampaign(Request $request)
    {
        $campaigns = Campaign::with(['category', "galleries"])->paginate(2);
        return $this->sendResponse($campaigns, 'Campaign Data');
    }

    public function singleCampaign($slug)
    {
        $campaign = Campaign::with(['category', 'faqs', 'galleries'])->where('slug', $slug)->first();
        $data['campaign'] = $campaign;
        $data['preloaded'] = Preloaded::get();
        $data['related_campaigns'] = Campaign::with('category')->where('status', 1)->where('category_id', $campaign->category_id)->where('id', '!=', $campaign->id)->orderBy('id', 'desc')->limit(6)->get();
        return $this->sendResponse($data, 'Single Campaign');
    }


    public function getBlogs()
    {
        $data['categories'] = BlogCategory::get();
        $data['blogs'] = Blog::with('category')->orderBy('id', 'desc')->paginate(2);
        return $this->sendResponse($data, 'Blog Data');
    }

    public function singleBlog($slug)
    {
        $blog = Blog::with('category')->where('slug', $slug)->first();
        $blog->photo = asset('assets/images/' . $blog->photo);
        return $this->sendResponse($blog, 'Single Blog');
    }

    public function page($slug)
    {
        $page = Page::where('slug', $slug)->first();
        return $this->sendResponse($page, 'Single Blog');
    }

    public function contactPage()
    {
        $page = ContactPage::first();
        return $this->sendResponse($page, 'Contact Page');
    }

    public function aboutPage()
    {
        $about =  About::first();
        $about['photo'] = asset('assets/images/' . $about->photo);
        $data['about'] = $about;
        $data['features'] = Feature::orderby('id')->get();
        $data['counters'] = Counter::orderby('id')->get();
        return $this->sendResponse($data, 'Contact Page');
    }


    public function getCurrency()
    {
        $currency = Currency::whereStatus(1)->get();
        return $this->sendResponse($currency, 'Currency Data');
    }

    public function singleCurrency($currency_code)
    {
        $currency = Currency::whereStatus(1)->whereCode($currency_code)->first();
        return $this->sendResponse($currency, 'Single Currency Data');
    }
}
