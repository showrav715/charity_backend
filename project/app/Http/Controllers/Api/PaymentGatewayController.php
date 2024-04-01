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

    public function campaignSubmit(Request $request)
    {
        $requestData = $request->all();
        $service = str_replace('Api', '', __NAMESPACE__) . 'Gateway' . '\\' . ucwords($requestData['gateway']);
        $process = $service::initiate($requestData);
        return $this->sendResponse($process, 'Campaign submitted process');
    }

    public function notifyOperation($res)
    {

        if ($res['status'] == 1) {
            return redirect("http://localhost:3000/checkout/success?txn_id=" . $res['txn_id'] . "&message=" . $res['message']);
        } else {
            return redirect("http://localhost:3000/checkout/fail?message=" . $res['message']);
        }

    }
}
