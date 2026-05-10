<?php

use Illuminate\Support\Facades\Route;
use App\http\Controllers\GuruController;

Route::resource('guru', GuruController::class);

Route::get('/',[GuruController::class, 'index']);

Route::get('/tambah',[GuruController::class, 'create']);
