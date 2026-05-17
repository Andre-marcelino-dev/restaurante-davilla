<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\CardapioController;
use App\Http\Controllers\SobreController;



/**ADMIN */

use App\Http\Controllers\Admin\DashController;
use App\Http\Controllers\Admin\CategoriaController;

use Illuminate\Support\Facades\Route;

Route::get('/',[HomeController::class, 'home'])->name('home');
Route::get('/cardapio',[CardapioController::class, 'cardapio'])->name('cardapio');
Route::get('/sobre',[SobreController::class, 'sobre'])->name('sobre');

Route::prefix('admin')->name('admin.')->group(function () {

    Route::get('/', [DashController::class, 'index'])->name('dash');

    Route::get('/categorias', [CategoriaController::class, 'index'])
        ->name('categorias');


});

