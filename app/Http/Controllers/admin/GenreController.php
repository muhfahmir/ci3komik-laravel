<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Genre;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class GenreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    protected $user;
    public function __construct()
    {
        if(!Auth::check()) 
        {
            return redirect()->route('login');
        }
    }
    public function index()
    {
        // $genres = DB::table('genre')->get();
        $genres = Genre::all();
        return view('pages.admin.genre.genrePage', compact(['genres']));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('pages.admin.genre.createPage');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        try {
            $validator = Validator::make($request->all(), [
                "name"=>"required"
            ]);
    
            if($validator->fails()){
                return redirect('insert')
                    ->withInput()
                    ->withErrors($validator);
            }
    
            $genre = Genre::create([
                'nama_genre' => $request->name,
            ]);
            // kasih pengembalian session_flash pada create biasa
            return redirect()->route('genre')->with('status',"Berhasil menambahkan Genre");
        } catch (Exception $e) {
            return $e->getMessage();
        }
       
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
        return $id;
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
        return $id;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $genre = Genre::find($id);
            $genre->delete();
            return redirect()->route('genre')->with('status',"Berhasil menghapus Genre");
        }catch (Exception $e) {
            return $e->getMessage();
        }
        
    }
}
