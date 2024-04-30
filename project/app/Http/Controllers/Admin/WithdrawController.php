<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Withdraw;
use Illuminate\Http\Request;

class WithdrawController extends Controller
{
    public function index() {
        $curr = Currency::where('default', 1)->first();
        return view('admin.withdraw.index', compact('curr'));
    }

    public function withdrawRequest () {
        $withdraws = Withdraw::orderBy('id', 'desc')->paginate(10);
        return view('admin.withdraw.request', compact('withdraws'));
    }
}

   
