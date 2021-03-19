@extends('layouts.admin')
@section('title',"Create User")

@section('content')
<div class="card mb-3">
    <div class="card-body">
        <h1 class="h3 mb-0 text-gray-800 card-title">Add User</h1>
    </div>
</div>
<div class="row">
    <div class="col-6">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('user-store') }}" method="post">
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
                        <div class="form-group" id="form-status">
                            <label>Status</label>
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="status" name="status" checked value="1">
                                <label class="custom-control-label" for="status" id="labelStatus">Active</label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary form-control" >Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
    <script>
        let status = document.querySelector('#status')
        let labelStatus = document.querySelector('#labelStatus')
        status.addEventListener('change',function(e){
            if(status.hasAttribute('checked')){
                status.removeAttribute('checked');
                labelStatus.innerHTML = "Tidak Active";
                status.setAttribute('value','0');
            }else{
                status.setAttribute('checked',"checked");
                labelStatus.innerHTML = "Active";
                status.setAttribute('value','1');
            }
        });
    </script>
@endpush