<?php

namespace App\Http\Controllers;

use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginInvokeController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $rules = [
            'email' => 'required',
            'password' => 'required'
        ];

        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {
            return "Salah bang";
        }

        try {
            $input = $request->only('email', 'password');
            $email = $request->input('email');
            $user = User::where('email', $email)->first();
            if (Hash::check($request->password, $user->password)) {
                // return "Berhasil";
                // Auth::guard('web')->attempt($input);
                return redirect()->route('dashboard');
            } else {
                return redirect('login');
            }
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
}
