@extends('layouts.skeleton')
@section('title','Registration')
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
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header bg-green">
                        <h1 class="text-center text-white">Register Page</h1>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('register') }}" method="post">
                            @csrf
                            <div class="mb-3">
                                <label for="name" class="form-label">Nama Lengkap</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="masukkan nama lengkap ..." aria-describedby="emailHelp">
                                <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <div class="input-group mb-2">
                                    <input type="text" class="form-control" id="email" name="email" placeholder="Email ...">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">@</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="password" class="form-label">Password</label>
                                        <div class="input-group mb-2">
                                            <input type="password" class="form-control" id="password" placeholder="Password ..." name="password">
                                            <div class="input-group-append">
                                                <button class="input-group-text btn-outline-secondary" type="button">
                                                    <i id="passwordIcon" class="far fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-6">
                                        <label for="password_confirmation" class="form-label">Konfirmasi Password</label>
                                        <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="confirm password ..." autocomplete="off">
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary bg-green btn-green form-control" name="btnRegister" id="btnRegister">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section>
@endsection