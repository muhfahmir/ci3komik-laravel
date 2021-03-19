<?php

use App\Http\Controllers\admin\ComicController;
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

Route::get('/', [ComicController::class, 'index'])->name('comic');
Route::get('/create', [ComicController::class, 'create'])->name('comic-create');
Route::post('/store', [ComicController::class, 'store'])->name('comic-store');
Route::get('/edit/${id}', [ComicController::class, 'edit'])->name('comic-edit');
Route::post('/update/${id}', [ComicController::class, 'update'])->name('comic-update');
Route::get('/delete/${id}', [ComicController::class, 'destroy'])->name('comic-delete');
