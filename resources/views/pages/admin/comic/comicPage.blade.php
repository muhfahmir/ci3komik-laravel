@extends('layouts.admin') 
@section('title', 'Comic') 
@section('content')
<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-sm-flex align-items-center justify-content-between">
            <h1 class="h3 mb-0 text-gray-800">Comic</h1>
            <a href="{{ route('comic-create') }}" class="btn btn-primary"
                >Add Comic</a
            >
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table
                class="table table-bordered"
                id="dataTable"
                width="100%"
                cellspacing="0"
            >
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
                        <td>
                            <img
                                src="{{ asset('images/'.$comic->imageUrl)}}"
                                alt=""
                                width="100"
                            />
                        </td>
                        <td>{{$comic->judul}}</td>
                        <td>{{$comic->jenis}}</td>
                        <td>{{$comic->penulis}}</td>
                        <td id="deskripsi">
                            <span
                                class="text-ellipsis-3" style=" overflow: hidden;
                                text-overflow: ellipsis;
                                display: -webkit-box;
                                -webkit-box-orient: vertical;
                                -webkit-line-clamp: 3;"
                                >{{ strip_tags($comic->deskripsi) }}</span
                            >
                        </td>
                        <td>{{$comic->rating}}</td>
                        <td>{{$comic->status == 1 ? "Ongoing":'Tamat'}}</td>
                        <td>{{$comic->rilis}}</td>
                        <td><div class="dropdown no-arrow">
                            <a class="btn dropdown-toggle" type="button" id="dropdownAction" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-ellipsis-h"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownAction">
                                <a class="dropdown-item btn-edit" href="{{ route('comic-edit',$comic->id_komik) }}">
                                    <i class="fas fa-edit fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Edit
                                </a>

                                <a class="dropdown-item delete-btn" href="{{ route('comic-delete',$comic->id_komik) }}">
                                    <i class="fas fa-trash fa-sm fa-fw mr-2 text-gray-400"></i>
                                    delete
                                </a>
                            </div>
                        </div></td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection 

@push('scripts')
<script>
    $(document).ready(function () {
        jQuery("#dataTable").dataTable({
            bDestroy: true,
            bAutoWidth: true,
            bFilter: true,
            bSort: true,
            aaSorting: [[0]],
            aoColumns: [
                {
                    bSortable: true,
                },
                {
                    bSortable: true,
                },
                {
                    bSortable: true,
                },
                {
                    bSortable: true,
                },
                {
                    bSortable: true,
                },
                {
                    bSortable: true,
                },
                {
                    bSortable: true,
                },
                {
                    bSortable: true,
                },
                {
                    bSortable: false,
                },
            ],
        });
    });
    let deletebtn = document.querySelectorAll('.delete-btn')
        deletebtn.forEach((btn) => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                const url = btn.getAttribute('href');
                swal({
                        title: "Are you sure?",
                        text: "But you will still be able to retrieve this file.",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Yes, delete it!",
                        cancelButtonText: "No, cancel please!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                    function(isConfirm) {
                        if (isConfirm) {
                            window.location.href = url; // submitting the form when user press yes
                        } else {
                            swal("Cancelled", "Your file is safe :)", "error");
                        }
                    });
            })
        })
</script>
@endpush
