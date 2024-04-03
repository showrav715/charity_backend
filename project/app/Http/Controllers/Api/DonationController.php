<?php

namespace App\Http\Controllers\Api;

use App\Models\Donation;
use Illuminate\Http\Request;

class DonationController extends ApiController
{

    public function donations(Request $request)
    {
        $txn = $request->txn_id;
        $donations = Donation::with(['owner', 'campaign'])->where('user_id', auth()->id())
            ->when($txn, function ($query) use ($txn) {
                return $query->where('txn_id', $txn);
            })
            ->latest()
            ->paginate(2);
        return $this->sendResponse($donations, 'Donations fetched successfully.');
    }

}
