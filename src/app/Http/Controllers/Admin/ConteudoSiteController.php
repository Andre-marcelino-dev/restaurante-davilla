<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ConteudoSite;
use Illuminate\Http\Request;

class ConteudoSiteController extends Controller
{
    private const BANNER_DIR = 'restaurante/images/banner';
    private const TOTAL_SLIDES = 3;

    private const BLOG_DIR = 'restaurante/images/blog';
    private const TOTAL_POSTS = 4;

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
        $this->salvarImagemSecao($request, "slides.{$numero}.imagem", $secao, self::BANNER_DIR, 'banner_');
    }

    public function blogEdit()
    {
        $porSecao = ConteudoSite::agruparPorSecao('home', 'blog_');

        $cabecalho = $porSecao->get('blog_cabecalho', collect());

        $posts = [];

        foreach (range(1, self::TOTAL_POSTS) as $numero) {
            $doPost = $porSecao->get("blog_post_{$numero}", collect());

            $posts[$numero] = [
                'imagem' => $doPost->get('imagem'),
                'tag'    => $doPost->get('tag'),
                'titulo' => $doPost->get('titulo'),
            ];
        }

        return view('admin.conteudo.blog', [
            'cabecalho' => [
                'titulo'    => $cabecalho->get('titulo'),
                'subtitulo' => $cabecalho->get('subtitulo'),
            ],
            'posts' => $posts,
        ]);
    }

    public function blogUpdate(Request $request)
    {
        $data = $request->validate([
            'cabecalho.titulo'      => 'required|string|max:100',
            'cabecalho.subtitulo'   => 'required|string|max:255',
            'posts'                 => 'required|array',
            'posts.*.tag'           => 'required|string|max:50',
            'posts.*.titulo'        => 'required|string|max:150',
            'posts.*.imagem'        => 'nullable|image|mimes:jpg,jpeg,png,webp|max:20480',
        ]);

        foreach (['titulo', 'subtitulo'] as $chave) {
            ConteudoSite::updateOrCreate(
                ['pagina' => 'home', 'secao' => 'blog_cabecalho', 'chave' => $chave],
                ['tipo' => 'texto', 'valor' => $data['cabecalho'][$chave]]
            );
        }

        foreach ($data['posts'] as $numero => $campos) {
            $secao = "blog_post_{$numero}";

            foreach (['tag', 'titulo'] as $chave) {
                ConteudoSite::updateOrCreate(
                    ['pagina' => 'home', 'secao' => $secao, 'chave' => $chave],
                    ['tipo' => 'texto', 'valor' => $campos[$chave]]
                );
            }

            if ($request->hasFile("posts.{$numero}.imagem")) {
                $this->salvarImagemSecao($request, "posts.{$numero}.imagem", $secao, self::BLOG_DIR, 'blog_');
            }
        }

        return redirect()
            ->route('admin.conteudo.blog')
            ->with('success', 'Blog atualizado com sucesso!');
    }

    private function salvarImagemSecao(Request $request, string $campoArquivo, string $secao, string $diretorio, string $prefixoArquivo): void
    {
        $arquivo = $request->file($campoArquivo);
        $nomeArquivo = uniqid($prefixoArquivo) . '.' . $arquivo->extension();
        $arquivo->move(public_path($diretorio), $nomeArquivo);

        $registro = ConteudoSite::firstOrNew(['pagina' => 'home', 'secao' => $secao, 'chave' => 'imagem']);

        $this->removerImagemAntiga($registro->valor, $diretorio);

        $registro->tipo = 'imagem';
        $registro->valor = $diretorio . '/' . $nomeArquivo;
        $registro->save();
    }

    private function removerImagemAntiga(?string $caminho, string $diretorio): void
    {
        if (!$caminho || !str_starts_with($caminho, $diretorio . '/')) {
            return;
        }

        $caminhoCompleto = public_path($caminho);

        if (file_exists($caminhoCompleto)) {
            unlink($caminhoCompleto);
        }
    }
}
