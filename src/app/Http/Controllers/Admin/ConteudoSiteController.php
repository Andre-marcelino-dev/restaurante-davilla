<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ConteudoSite;
use Illuminate\Http\Request;

class ConteudoSiteController extends Controller
{
    private const BANNER_DIR = 'restaurante/images/banner';
    private const TOTAL_SLIDES = 3;

    public function bannerEdit()
    {
        $porSecao = ConteudoSite::agruparPorSecao('home', 'banner_slide_');

        $slides = [];

        foreach (range(1, self::TOTAL_SLIDES) as $numero) {
            $doSlide = $porSecao->get("banner_slide_{$numero}", collect());

            $slides[$numero] = [
                'imagem'                 => $doSlide->get('imagem'),
                'pretitulo'               => $doSlide->get('pretitulo'),
                'titulo'                  => $doSlide->get('titulo'),
                'botao_primario_texto'    => $doSlide->get('botao_primario_texto'),
                'botao_secundario_texto'  => $doSlide->get('botao_secundario_texto'),
            ];
        }

        return view('admin.conteudo.banner', compact('slides'));
    }

    public function bannerUpdate(Request $request)
    {
        $data = $request->validate([
            'slides'                              => 'required|array',
            'slides.*.pretitulo'                  => 'required|string|max:150',
            'slides.*.titulo'                      => 'required|string|max:255',
            'slides.*.botao_primario_texto'        => 'required|string|max:50',
            'slides.*.botao_secundario_texto'      => 'required|string|max:50',
            'slides.*.imagem'                      => 'nullable|image|mimes:jpg,jpeg,png,webp|max:20480',
        ]);

        foreach ($data['slides'] as $numero => $campos) {
            $secao = "banner_slide_{$numero}";

            foreach (['pretitulo', 'titulo', 'botao_primario_texto', 'botao_secundario_texto'] as $chave) {
                ConteudoSite::updateOrCreate(
                    ['pagina' => 'home', 'secao' => $secao, 'chave' => $chave],
                    ['tipo' => 'texto', 'valor' => $campos[$chave]]
                );
            }

            if ($request->hasFile("slides.{$numero}.imagem")) {
                $this->salvarImagemSlide($request, $numero, $secao);
            }
        }

        return redirect()
            ->route('admin.conteudo.banner')
            ->with('success', 'Banner atualizado com sucesso!');
    }

    private function salvarImagemSlide(Request $request, int $numero, string $secao): void
    {
        $arquivo = $request->file("slides.{$numero}.imagem");
        $nomeArquivo = uniqid('banner_') . '.' . $arquivo->extension();
        $arquivo->move(public_path(self::BANNER_DIR), $nomeArquivo);

        $registro = ConteudoSite::firstOrNew(['pagina' => 'home', 'secao' => $secao, 'chave' => 'imagem']);

        $this->removerImagemAntiga($registro->valor);

        $registro->tipo = 'imagem';
        $registro->valor = self::BANNER_DIR . '/' . $nomeArquivo;
        $registro->save();
    }

    private function removerImagemAntiga(?string $caminho): void
    {
        if (!$caminho || !str_starts_with($caminho, self::BANNER_DIR . '/')) {
            return;
        }

        $caminhoCompleto = public_path($caminho);

        if (file_exists($caminhoCompleto)) {
            unlink($caminhoCompleto);
        }
    }
}
