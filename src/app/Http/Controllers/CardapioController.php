<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use App\Models\Categoria;
use App\Models\Horario;
use Illuminate\Http\Request;

class CardapioController extends Controller
{
    public function cardapio(Request $request)
    {
        // Busca categorias
        $categorias = Categoria::all();

        // Busca produtos
        $query = Produto::query();

        // Filtrar categoria
        if ($request->categoria) {

            $query->where('id_categoria', $request->categoria);

        }

        $itens = $query->get();

        $horarios = Horario::all();

        return view('site.cardapio.cardapio', compact(
            'itens',
            'categorias',
            'horarios'
        ));
    }
}