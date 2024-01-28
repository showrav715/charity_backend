<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentGateway extends Model
{
    protected $fillable = ['title', 'details', 'subtitle', 'name', 'type', 'information', 'currency_id', 'status', 'fixed_charge', 'percent_charge'];
    public $timestamps = false;
    protected $casts = ['currency_id' => 'array'];

    public function currency()
    {
        return $this->belongsTo('App\Models\Currency')->withDefault();
    }

    public static function scopeHasGateway($curr)
    {
        return PaymentGateway::where('currency_id', 'like', "%\"{$curr}\"%")->get();
    }

    public function convertAutoData()
    {
        return json_decode($this->information, true);
    }

    public function getAutoDataText()
    {
        $text = $this->convertAutoData();
        return end($text);
    }

    public function showKeyword()
    {
        $data = $this->keyword == null ? 'other' : $this->keyword;
        return $data;
    }

    public function showSubscriptionLink()
    {
        $link = '';
        $data = $this->keyword == null ? 'other' : $this->keyword;
        if ($data == 'paypal') {
            $link = route('seller.paypal.submit');
        } else if ($data == 'stripe') {
            $link = route('seller.stripe.submit');
        } else if ($data == 'mercadopago') {
            $link = route('seller.mercadopago.submit');
        } else if ($data == 'authorize') {
            $link = route('seller.authorize.submit');
        } else if ($data == 'paytm') {
            $link = route('seller.paytm.submit');
        } else if ($data == 'razorpay') {
            $link = route('seller.razorpay.submit');
        } else if ($data == 'paystack') {
            $link = route('seller.paystack.submit');
        }else if($data == 'tap'){
            $link = route('seller.tap.submit');
        }
        return $link;
    }

    public function showPackageLink()
    {
        $link = '';
        $data = $this->keyword == null ? 'other' : $this->keyword;
        if ($data == 'paypal') {
            $link = route('seller.paypal.submit');
        } else if ($data == 'stripe') {
            $link = route('seller.stripe.submit');
        } else if ($data == 'mercadopago') {
            $link = route('seller.mercadopago.submit');
        } else if ($data == 'authorize') {
            $link = route('seller.authorize.submit');
        } else if ($data == 'paytm') {
            $link = route('seller.paytm.submit');
        } else if ($data == 'razorpay') {
            $link = route('seller.razorpay.submit');
        } else if ($data == 'paystack') {
            $link = route('seller.paystack.submit');
        }

        return $link;
    }


    public function showLandingLink()
    {
        $link = '';
        $data = $this->keyword == null ? 'other' : $this->keyword;
        if ($data == 'paypal') {
            $link = route('landing.paypal.submit');
        } else if ($data == 'stripe') {
            $link = route('landing.stripe.submit');
        } else if ($data == 'mercadopago') {
            $link = route('landing.mercadopago.submit');
        } else if ($data == 'authorize') {
            $link = route('landing.authorize.submit');
        } else if ($data == 'paytm') {
            $link = route('landing.paytm.submit');
        } else if ($data == 'razorpay') {
            $link = route('landing.razorpay.submit');
        } else if ($data == 'paystack') {
            $link = route('landing.paystack.submit');
        }else if($data == 'tap'){
            $link = route('landing.tap.submit');
        }
        else if($data == 'mercadopago'){
            $link = route('landing.mercadopago.submit');
        }

        return $link;
    }

    public function showForm()
    {
        $show = '';
        $data = $this->keyword == null ? 'other' : $this->keyword;
        $values = ['voguepay', 'sslcommerz', 'flutterwave', 'razorpay', 'mollie', 'paytm', 'paystack', 'paypal', 'instamojo','tap','stripe'];
        if (in_array($data, $values)) {
            $show = 'no';
        } else {
            $show = 'yes';
        }
        return $show;
    }

    public function landingformUrl()
    {
        $keyword = $this->keyword;
        $route = route('landing.form.get', $keyword);
        return $route;
    }

    public function formUrl()
    {
        $keyword = $this->keyword;
        $route = route('seller.subscription.form.get', $keyword);
        return $route;
    }
}
