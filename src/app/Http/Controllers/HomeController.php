<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use App\Models\Horario;

class HomeController extends Controller
{
    public function home()
    {
        // Busca produtos
        $itens = Produto::all();

        // Busca horários
        $horarios = Horario::all();

        // Envia para view
        return view('site.home.home', compact('itens', 'horarios'));
    }
}
