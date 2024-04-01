<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\Api\PaymentGatewayController;
use App\Models\Campaign;
use App\Models\PaymentGateway;
use Illuminate\Http\Request;

class Stripe
{

    public static function initiate($payment_data)
    {

        $campaign = Campaign::where('slug', $payment_data['campaign'])->first();
        $cancel_url = 'http://localhost:3000/checkout/cancel?slug=' . $campaign->slug;

        // SERIALIZE DATA
        $payment_amount = $payment_data['amount'];
        $message = '';
        $status = 0;
        $txn_id = '';
        $data = PaymentGateway::whereKeyword('stripe')->first();
        $paydata = $data->convertAutoData();

        $stripe_secret_key = $paydata['secret'];
        \Stripe\Stripe::setApiKey($stripe_secret_key);
        $checkout_session = \Stripe\Checkout\Session::create([
            "mode" => "payment",
            "success_url" => route('stripe.notify') . '?session_id={CHECKOUT_SESSION_ID}',
            "cancel_url" => $cancel_url,
            "locale" => "auto",
            "customer_email" => $payment_data['email'] ? $payment_data['email'] : null,
            "line_items" => [
                [
                    "quantity" => 1,
                    "price_data" => [
                        "currency" => apiCurrency($payment_data['currency_id'])->code,
                        "unit_amount" => $payment_amount * 100,
                        "product_data" => [
                            "name" => 'Payment for deposit',
                        ],
                    ],
                ],

            ],
        ]);

        if ($checkout_session->id) {
            return ['status' => 1, 'url' => $checkout_session->url];
        }
    }

    public function notify(Request $request)
    {
        $status = 0;
        $message = '';
        $txn_id = '';

        $data = PaymentGateway::whereKeyword('stripe')->first();
        $paydata = $data->convertAutoData();
        $stripe_secret_key = $paydata['secret'];
        $stripe = new \Stripe\StripeClient($stripe_secret_key);
        $response = $stripe->checkout->sessions->retrieve($request->session_id);
        if ($response->status == 'complete' && $response->payment_status == 'paid') {
            $status = 1;
            $txn_id = $response->payment_intent;
        } else {
            $message = __('Payment Field Please Try again');
        }

        return (new PaymentGatewayController)->notifyOperation(['message' => $message, 'status' => $status, 'txn_id' => $txn_id]);
    }
}
