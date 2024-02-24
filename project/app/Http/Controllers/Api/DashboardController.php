<?php

namespace App\Http\Controllers\Api;

use App\Classes\GoogleAuthenticator;

use App\Http\Controllers\Controller;
use App\Http\Helpers\MediaHelper;
use App\Http\Resources\TransactionResource;
use App\Models\Currency;
use App\Models\Deposit;
use App\Models\Generalsetting;
use App\Models\KycForm;
use App\Models\Order;
use App\Models\PaymentGateway;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class DashboardController extends Controller
{



    public function dashboard()
    {


        return response()->json(['status' => true, 'data' => '', 'error' => []]);
    }

    public function kycForm()
    {
        if (auth()->user()->kyc_status == 2)
            return response()->json(['status' => false, 'data' => [], 'error' => ['You have already submitted the KYC data.']]);
        if (auth()->user()->kyc_status == 1)
            return response()->json(['status' => false, 'data' => [], 'error' => ['Your KYC data is already verified.']]);
        $success['kyc_form_data'] = KycForm::get();
        return response()->json(['status' => true, 'data' => $success, 'error' => []]);
    }

    public function kycFormSubmit(Request $request)
    {
        if (auth()->user()->kyc_status == 2)
            return response()->json(['status' => false, 'data' => [], 'error' => ['You have already submitted the KYC data.']]);
        if (auth()->user()->kyc_status == 1)
            return response()->json(['status' => false, 'data' => [], 'error' => ['Your KYC data is already verified.']]);

        $data = $request->except('_token');
        $kycForm = KycForm::get();
        $rules = [];
        foreach ($kycForm as $value) {
            if ($value->required == 1) {
                if ($value->type == 2) {
                    $rules[$value->name] = 'required|image|mimes:png,jpg,jpeg|max:5120';
                }
                $rules[$value->name] = 'required';
            }

            if ($value->type == 2) {
                $rules[$value->name] = 'image|mimes:png,jpg,jpeg|max:5120';
                if (request("$value->name")) {
                    $filename = MediaHelper::handleMakeImage(request("$value->name"));
                }
                unset($data[$value->name]);
                $data['image'][$value->name] = $filename;
            }

            if ($value->type == 3) {
                unset($data[$value->name]);
                $data['details'][$value->name] = request("$value->name");
            }
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {

            return response()->json(['status' => false, 'data' => [], 'error' => $validator->errors()]);
        }

        $user = auth()->user();
        $user->kyc_info = $data;
        $user->kyc_status = 2;
        $user->save();

        return response()->json(['status' => true, 'data' => [], 'error' => ['Your KYC data has been submitted successfully.']]);
    }


    public function kycShow()
    {

        $user = User::where('id', auth()->user()->id)->first();

        if ($user->kyc_status == 0)
            return response()->json(['status' => false, 'data' => [], 'error' => ['Your KYC data is not submitted yet.']]);
        if ($user->kyc_status == 1)
            $message =  'Your KYC data is verified.';
        $success['user_info'] = $user->kyc_info;
        foreach ($user->kyc_info['image'] as $key => $value) {
            $success['user_info']['image'][$key] = getPhoto($value);
        }
        return response()->json(['status' => true, 'data' => $success, 'error' => ['Your KYC data is verified.']]);
    }



    public function getDetails()
    {

        $user = auth()->user();
        $success['user'] = $user;
        $success['user']['photo'] = getPhoto($user->photo);
        return response()->json(['status' => true, 'data' => $success, 'error' => []]);
    }

    public function profileSubmit(Request $request)
    {
        $request->validate([
            'username' => 'required|min:4|unique:users,email,' . auth()->id(),
            'name' => 'required',
            'phone' => 'required',
            'photo' => 'nullable|mimes:jpeg,jpg,png,PNG,JPG',
        ]);

        try {


            $user          = auth()->user();
            $user->name    = $request->name;
            $user->username    = $request->username;
            $user->phone   = $request->phone;
            $user->city    = $request->city;
            $user->zip     = $request->zip;
            $user->address = $request->address;

            if ($request->photo) {
                $user->photo = MediaHelper::handleUpdateImage($request->photo, $user->photo, [300, 300]);
            }
            $user->update();

            return response()->json(['status' => true, 'data' => $user, 'success' => 'Profile updated successfully']);
        } catch (\Throwable $th) {
            return response()->json(['status' => false, 'data' => $user, 'error' => $th->getMessage()]);
        }
    }

    public function changePass(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'old_pass' => 'required',
            'password' => 'required|confirmed|min:4',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'data' => [], 'error' => $validator->errors()]);
        }

        $user = auth()->user();

        if (Hash::check($request->old_pass, $user->password)) {
            $user->password = Hash::make($request->password);
            $user->update();
            return response()->json(['status' => true, 'data' => [], 'message' => 'Password changed successfully']);
        }
        return response()->json(['status' => false, 'data' => [], 'error' => 'Old password does not match']);
    }


    public function twoFactor()
    {
        $gnl = Generalsetting::first();
        $ga = new GoogleAuthenticator();
        $user = auth()->user();
        $secret = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->name . '@' . $gnl->title, $secret);
        $prevcode = $user->two_fa_code;
        $prevqr = $ga->getQRCodeGoogleUrl($user->name . '@' . $gnl->title, $prevcode);

        return response()->json(['status' => true, 'data' => ['secret' => $secret, 'qrCodeUrl' => $qrCodeUrl, 'prevcode' => $prevcode, 'prevqr' => $prevqr], 'error' => []]);
    }

    public function createTwoFactor(Request $request)
    {

        $user = auth()->user();

        $this->validate($request, [
            'key' => 'required',
            'code' => 'required',
        ]);

        $ga = new GoogleAuthenticator();
        $secret = $request->key;
        $oneCode = $ga->getCode($secret);


        if ($oneCode == $request->code) {
            $user->two_fa_code = $request->key;
            $user->two_fa = 1;
            $user->two_fa_status = 1;
            $user->save();

            return response()->json(['status' => true, 'data' => [], 'error' => ['Two factor authentication enabled successfully']]);
        } else {
            return response()->json(['status' => false, 'data' => [], 'error' => ['Invalid verification code']]);
        }
    }

    public function disableTwoFactor(Request $request)
    {
        $user = auth()->user();

        $this->validate($request, [
            'code' => 'required',
        ]);

        $ga = new GoogleAuthenticator();
        $secret = $user->two_fa_code;
        $oneCode = $ga->getCode($secret);

        if ($oneCode == $request->code) {

            $user->two_fa = 0;
            $user->two_fa_status = 0;
            $user->two_fa_code = null;
            $user->save();


            return response()->json(['status' => true, 'data' => [], 'error' => ['Two factor authentication disabled successfully']]);
        } else {
            return response()->json(['status' => false, 'data' => [], 'error' => ['Invalid verification code']]);
        }
    }


    public function otp(Request $request)
    {
        $request->validate([
            'otp' => 'required'
        ]);
        $user = auth()->user();
        $googleAuth = new GoogleAuthenticator();
        $otp =  $request->otp;

        $secret = $user->two_fa_code;
        $oneCode = $googleAuth->getCode($secret);
        $userOtp = $otp;
        if ($oneCode == $userOtp) {
            $user->verified = 1;
            $user->save();
            return response()->json(['status' => true, 'data' => [], 'error' => ['OTP verified successfully']]);
        } else {
            return response()->json(['status' => false, 'data' => [], 'error' => ['Invalid OTP']]);
        }
    }
}
