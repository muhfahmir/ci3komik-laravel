<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetailComic extends Model
{
    use HasFactory;
    protected $table = "detail_comic";
    protected $primaryKey = "id_detail";
    protected $fillable = [
        'id_comic','id_genre'
    ];
}
