@extends('layouts.skeleton')
@section('title', 'All Komik')
@section('app')
@include('partials.navbar')
<section id="content">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="my-heading text-green">All Comics</h1>
        </div>
        <div class="row">
            @foreach($comics as $comic)
            <div class="col-md-2 col-4 mb-5">
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
        <div class="d-flex justify-content-center" style="margin-top: 50px;">
            {{ $comics->links() }}
        </div>
    </div>
</section>
@endsection