<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Helpers\MediaHelper;
use App\Models\Campaign;
use App\Models\CampaignGallery;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CampaignController extends Controller
{
    public function index()
    {
        $campaigns = Campaign::get();
        return view('admin.campaign.index', compact('campaigns'));
    }


    function create()
    {
        $categories = Category::get();
        return view('admin.campaign.create', compact('categories'));
    }


    public function store(Request $request)
    {
        //dd($request->all());
        $request->validate([
            'title' => 'required|unique:campaigns,title',
            'description' => 'required',
            'category_id' => 'required',
            'photo' => 'required|mimes:jpeg,jpg,png',
            'goal' => 'required',
        ]);

        $campaign = new Campaign();
        $campaign->title = $request->title;
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
        return redirect()->route('admin.campaign.index')->with('success', 'Campaign created successfully');
    }


    public function edit($id)
    {
        $data = Campaign::with(['galleries', 'faqs'])->findOrFail($id);
        $categories = Category::get();
        return view('admin.campaign.edit', compact('data', 'categories'));
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


        if ($request->is_faq == 'on') {
            if ($request->faq_title && $request->faq_content)
                $campaign->faqs()->delete();
            foreach ($request->faq_title as $key => $question) {
                $campaign->faqs()->create([
                    'title' => $question ? $question : null,
                    'content' => $request->faq_content[$key] ? $request->faq_content[$key] : null,
                ]);
            }
        }

        if ($request->gallery) {
            foreach ($request->gallery as $key => $gallery) {
                $photo = MediaHelper::handleMakeImage($gallery);
                $campaign->galleries()->create([
                    'photo' => $photo ? $photo : null,
                ]);
            }
        }

        return redirect()->route('admin.campaign.index')->with('success', 'Campaign updated successfully');
    }


    public function galleryRemove($id)
    {
        $gallery = CampaignGallery::findOrFail($id);
        MediaHelper::handleDeleteImage($gallery->photo);
        $gallery->delete();
        return response()->json(['success' => 'Gallery deleted successfully']);
    }

    public function status($id,$status) {
        $campaign = Campaign::findOrFail($id);
        $campaign->is_feature = $status;
        $campaign->update();
        return redirect()->back()->with('success', 'Campaign status updated successfully');
    }


    public function destroy($id)
    {
    }
}
