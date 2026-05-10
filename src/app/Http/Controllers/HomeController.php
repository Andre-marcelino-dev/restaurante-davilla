<?php

namespace App\Http\Controllers;

use App\Models\Produto;

class HomeController extends Controller
{
    public function home()
    {
        // Busca produtos do cardápio
        $itens = Produto::all();

        // Envia para a home
        return view('site.home.home', compact('itens'));
    }
}
