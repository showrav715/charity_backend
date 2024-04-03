<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Donation;
use Illuminate\Http\Request;

class DonationController extends Controller
{

    public function index(Request $request)
    {
        $donations = Donation::with('campaign')
            ->latest()->paginate(10);
        return view('admin.donation.index', compact('donations'));
    }

}
