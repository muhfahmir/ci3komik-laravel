@extends('layouts/skeleton')

@section('title', 'Home')

@section('app')
@include('partials.navbar')
<section id="banner">
    <div class="container">
        <h1 class="my-heading text-green">Hot Comics</h1>
        <div class="row">
            @foreach($comicsHots as $comic)
            <div class="col-md-3 col-6 mb-3">
                <a class="card bg-dark card-featured card-gradient" href="{{ url('comic/'.$comic->id_komik) }}">
                    <img src="{{ asset('images/'.$comic->imageUrl) }}" class="card-img" alt="Shingeki no Kyojin">
                    <div class="card-img-overlay text-center">
                        <h5 class="card-title  text-white">{{$comic->judul}}</h5>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section>

<section id="content">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="my-heading text-green">All Comics</h1>
            <a href="{{ url('all-comic') }}" style="font-size: large;">See More</a>
        </div>
        <div class="row">
            @foreach($comicsOthers as $comic)
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
    </div>
</section>
@endsection