<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\CardapioController;
use App\Http\Controllers\SobreController;

/**ADMIN */
use App\Http\Controllers\Admin\ProdutoController;
use App\Http\Controllers\Admin\DashController;
use App\Http\Controllers\Admin\CategoriaController;
use App\Http\Controllers\Admin\FuncionarioController;
use App\Http\Controllers\Admin\ConteudoSiteController;

use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'home'])->name('home');
Route::get('/cardapio', [CardapioController::class, 'cardapio'])->name('cardapio');
Route::get('/sobre', [SobreController::class, 'sobre'])->name('sobre');

Route::prefix('admin')->name('admin.')->group(function () {

    Route::get('/', [DashController::class, 'index'])->name('dash');

    Route::get('/categorias', [CategoriaController::class, 'index'])->name('categorias');
    Route::post('/categorias', [CategoriaController::class, 'store'])->name('categoria.store');
    Route::put('/categorias/{id}', [CategoriaController::class, 'update'])->name('categorias.update');
    Route::patch('/categorias/{id}/desativar', [CategoriaController::class, 'desativar'])->name('categorias.desativar');
    Route::patch('/categorias/{id}/ativar', [CategoriaController::class, 'ativar'])->name('categorias.ativar');
    Route::patch('/categorias/{id}/toggle', [CategoriaController::class, 'toggle'])->name('categorias.toggle');

    Route::get('/produtos', [ProdutoController::class, 'index'])->name('produtos');
    Route::post('/produtos', [ProdutoController::class, 'store'])->name('produtos.store');
    Route::put('/produtos/{id}', [ProdutoController::class, 'update'])->name('produtos.update');
    Route::patch('/produtos/{id}/desativar', [ProdutoController::class, 'desativar'])->name('produtos.desativar');
    Route::patch('/produtos/{id}/ativar', [ProdutoController::class, 'ativar'])->name('produtos.ativar');
    Route::delete('/produtos/{id}', [ProdutoController::class, 'destroy'])->name('produtos.destroy');

    Route::get('/funcionarios', [FuncionarioController::class, 'index'])->name('funcionarios');
    Route::post('/funcionarios', [FuncionarioController::class, 'store'])->name('funcionarios.store');
    Route::put('/funcionarios/{id}', [FuncionarioController::class, 'update'])->name('funcionarios.update');
    Route::patch('/funcionarios/{id}/desativar', [FuncionarioController::class, 'desativar'])->name('funcionarios.desativar');
    Route::patch('/funcionarios/{id}/ativar', [FuncionarioController::class, 'ativar'])->name('funcionarios.ativar');

    Route::prefix('conteudo')->name('conteudo.')->group(function () {
        Route::get('/banner', [ConteudoSiteController::class, 'bannerEdit'])->name('banner');
        Route::put('/banner', [ConteudoSiteController::class, 'bannerUpdate'])->name('banner.update');

        Route::get('/blog', [ConteudoSiteController::class, 'blogEdit'])->name('blog');
        Route::put('/blog', [ConteudoSiteController::class, 'blogUpdate'])->name('blog.update');

        Route::get('/sobre', [ConteudoSiteController::class, 'sobreEdit'])->name('sobre');
        Route::put('/sobre', [ConteudoSiteController::class, 'sobreUpdate'])->name('sobre.update');
    });

});
