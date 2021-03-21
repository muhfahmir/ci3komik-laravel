<?php

use App\Http\Controllers\admin\GenreController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [GenreController::class, 'index'])->name('genre');
Route::get('/create', [GenreController::class, 'create'])->name('genre-create');
Route::post('/store', [GenreController::class, 'store'])->name('genre-store');

Route::get('/delete/${id}', [GenreController::class, 'destroy'])->name('genre-delete');

Route::get('/edit/${id}', [GenreController::class, 'edit'])->name('genre-edit');
Route::post('/update/${id}', [GenreController::class, 'update'])->name('genre-update');
