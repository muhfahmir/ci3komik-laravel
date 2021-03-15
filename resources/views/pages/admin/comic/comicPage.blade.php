@extends('layouts.admin')
@section('title', 'Comic')
@section('content')
<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-sm-flex align-items-center justify-content-between ">
            <h1 class="h3 mb-0 text-gray-800">Comic</h1>
            <a href="{{ route('genre-create') }}" class="btn btn-primary">Add Comic</a>
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Judul</th>
                        <th>Jenis</th>
                        <th>Penulis</th>
                        <th>Deskripsi</th>
                        <th>Rating</th>
                        <th>Status</th>
                        <th>Rilis</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($comics as $comic)
                    <tr>
                        <td>{{$comic->imageUrl}}</td>
                        <td>{{$comic->judul}}</td>
                        <td>{{$comic->jenis}}</td>
                        <td>{{$comic->penulis}}</td>
                        <td>{{$comic->deskripsi}}</td>
                        <td>{{$comic->rating}}</td>
                        <td>{{$comic->status}}</td>
                        <td>{{$comic->rilis}}</td>
                        <td>Edit</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>


@endsection

@push('scripts')
<!-- Custom scripts for all pages-->
<script src="{{ asset('sbadmin2/js/sb-admin-2.min.js') }}"></script>

<!-- Page level plugins -->
<script src="{{ asset('sbadmin2/vendor/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('sbadmin2/vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>

<!-- Page level custom scripts -->
<script src="{{ asset('sbadmin2/js/demo/datatables-demo.js') }}"></script>
@endpush