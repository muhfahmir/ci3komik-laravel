<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Comic;
use App\Models\DetailComic;
use App\Models\Genre;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ComicController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $user;
    public function __construct(Auth $user)
    {
        if(!Auth::check()) 
        {
            return redirect()->route('login');
        }
    }

    public function index()
    {
        $comics = Comic::all();
        // return $comics;
        return view('pages.admin.comic.comicPage', compact(['comics']));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $genres = Genre::all();
        return view('pages.admin.comic.create',compact(['genres']));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $rules = [
            'judul'=> "required",
            'jenis'=> "required",
            'penulis'=> "required",
            'deskripsi'=> "required",
            'status'=> "required",
            'rilis'=> "required",
            'usia_pembaca'=> "required",
            'image'=> "required|file",
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return "Failed";
            return redirect('comic/create')
                ->withErrors($validator)
                ->withInput();
        }
        

        // Create image
        $originalImage = $request->file('image');
        $nameImage = uniqid().Str::slug($request->judul).'.jpg';
        $pathImage = base_path().'/public/images/';
        // end create
        if($request->status_komik == 1){
            $is_active = 1;
        }else{
            $is_active = 0;
        }
        $comic = Comic::create([
            "judul" => $request->judul,
            "jenis" => $request->jenis,
            "penulis" => $request->penulis,
            "deskripsi" => $request->deskripsi,
            "status" => (int) $request->status,
            "rilis" => (int) $request->rilis,
            "usia_pembaca" => $request->usia_pembaca,
            "rating" => (float) $request->rating,
            "imageUrl" => $nameImage,
            "is_active" => $is_active,
        ]);
        $request->image->move($pathImage, $nameImage);
        $genres = $request->genre;
        
        foreach ($genres as $genre ) {
            DB::beginTransaction();
            $comicDetail = new DetailComic();
            $comicDetail->id_comic = $comic->id_komik;
            $comicDetail->id_genre = (int)$genre;
            $comicDetail->save();
            DB::commit();
        }

        // $comic = new Comic();
        // $comic->judul = $request->judul;
        // $comic->jenis = $request->jenis;
        // $comic->penulis = $request->penulis;
        // $comic->deskripsi = $request->deskripsi;
        // $comic->status = $request->status;
        // $comic->rilis = $request->rilis;
        // $comic->usia_pembaca = $request->usia_pembaca;
        // $comic->rating = $request->rating;
        // $comic->imageUrl = $nameImage;
        // $comic->is_active = $request->status_komik || 0 ;
        // $comic->save();
        // DB::commit();
        return redirect()->route('comic')->with('status', "Berhasil menambahkan Comic");
        
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $comic = Comic::find($id);
        $genres = Genre::all();
        $status = DB::table('status_comic')
                    ->get();
        $detailGenre = DB::table('detail_comic')
                            ->where('id_comic',$id)
                            ->get();
        return view('pages.admin.comic.edit',compact('comic','genres','status','detailGenre'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $rules = [
            'judul'=> "required",
            'jenis'=> "required",
            'penulis'=> "required",
            'deskripsi'=> "required",
            'status'=> "required",
            'rilis'=> "required",
            'usia_pembaca'=> "required",
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return "Failed";
            return redirect('comic/edit')
                ->withErrors($validator)
                ->withInput();
        }
        $pathImage = base_path().'/public/images/';
        

        // Create image
        $originalImage = $request->file('image');
        $comicku = Comic::find($id);
        if ($request->file('image') != null) {
            $imageOld = $comicku->imageUrl;
            unlink($pathImage.$imageOld);
            $nameImage = uniqid() . '-' . Str::slug($request->judul) . '.jpg';
            $request->image->move($pathImage, $nameImage);
        }
        // 1 trouble kalo semisal tidak ganti gambar dan semisal gambar dihapus

        if ($request->image == null) {
            // unlink($pathImage.$comicku->imageUrl);
            $nameImage = $comicku->imageUrl;
        }
        
        // end create
        if($request->status_komik == 1){
            $is_active = 1;
        }else{
            $is_active = 0;
        }
        
        $comic = DB::table('comics')
                ->where('id_komik',$id)
                ->update(
                    [
                        "judul" => $request->judul,
                        "jenis" => $request->jenis,
                        "penulis" => $request->penulis,
                        "deskripsi" => $request->deskripsi,
                        "status" => (int) $request->status,
                        "rilis" => (int) $request->rilis,
                        "usia_pembaca" => $request->usia_pembaca,
                        "rating" => (float) $request->rating,
                        "imageUrl" => $nameImage,
                        "is_active" => $is_active,
                    ]
                    );
        
        DB::table('detail_comic')
                    ->where('id_comic',$id)
                    ->delete();
        $genres = $request->genre;
        
        foreach ($genres as $genre ) {
            DB::beginTransaction();
            $comicDetail = new DetailComic();
            $comicDetail->id_comic = $id;
            $comicDetail->id_genre = (int)$genre;
            $comicDetail->save();
            DB::commit();
        }

        // $comic = new Comic();
        // $comic->judul = $request->judul;
        // $comic->jenis = $request->jenis;
        // $comic->penulis = $request->penulis;
        // $comic->deskripsi = $request->deskripsi;
        // $comic->status = $request->status;
        // $comic->rilis = $request->rilis;
        // $comic->usia_pembaca = $request->usia_pembaca;
        // $comic->rating = $request->rating;
        // $comic->imageUrl = $nameImage;
        // $comic->is_active = $request->status_komik || 0 ;
        // $comic->save();
        // DB::commit();
        return redirect()->route('comic')->with('status', "Berhasil mengedit Comic");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $comic = Comic::find($id);
        $pathImage = base_path().'/public/images/';
        unlink($pathImage.$comic->imageUrl);
        $comic->delete();
        $detailComic = DB::table('detail_comic')
                        ->where('id_comic',$id)
                        ->delete();
        return redirect()->route('comic')->with('status',"Berhasil menghapus Comic");
    }
}
