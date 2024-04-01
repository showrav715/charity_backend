<?php

namespace App\Http\Controllers\Gateway;

use App\Http\Controllers\PaymentApiController;
use App\Http\Controllers\User\DepositController;
use App\Models\PaymentGateway;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Razorpay\Api\Api;

class Razorpay
{

    public static function initiate($payment_data)
    {

        $data = PaymentGateway::whereKeyword('razorpay')->first();
        $paydata = $data->convertAutoData();
        $keyId = $paydata['key'];
        $keySecret = $paydata['secret'];
        $displayCurrency = apiCurrency($payment_data['currency_id'])->code;
        $api = new Api($keyId, $keySecret);

        $payment_amount = $payment_data['amount'];
        $order_number = Str::random(8);

        $data = PaymentGateway::whereKeyword('razorpay')->first();

        $orderData = [
            'receipt' => $order_number,
            'amount' => $payment_amount * 100, // 2000 rupees in paise
            'currency' => apiCurrency($payment_data['currency_id'])->code,
            'payment_capture' => 1, // auto capture
        ];

        $razorpayOrder = $api->order->create($orderData);

        Session::put('order_payment_id', $razorpayOrder['id']);

        $displayAmount = $amount = $orderData['amount'];

        if ($displayCurrency !== apiCurrency($payment_data['currency_id'])->code) {
            $url = "https://api.fixer.io/latest?symbols=$displayCurrency&base=INR";
            $exchange = json_decode(file_get_contents($url), true);

            $displayAmount = $exchange['rates'][$displayCurrency] * $amount / 100;
        }

        $data = [
            "key" => $keyId,
            "amount" => $amount,
            "name" => "",
            "description" => "",
            "prefill" => [
                "name" => isset($payment_data->name) ? $payment_data->name : '',
                "email" => isset($payment_data->email) ? isset($payment_data->email) : '',
                "contact" => "",
            ],

            "notes" => [
                "address" => "",
                "merchant_order_id" => $order_number,
            ],
            "theme" => [
                "color" => "#fff",
            ],
            "order_id" => $razorpayOrder['id'],
        ];

        if ($displayCurrency !== 'INR') {
            $data['display_currency'] = $displayCurrency;
            $data['display_amount'] = $displayAmount;
        }

        $json = json_encode($data);
        $displayCurrency = $displayCurrency;
        $view = 'other.razorpay-checkout';
        $prams = ['data' => $data, 'displayCurrency' => $displayCurrency, 'json' => $json, 'notify_url' => route('razorpay.notify')];
        return ['status' => 1, 'view' => $view, 'prams' => $prams];
    }

    public function notify(Request $request)
    {
        // api init
        $data = PaymentGateway::whereKeyword('razorpay')->first();
        $paydata = $data->convertAutoData();
        $keyId = $paydata['key'];
        $keySecret = $paydata['secret'];
        $api = new Api($keyId, $keySecret);

        // login start
        $status = 0;
        $message = '';
        $txn_id = '';
        $success = true;
        $payment_id = Session::get('order_payment_id');
        $input_data = $request->all();
        if (empty($input_data['razorpay_payment_id']) === false) {
            try {
                $attributes = array(
                    'razorpay_order_id' => $payment_id,
                    'razorpay_payment_id' => $input_data['razorpay_payment_id'],
                    'razorpay_signature' => $input_data['razorpay_signature'],
                );
                $api->utility->verifyPaymentSignature($attributes);
            } catch (SignatureVerificationError $e) {
                $success = false;
            }
        }

        if ($success === true) {
            $status = 1;
            $txn_id = $input_data['razorpay_payment_id'];
        } else {
            $message = "Payment Field";
        }

        switch (Session::get('type')) {
            case 'deposit':
                return (new DepositController)->notifyOperation(['message' => $message, 'status' => $status, 'txn_id' => $txn_id]);
                break;

            case 'api':
                return (new PaymentApiController)->notifyOperation(['message' => $message, 'status' => $status, 'txn_id' => $txn_id]);
                break;

            default:
                dd('wrong');
                break;
        }
    }
}
