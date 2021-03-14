<?php

namespace App\Http\Controllers;

use App\Models\Comic;
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
        $comicsHot = $this->comic_model->getHotestComic();
        $comicsOther = $this->comic_model->getNotHotestComic();

        // cara 2 get data
        // $comics = DB::table('comics')->get();
        // return view('test', compact(["comicsHot", "comicsOther"]));
        return view('pages.landingPage', with(['comicsHots' => $comicsHot, 'comicsOthers' => $comicsOther]));
        // return $comicsHot;
    }
    public function allComic()
    {
        $comics = $this->comic_model->getAllComic();
        return view('pages.allComicPage', compact(['comics']));
        // return $comicsHot;
    }

    public function getDetailComic($id)
    {
        $comic = $this->comic_model->getComicByID($id);
        $comicsRelated = $this->comic_model->getRelatedComic($comic->jenis);
        // return $comicsRelated;
        return view('pages.detailComicPage', compact(['comic', 'comicsRelated']));
    }
}
