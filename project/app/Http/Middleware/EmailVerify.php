<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EmailVerify
{

    public function handle(Request $request, Closure $next)
    {

        if (auth()->check()) {
            $user = auth()->user();
            if ($user->email_verified == 0) {
                $response = [
                    'success'    => false,
                    'message'    => 'Please verify your email.',
                    'response'   => ['email_verify' => false],
                ];
                return response()->json($response);
            }
            return $next($request);
        }
    }
}
