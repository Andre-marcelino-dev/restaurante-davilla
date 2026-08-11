<?php

namespace App\Http\Controllers;

use App\Models\Produto;
use App\Models\Horario;
use App\Models\ConteudoSite;

class HomeController extends Controller
{
    public function home()
    {
        // Busca produtos
        $itens = Produto::all();

        // Busca horários
        $horarios = Horario::all();

        // Busca os textos/imagens do banner cadastrados no admin
        $bannerSlides = ConteudoSite::agruparPorSecao('home', 'banner_slide_');

        // Busca os textos/imagens do blog cadastrados no admin
        $blogConteudo = ConteudoSite::agruparPorSecao('home', 'blog_');

        // Envia para view
        return view('site.home.home', compact('itens', 'horarios', 'bannerSlides', 'blogConteudo'));
    }
}
