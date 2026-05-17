<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Categoria;

class CategoriaController extends Controller
{
    public function index()
    {
      $categorias = Categoria::orderBy('nome_categoria')->get();

    //  dd($categorias);

        return view('admin.categoria.index', compact('categorias'));
    }
}
