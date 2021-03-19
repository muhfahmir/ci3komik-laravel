<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Comic extends Model
{
    use HasFactory;
    protected $table = "comics";
    protected $primaryKey = "id_komik";
    protected $fillable = [
        'judul','jenis','penulis','deskripsi','status','rilis','usia_pembaca','imageUrl','is_active'
    ];
    public function getAllComic()
    {
        $comics = DB::table('comics')
            ->orderBy('rating', 'desc')
            ->paginate(12);
        return $comics;
    }

    public function getRelatedComic($type)
    {
        $comics = DB::table('comics')
            ->orderBy('rating', 'desc')
            ->where('jenis', $type)
            ->limit(10)
            ->get();
        return $comics;
    }

    public function getHotestComic()
    {
        $comics = DB::table('comics')
            ->orderBy('rating', 'desc')
            ->limit(4)
            ->get();
        return $comics;
    }

    public function getNotHotestComic()
    {
        $comics = DB::table('comics')
            ->orderBy('rating', 'desc')
            ->offset(5)
            ->limit(12)
            ->get();
        return $comics;
    }

    public function getComicByID($id)
    {
        $comics = DB::table('comics')
            ->where('id_komik', $id)
            ->first();
        return $comics;
    }
}
