<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LoginController extends Controller
{
    //
    public function index()
    {
        return view('pages.auth.loginPage');
    }

    public function store(Request $request)
    {
        return $request;
    }
}