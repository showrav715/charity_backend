<?php

namespace App\Http\Controllers\Api;

use App\Models\Campaign;
use App\Models\Donation;
use App\Models\PaymentGateway;
use Carbon\Carbon;
use Exception;
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

        if ($request->amount < 1) {
            return $this->sendError('Amount must be greater than 0');
        }

        $requestData = $request->all();
        $service = str_replace('Api', '', __NAMESPACE__) . 'Gateway' . '\\' . ucwords($requestData['gateway']);
        $process = $service::initiate($requestData);

        return $this->sendResponse($process, 'Campaign submitted process');
    }

    public function notifyOperation($res)
    {

        if (!isset($res['access_id'])) {
            return redirect("http://localhost:3000/checkout/failed?message=Invalid Transaction");
        }

        if ($res['status'] == 0) {
            return redirect("http://localhost:3000/checkout/failed?message=" . $res['message']);
        }

        try {
            $orderData = (array) getStorage($res['access_id']);

            $campaign = Campaign::whereSlug($orderData['campaign'])->first();
            $campaign->raised = $campaign->raised + $orderData['amount'];
            $campaign->save();

            $donation = new Donation();
            $donation->name = isset($orderData['name']) ? $orderData['name'] : null;
            $donation->email = isset($orderData['email']) ? $orderData['email'] : null;
            $donation->phone = isset($orderData['phone']) ? $orderData['phone'] : null;
            $donation->address = isset($orderData['address']) ? $orderData['address'] : null;
            $donation->owner_id = $campaign->user_id;
            $donation->user_id = isset($orderData['user_id']) ? $orderData['user_id'] : null;
            $donation->total = storePrice($orderData['amount'] + $orderData['tips'], $orderData['currency_id']);
            $donation->tips = storePrice($orderData['tips'], $orderData['currency_id']);
            $donation->currency = json_encode(apiCurrency($orderData['currency_id']));
            $donation->status = $res['status'] == 1 ? 1 : 0;
            $donation->campaign_slug = $orderData['campaign'];
            $donation->payment_method = $orderData['gateway'];
            $donation->txn_id = $res['txn_id'];
            $donation->created_at = Carbon::now();
            $donation->save();

            // donar transaction create
            if (isset($orderData['user_id'])) {
                transaction($orderData['amount'], $res['txn_id'], $orderData['user_id'], '-', 'My Donation');
            }

            // campaign owner transaction create
            transaction($orderData['amount'], $res['txn_id'], $campaign['user_id'], '+', 'Donation Received');

            // delete storage
            deleteStorage($res['access_id']);

            return redirect("http://localhost:3000/checkout/success?txn_id=" . $res['txn_id'] . "&message=" . $res['message']);
        } catch (Exception $e) {
            return redirect("http://localhost:3000/checkout/failed?message=" . $e->getMessage());
        }

    }
}