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
}
