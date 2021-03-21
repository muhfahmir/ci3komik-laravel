<?php

namespace App\Http\Controllers;

use App\Models\Comic;
use App\Models\DetailComic;
use App\Models\Genre;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ComicController extends Controller
{
    //
    protected $comic_model;

    public function __construct()
    {
        $this->comic_model = new Comic();
    }

    public function index()
    {
        // cara 1 get data
        $comicsHot = DB::table('comics')
        ->orderBy('rating', 'desc')
        ->limit(4)
        ->get();
        $comicsOther = DB::table('comics')
        ->orderBy('rating', 'desc')
        ->offset(5)
        ->limit(12)
        ->get();

        // cara 2 get data
        // $comics = DB::table('comics')->get();
        // return view('test', compact(["comicsHot", "comicsOther"]));
        return view('pages.landingPage', with(['comicsHots' => $comicsHot, 'comicsOthers' => $comicsOther]));
        // return $comicsHot;
    }
    public function allComic()
    {
        $comics = DB::table('comics')
        ->orderBy('rating', 'desc')
        ->paginate(12);
        return view('pages.allComicPage', compact(['comics']));
        // return $comicsHot;
    }

    public function getDetailComic($id)
    {
        $comic = DB::table('comics')
        ->where('id_komik', $id)
        ->first();
        $genreComic =  DB::table('detail_comic')->where('id_comic',$id)->get();
        $genre = Genre::all();
        $newGenre = [];
        foreach ($genreComic as $gc) {
            foreach ($genre as $g ) {
                if($g->id_genre == $gc->id_genre){
                    $newGenre [] = $g->nama_genre;
                }
            }
        }
        $comicsRelated = DB::table('comics')
        ->orderBy('rating', 'desc')
        ->where('jenis', $comic->jenis)
        ->limit(10)
        ->get();
        return view('pages.detailComicPage', compact(['comic', 'comicsRelated','newGenre']));
    }
}
