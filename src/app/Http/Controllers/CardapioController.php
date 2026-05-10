<?php

namespace App\Http\Controllers;

use App\Models\Produto;

class CardapioController extends Controller
{
    public function cardapio()
    {
        // Busca todos os itens do cardápio
        $itens = Produto::all();

        // Envia para a view
        return view('site.cardapio.cardapio', compact('itens'));
    }
}
