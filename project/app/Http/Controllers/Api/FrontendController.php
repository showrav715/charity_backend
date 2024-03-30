<?php

namespace App\Http\Controllers\Api;

use App\Http\Helpers\MediaHelper;
use App\Models\About;
use App\Models\Blog;
use App\Models\BlogCategory;
use App\Models\Brand;
use App\Models\Campaign;
use App\Models\Category;
use App\Models\ContactMessage;
use App\Models\ContactPage;
use App\Models\Counter;
use App\Models\Currency;
use App\Models\Feature;
use App\Models\Generalsetting;
use App\Models\Page;
use App\Models\Preloaded;
use App\Models\Subscriber;
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

        if (in_array('feature_campaign', $all) || in_array('*', $all)) {
            $data['feature_campaign'] = Campaign::with('category')
                ->where('status', 1)
                ->where('is_feature', 1)
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
        $category = $request->category ? Category::where('slug', $request->category)->first()->id : null;
        $sortby = $request->sortby;
        $condition = $request->has('condition') ? $request->condition : null;
        $campaigns = Campaign::with(['category', "galleries"])
            ->where('status', 1)
            ->when($category, function ($query, $category) {
                return $query->where('category_id', $category);
            })
            ->when($sortby, function ($query, $sortby) {
                if ($sortby == 'newest') {
                    return $query->orderBy('id', 'desc');
                } elseif ($sortby == 'oldest') {
                    return $query->orderBy('id', 'asc');
                }
            })
            ->when($condition, function ($query) {
                return $query->where('is_feature', 1);
            })

            ->orderBy('id', 'desc')
            ->paginate(12);
        return $this->sendResponse($campaigns, 'Campaign Data');
    }

    public function singleCampaign($slug)
    {
        $campaign = Campaign::with(['category', 'faqs', 'galleries'])->where('slug', $slug)->first();


        if ($campaign) {
            foreach ($campaign->galleries as $gallery) {
                $gallery['original'] = $gallery->photo;
                $gallery['thumbnail'] = $gallery->photo;
                unset($gallery->photo);
                unset($gallery->id);
                unset($gallery->campaign_id);
            }
        }

        $campaign['founded'] = dateFormat($campaign->founded);
        $data['campaign'] = $campaign;
        $data['preloaded'] = Preloaded::get();
        $data['related_campaigns'] = Campaign::with('category')->where('status', 1)->where('category_id', $campaign->category_id)->where('id', '!=', $campaign->id)->orderBy('id', 'desc')->limit(6)->get();
        return $this->sendResponse($data, 'Single Campaign');
    }


    public function getBlogs(Request $request)
    {

        $search = $request->search;
        $category = $request->category ? Category::where('slug', $request->category)->first()->id : null;
        $tag = $request->tag;

        $data['categories'] = BlogCategory::get();
        $data['blogs'] = Blog::with('category')->orderBy('id', 'desc')
            ->when($search, function ($query, $search) {
                return $query->where('title', 'like', '%' . $search . '%')->orWhere('sort_text', 'like', '%' . $search . '%');
            })
            ->when($category, function ($query, $category) {
                return $query->where('category_id', $category);
            })
            ->when($tag, function ($query, $tag) {
                return $query->where('tags', 'like', '%' . $tag . '%');
            })
            ->paginate(12);


        $data['recent_blogs'] = Blog::orderBy('id', 'desc')->limit(4)->get();
        return $this->sendResponse($data, 'Blog Data');
    }

    public function singleBlog($slug)
    {
        $blog = Blog::with('category')->where('slug', $slug)->first();
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
        $about['photo'] = getPhoto($about->photo);
        $about['backgroud_photo'] = getPhoto($about->backgroud_photo);
        $data['about'] = $about;
        $data['features'] = Feature::orderby('id')->get();
        $data['counters'] = Counter::orderby('id')->get();
        $data['brands'] = Brand::orderby('id')->get();
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


    function newsletterSubmit(Request $request)
    {
        $request->validate([
            'email' => 'required|email|unique:subscribers,email'
        ]);

        $newsletter = new Subscriber();
        $newsletter->email = $request->email;
        $newsletter->save();
        return $this->sendResponse($newsletter, 'Newsletter Subscribed');
    }


    public function contactSubmit(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'subject' => 'required',
            'message' => 'required'
        ]);

        $contact = new ContactMessage();
        $contact->name = $request->name;
        $contact->email = $request->email;
        $contact->subject = $request->subject;
        $contact->message = $request->message;
        $contact->save();
        return $this->sendResponse($contact, 'Message Sent');
    }


    public function volunteerSubmit(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'designation' => 'required|string|max:255',
            'photo' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            "cv" => "required|mimes:pdf|max:5048",
        ]);

        $data = new Volunteer();
        $data->name = $request->name;
        $data->designation = $request->designation;
        $data->facebook = $request->facebook;
        $data->twitter = $request->twitter;
        $data->linkedin = $request->linkedin;
        $data->instagram = $request->instagram;
        if (isset($request['photo'])) {
            $status = MediaHelper::ExtensionValidation($request['photo']);
            if (!$status) {
                return $this->sendError('file format not supported');
            }
            $data->photo = MediaHelper::handleMakeImage($request['photo']);
        }
        if (isset($request['cv'])) {
            $status = MediaHelper::ExtensionValidation($request['cv']);
            if (!$status) {
                return $this->sendError('file format not supported');
            }
            $data->cv = MediaHelper::handleMakeFile($request['cv']);
        }
        $data->save();

        return $this->sendResponse($data, 'Volunteer Request Submitted Successfully ');
    }
}
