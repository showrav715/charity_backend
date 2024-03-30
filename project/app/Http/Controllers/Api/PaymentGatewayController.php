<?php

namespace App\Http\Controllers\Api;

use App\Models\PaymentGateway;
use Illuminate\Http\Request;

class PaymentGatewayController extends ApiController
{
    // Get all payment gateways
    public function getGateways(Request $request)
    {
        $gateways = PaymentGateway::where('status', 1)
            ->where("currency_id", "LIKE", "%\"$request->currency\"%")
            ->get();
        return $this->sendResponse($gateways, 'Payment gateways fetched successfully');
    }


    public function campaignSubmit(Request $request) {
        
        return $this->sendResponse($request->all(), 'Campaign submitted successfully');
    }
}
