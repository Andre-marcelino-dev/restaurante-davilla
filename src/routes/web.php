<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\CardapioController;
use App\Http\Controllers\SobreController;
use Illuminate\Support\Facades\Route;

Route::get('/',[HomeController::class, 'home'])->name('home');
Route::get('/cardapio',[CardapioController::class, 'cardapio'])->name('cardapio');
Route::get('/sobre',[SobreController::class, 'sobre'])->name('sobre');
