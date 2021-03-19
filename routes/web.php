<?php

use App\Http\Controllers\comicController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\LoginInvokeController;
use App\Http\Controllers\RegistrationController;
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

Route::get('/', [ComicController::class, 'index']);
Route::get('/all-comic', [ComicController::class, 'allComic']);
Route::get('comic/{id}', [ComicController::class, 'getDetailComic'])->whereNumber('id');

Route::get('/login', [LoginController::class, 'index'])->name('login');
Route::post('/login', [LoginController::class, 'store']);
// Route::post('/login', LoginInvokeController::class);

Route::get('/register', [RegistrationController::class, 'index']);
Route::post('/register', [RegistrationController::class, 'store']);
