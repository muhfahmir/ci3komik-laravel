@extends('layouts.admin')
@section('title', 'Genre')
@section('content')
<!-- Button trigger modal -->
<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="d-sm-flex align-items-center justify-content-between ">
            <h1 class="h3 mb-0 text-gray-800">Genre</h1>
            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addGenreModal">Add Genre</a>
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th width="42">ID</th>
                        <th>Nama Genre</th>
                        <th width="21"></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($genres as $genre)
                    <tr>
                        <td>{{$genre->id_genre}}</td>
                        <td>{{$genre->nama_genre}}</td>
                        <td><div class="dropdown no-arrow">
                            <a class="btn dropdown-toggle" type="button" id="dropdownAction" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-ellipsis-h"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownAction">
                                <a class="dropdown-item btn-edit" href="#" data-toggle="modal" data-target="#editGenreModal" data-id="{{ $genre->id_genre }}" data-genre="{{ $genre->nama_genre }}">
                                    <i class="fas fa-edit fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Edit
                                </a>

                                <a class="dropdown-item delete-btn" href="{{ route('genre-delete',$genre->id_genre) }}">
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

@section('modals')
  <!-- Modal -->
  <div class="modal fade" id="addGenreModal" tabindex="-1" aria-labelledby="addGenreModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addGenreModalLabel">Add Genre</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
        <form action="{{ route('genre-store') }}" method="post">
          @csrf
          <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Nama genre</label>
                <div class="input-group mb-2">
                    <input type="text" class="form-control" name="name" id="name" placeholder="name ...">
                </div>
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary">Save</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="editGenreModal" tabindex="-1" aria-labelledby="editGenreModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editGenreModalLabel">Edit Genre</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
        <form action="#" method="post" id="formEditGenre">
          @csrf
          <div class="modal-body">
              <div class="mb-3">
                <label for="name_genre" class="form-label">Nama Genre</label>
                <div class="input-group mb-2">
                    <input type="text" class="form-control" name="name_genre" id="name_genre" placeholder="name ...">
                </div>
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary">Save</button>
          </div>
        </form>
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
                    bSortable: false,
                },
            ],
        });
    });
      $( document ).ready(function() {
          $('.dropdown-menu').on('click','.btn-edit',function(e){
            $('#formEditGenre').attr('action',"{{ url('/genre/update/') }}/"+$(this).data('id'))
            $('#name_genre').val($(this).data('genre'));
          })
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
