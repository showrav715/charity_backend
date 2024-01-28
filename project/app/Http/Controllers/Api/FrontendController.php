<?php

namespace App\Http\Controllers\Api;

use App\Models\About;
use App\Models\Blog;
use App\Models\Campaign;
use App\Models\Category;
use App\Models\Generalsetting;
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
            $data['about'] =  About::first();
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
                ->get()
                ->map(function ($category) {
                    $category->photo = asset('assets/images/' . $category->photo);
                    return $category;
                });
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

            $data['volunteers'] = Volunteer::orderBy('id', 'desc')->get();
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
        return $this->sendResponse($hero_section, 'Setting Data');
    }
}
