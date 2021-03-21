@extends('layouts.skeleton')
@section('title','Login Page')
@section('app')
<!-- START NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 bg-white">
    <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">BacaBersama</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto d-flex align-items-center">
                <li class="nav-item {{ request()->is('login') ? 'active':'' }}">
                    <a class="nav-link" href="{{ url('login') }}">Login</a>
                </li>
                <li class="nav-item {{ request()->is('register') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ url('register') }}">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- END NAVBAR -->

<section id="banner">
    @if (session('logout'))
        <div class="alert alert-success">
            {{ session('logout') }}
        </div>
    @else
    @include('partials.flash')
    @endif
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header bg-green">
                        <h1 class="text-center text-white">Login Page</h1>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('login') }}" method="post">
                            @csrf
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group mb-2">
                                    <input type="text" class="form-control" name="email" id="email" placeholder="Email ..." value="{{ old('email') }}">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">@</div>
                                    </div>
                                </div>
                                @if($errors->has('email'))
                                <div class="error ">{{ $errors->first('email') }}</div>
                                @endif
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <div class="input-group mb-2">
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Password ...">
                                    <div class="input-group-append">
                                        <button class="input-group-text btn-outline-secondary" type="button">
                                            <i id="passwordIcon" class="far fa-eye"></i>
                                        </button>
                                        <div class="input-group-text">
                                            <i class="fa fa-lock"></i>
                                        </div>
                                    </div>
                                </div>
                                @if($errors->has('password'))
                                <div class="error ">{{ $errors->first('password') }}</div>
                                @endif
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary bg-green w-100 shadow-none" type="submit" name="btn-login" id="btn-login">
                                    Login
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section>
@endsection