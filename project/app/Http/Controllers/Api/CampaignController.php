<?php

namespace App\Http\Controllers\Api;

use App\Http\Helpers\MediaHelper;
use App\Models\Campaign;
use App\Models\CampaignGallery;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CampaignController extends ApiController
{


    public function index(Request $request)
    {
        $campaigns = [];
        switch ($request->type) {
           
            case 'cancel':
                $campaigns = Campaign::with(['user', 'category'])->where('user_id', auth()->id())->whereStatus(2)->latest()->paginate(12);
                break;
            case 'complete':
                $campaigns = Campaign::with(['user', 'category'])->where('user_id', auth()->id())->whereStatus(1)->latest()->paginate(12);
                break;
            case 'pending':
                $campaigns = Campaign::with(['user', 'category'])->where('user_id', auth()->id())->whereStatus(0)->latest()->paginate(12);
                break;

            default:
                $campaigns = Campaign::with(['user', 'category'])->where('user_id', auth()->id())->latest()->paginate(12);
                break;
        }


        return response()->json(['status' => true, 'data' => $campaigns, 'message' => 'Campaigns fetched successfully']);
    }


    public function store(Request $request)
    {
        //return response()->json(gettype($request->gallery));

        $request->validate([
            'title' => 'required|unique:campaigns,title',
            "location" => "required",
            "benefits" => "required|numeric",
            'description' => 'required',
            "end_date" => "required",
            'category_id' => 'required',
            'photo' => 'required|mimes:jpeg,jpg,png',
            'goal' => 'required',
        ]);

        $campaign = new Campaign();
        $campaign->user_id = auth()->id();
        $campaign->title = $request->title;
        $campaign->location = $request->location;
        $campaign->benefits = $request->benefits;
        $campaign->end_date = Carbon::parse(now())->format('Y-m-d');
        $campaign->video_link = $request->video_link;
        $campaign->slug = Str::slug($request->title);
        $campaign->description = $request->description;
        $campaign->category_id = $request->category_id;
        $campaign->goal = $request->goal;
        $campaign->photo = MediaHelper::handleMakeImage($request->photo);
        $campaign->is_faq = $request->is_faq == 'on' ? 1 : 0;
        $campaign->is_preloaded = $request->is_preloaded == 'on' ? 1 : 0;
        $campaign->status = $request->status == 1 ? 1 : 0;
        $campaign->save();

        if ($request->is_faq == 'on') {
            if ($request->faq_title && $request->faq_content)
                foreach ($request->faq_title as $key => $question) {
                    $campaign->faqs()->create([
                        'title' => $question ? $question : null,
                        'content' => $request->faq_content[$key] ? $request->faq_content[$key] : null,
                    ]);
                }


            if ($request->gallery) {
                foreach ($request->gallery as $key => $gallery) {
                    $photo = MediaHelper::handleMakeImage($gallery);
                    $campaign->galleries()->create([
                        'photo' => $photo ? $photo : null,
                    ]);
                }
            }
        }
        return response()->json(['status' => true, 'data' => [], 'message' => 'Campaign created successfully']);
    }


    public function edit($id)
    {
        $data = Campaign::with(['galleries', 'faqs'])->findOrFail($id);
        return $this->sendResponse($data, 'Single Campaign');
    }


    public function update(Request $request, $id)
    {

        $request->validate([
            'title' => 'required|unique:campaigns,title,' . $id,
            'description' => 'required',
            'category_id' => 'required',
            'photo' => 'mimes:jpeg,jpg,png',
            'goal' => 'required',
        ]);

        $campaign = Campaign::findOrFail($id);
        $campaign->title = $request->title;
        $campaign->slug = Str::slug($request->title);
        $campaign->description = $request->description;
        $campaign->category_id = $request->category_id;
        $campaign->goal = $request->goal;
        if ($request->photo) {
            $campaign->photo =  MediaHelper::handleUpdateImage($request->photo, $campaign->photo);
        }

        $campaign->is_faq = $request->is_faq == 'on' ? 1 : 0;
        $campaign->is_preloaded = $request->is_preloaded == 'on' ? 1 : 0;
        $campaign->status = $request->status == 1 ? 1 : 0;
        $campaign->update();

        $new_faq_title = explode(',', $request->faq_title);
        $new_faq_content = explode(',', $request->faq_content);


        if ($request->faq_title && $request->faq_content) {
            $campaign->faqs()->delete();
            foreach ($new_faq_title as $key => $question) {
                $campaign->faqs()->create([
                    'title' => $question ? $question : null,
                    'content' => $new_faq_content[$key] ? $new_faq_content[$key] : null,
                ]);
            }
            $campaign->is_faq = $request->is_faq == 1;
        } else {
            $campaign->is_faq = $request->is_faq == 0;
            $campaign->faqs()->delete();
        }
        $campaign->update();



        if ($request->gallery) {
            foreach ($request->gallery as $key => $gallery) {
                $photo = MediaHelper::handleMakeImage($gallery);
                $campaign->galleries()->create([
                    'photo' => $photo ? $photo : null,
                ]);
            }
        }

        return $this->sendResponse([], 'Campaign updated successfully');
    }


    public function galleryRemove($id)
    {
        $gallery = CampaignGallery::findOrFail($id);
        MediaHelper::handleDeleteImage($gallery->photo);
        $gallery->delete();
        return $this->sendResponse([], 'Gallery removed successfully');
    }

    public function status($id, $status)
    {
        $campaign = Campaign::findOrFail($id);
        $campaign->is_feature = $status;
        $campaign->update();
        return redirect()->back()->with('success', 'Campaign status updated successfully');
    }


    public function destroy(Request $request)
    {
        $id = $request->id;
        $campaign = Campaign::findOrFail($id);
        MediaHelper::handleDeleteImage($campaign->photo);
        $gallery = CampaignGallery::where('campaign_id', $id)->get();
        foreach ($gallery as $item) {
            MediaHelper::handleDeleteImage($item->photo);
            $item->delete();
        }
        $faq = $campaign->faqs()->get();
        foreach ($faq as $item) {
            $item->delete();
        }
        $campaign->delete();
        return redirect()->back()->with('success', 'Campaign deleted successfully');
    }
}
