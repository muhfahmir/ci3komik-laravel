@extends('layouts.admin') 
@section('title', 'Edit Comic') 
@section('content')
<div class="card mb-3">
    <div class="card-body">
        <h1 class="h3 mb-0 text-gray-800 card-title">Edit Comic</h1>
    </div>
</div>

<form action="{{ route('comic-update',$comic->id_komik) }}" method="post" enctype="multipart/form-data">
    @csrf
    <div class="row mb-3">
        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-5 ">
                            <label for="image" class="frame" id="frameImage" style="width: 100%;height:100%;cursor: pointer" >
                                @if ($comic->imageUrl!=null)
                                    <div class="position-relative w-100 h-100" >
                                        <img src="{{ asset('images/'.$comic->imageUrl) }}" alt="..." width="100%" height="100%" style="border-radius: 5px;">
                                        <a href="#" class="close-img" style="display: flex;position: absolute;background-color: white;height: 40px;width: 40px;justify-content: center;align-items: center;border-radius: 50%;box-shadow: 1px 1px 5px rgba(0, 0, 0, .3);top: -15px;text-decoration: none !important;right: -15px;">
                                        <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                @else
                                <img src="{{ asset('images/avatar.jpg') }}" width="100%" height="100%" style="border-radius: 5px;">
                                @endif
                            </label>
                            <input type="file" id="image" name="image" style="opacity: 0;">
                        </div>
                        <div class="col-md-7">
                            <div class="mb-3">
                                <label for="judul" class="form-label">Judul Komik</label>
                                <input type="text" class="form-control" id="judul" name="judul" placeholder="masukkan judul ..." aria-describedby="emailHelp" value="{{ $comic->judul }}">
                                <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
                            </div>
                            <div class="mb-3">
                                <label for="jenis" class="form-label">Jenis Komik</label>
                                <input type="text" class="form-control" id="jenis" name="jenis" placeholder="jenis ..." value="{{ $comic->jenis }}">
                            </div>
                            <div class="mb-3">
                                <div class="form-group">
                                    <label for="status">Status Komik</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="1">Ongoing</option>
                                        <option value="2">Tamat</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h5 class="card-title">Detail Komik <hr></h5>
                    <div class="form-row mb-3">
                        <div class="col-md-8">
                            <label for="penulis">Penulis</label>
                            <input type="text" class="form-control" id="penulis" name="penulis" value="{{ $comic->penulis }}">
                        </div>
                        <div class="col-md-4">
                            <label for="rilis">Tahun Rilis</label>
                            <input type="text" class="form-control" id="rilis" name="rilis" value="{{ $comic->rilis }}">
                            </div>
                    </div>
                    <div class="form-row mb-3">
                        <div class="col-md-4">
                            <label for="rating">Rating</label>
                            <input type="text" class="form-control" id="rating" name="rating" value="{{ $comic->rating }}">
                        </div>
                        <div class="col-md-4">
                            <label for="usia_pembaca">Usia Pembaca</label>
                            <input type="text" class="form-control" id="usia_pembaca" name="usia_pembaca" value="{{ $comic->usia_pembaca }}">
                        </div>
                        <div class="col-md-4">
                            <div class="form-group" id="form-status">
                                <label>Status</label>
                                <div class="custom-control custom-switch">
                                    @if ($comic->usia_pembaca)
                                        <input type="checkbox" class="custom-control-input" id="status-komik" name="status-komik" checked value="1">
                                    <label class="custom-control-label" for="status-komik" id="labelStatus">Active</label>
                                    @else
                                        <input type="checkbox" class="custom-control-input" id="status-komik" name="status-komik" value="0">
                                        <label class="custom-control-label" for="status-komik" id="labelStatus">Tidak Active</label>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="genre">Genre</label>
                        <select class="form-control" id="genre" name="genre[]" required multiple>
                            @foreach ($genres as $genre)
                                <option value=" {{ $genre->id_genre }} " 
                                    @foreach ($detailGenre as $select) 
                                    {{ $select->id_genre == $genre->id_genre ? 'selected' : '' }}   
                                    @endforeach>
                                    {{ $genre->nama_genre }}
                                </option>
                                
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        

        <div class="col-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Deskripsi Komik <hr></h5>
                    <div class="form-group">
                        <label for="deskripsi">Deskripsi Komik</label>
                        <textarea class="form-control" id="deskripsi" name="deskripsi"></textarea>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-md-12 d-flex justify-content-end m-3">
            <a class="btn btn-secondary" href="{{ route('comic') }}">Kembali</a>
            <button type="submit" class="btn btn-primary mx-3">Save</button>
        </div>
    </div>
</form>

@endsection
@push('scripts')
    <script>
        let status = document.querySelector('#status-komik')
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
        CKEDITOR.replace('deskripsi');
        CKEDITOR.instances["deskripsi"].setData(`<?php echo $comic['deskripsi'] ?>`);

    </script>
    <script>
        $(document).ready(function() {
            $('#genre').select2({
                placeholder: 'Select Genre',
                allowClear: true
            });

            $('#image').change(function() {
                let foto = readURL(this);
                foto.onload = function(e) {
                    $('#frameImage').html(
                        `<div class="position-relative w-100 h-100" >
                            <img src="${e.target.result}" alt="..." width="100%" height="100%" style="border-radius: 5px;">
                            <a href="#" class="close-img" style="display: flex;position: absolute;background-color: white;height: 40px;width: 40px;justify-content: center;align-items: center;border-radius: 50%;box-shadow: 1px 1px 5px rgba(0, 0, 0, .3);top: -15px;text-decoration: none !important;right: -15px;">
                            <i class="fa fa-times"></i>
                            </a>
                        </div>
                        
                        `
                    );
                };
            })

            $("#frameImage").on("click", ".close-img", function() {
                $('#frameImage').html('<img src="{{ asset('images/avatar.jpg') }}" width="100%" height="100%" style="border-radius: 5px;">')
                $('#image').val('')
            });
        });

        function readURL(input, element) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.readAsDataURL(input.files[0]); // convert to base64 string
                // reader.onload = function(e) {
                //     return e;
                // }

                return reader;
                // var reader = new FileReader();

                // console.log(element);
                // reader.onload = function(e) {
                //     $(`${element}`).attr('src', e.target.result);
                // }
                // reader.readAsDataURL(input.files[0]); // convert to base64 string
            }
        }
    </script>
@endpush