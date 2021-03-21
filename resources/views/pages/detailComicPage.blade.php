@extends('layouts.skeleton')
@section('title','Detail Comic')

@section('app')
@include('partials.navbar')
<section id="banner" class="mt-0">
    <div class="banner__wrapper d-flex align-items-center justify-content-center">
        <h1 class="my-heading text-white" style="font-size:5rem;">{{$comic->jenis}}</h1>
    </div>
    <div class="container" style="margin-top: -100px;">
        <div class="card shadow-sm">
            <div class="card-header bg-transparent border-0 pb-0">
                <h5 class="card-title my-heading text-green">{{ $comic->judul }}</h5>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent p-0">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}">BacaBersama</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{ $comic->jenis }}</li>
                        <li class="breadcrumb-item active" aria-current="page">{{ $comic->judul }}</li>
                    </ol>
                </nav>
            </div>
            <div class="card-body pt-0">
                <div class="row justify-content-center align-items-center">
                    <div class="col-md-3 px-3 col-12 mb-3">
                        <div class="img-wrapper">
                            <img src="{{ asset('images/'.$comic->imageUrl) }}" alt="{{ $comic->judul }}">
                            <div class="my-rate">
                                <i class="fas fa-star"></i>
                                <span>{{$comic->rating}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-12">
                        <div class="row">
                            <div class="col-6">
                                <p class="text-table">Status : {{ $comic->status == 1 ? "Ongoing":"Tamat" }}</p>
                                <p class="text-table">Dirilis : {{ $comic->rilis }}</p>
                                <p class="text-table">Jenis Komik : {{ $comic->jenis }}</p>
                            </div>
                            <div class="col-6">
                                <p class="text-table">Penulis : {{ $comic->penulis }}</p>
                                <p class="text-table">Usia Pembaca : {{ $comic->usia_pembaca }}</p>
                            </div>
                            <div class="col-12">
                                <h5 class="my-subheading my-3 text-green">
                                    Genre
                                </h5>
                                @foreach ($newGenre as $genre)
                                    <span class="text-table my-block">{{ $genre }}</span>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="content">
    <div class="container">
        <section id="sinopsis">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title my-heading text-green">Sinopsis</h5>
                    <p class="card-text text">{{ strip_tags($comic->deskripsi)  }}</p>
                </div>
            </div>
        </section>

        <section id="related">
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="my-heading text-green">Related Comics</h1>
            </div>
            <div class="scrolling-wrapper-flexbox py-5">
                @foreach($comicsRelated as $comic)
                <div class="col-md-2 col-4 mb-5 pb-3">
                    <div class="position-relative">
                        <div class="card card-featured border-0">
                            <a href="{{ url('comic/'.$comic->id_komik) }}">
                                <img src="{{ asset('images/'.$comic->imageUrl) }}" class="card-img" alt="Shingeki no Kyojin">
                                <div class="rate">
                                    <i class="fas fa-star"></i>
                                    <span>{{$comic->rating}}</span>
                                </div>
                                <div class="card-img-overlay text-center">
                                    <h5 class="card-title  text-white">{{$comic->judul}}</h5>
                                </div>
                            </a>
                            <div class="card-body">
                                <div class="position-relative bg-white">
                                    <div class="my__cardBody bg-white">
                                        <h5 class="card-title text-ellipsis">{{$comic->judul}}</h5>
                                        <p class="card-text text-ellipsis-2 my-text" style="font-size:11px">{{ strip_tags($comic->deskripsi) }}</p>
                                        <a href="{{ url('comic/'.$comic->id_komik) }}" class="btn bg-green text-white" style="font-size: 11px;">Read more</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </section>
    </div>
</section>
@endsection
@push('scripts')
    {{-- <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('sinopsis');
        CKEDITOR.instances["sinopsis"].setData(`<?php echo $comic->deskripsi ?>`);
    </script> --}}
@endpush