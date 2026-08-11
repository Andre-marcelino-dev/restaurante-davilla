<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $agora = now();

        $posts = [
            [
                'secao' => 'blog_post_1',
                'imagem' => 'restaurante/images/blog/blog-01.jpg',
                'tag' => 'Fast Food',
                'titulo' => 'Love and food: It is all about dinenos restaurant',
            ],
            [
                'secao' => 'blog_post_2',
                'imagem' => 'restaurante/images/blog/blog-03.jpg',
                'tag' => 'Dinner',
                'titulo' => 'Enjoy an exceptional journey of taste of joy.',
            ],
            [
                'secao' => 'blog_post_3',
                'imagem' => 'restaurante/images/blog/blog-04.jpg',
                'tag' => 'Restaurant',
                'titulo' => 'The opportunity to work abroad is a prospect, one',
            ],
            [
                'secao' => 'blog_post_4',
                'imagem' => 'restaurante/images/blog/blog-02.jpg',
                'tag' => 'Rice curry',
                'titulo' => 'Food is the foundation of true happiness',
            ],
        ];

        $linhas = [
            ['pagina' => 'home', 'secao' => 'blog_cabecalho', 'chave' => 'titulo', 'tipo' => 'texto', 'valor' => 'Blog & Insights', 'created_at' => $agora, 'updated_at' => $agora],
            ['pagina' => 'home', 'secao' => 'blog_cabecalho', 'chave' => 'subtitulo', 'tipo' => 'texto', 'valor' => 'É a história de um caso de amor eterno, Dieter Delicioz e o Oceano Atlântico no ar livre.', 'created_at' => $agora, 'updated_at' => $agora],
        ];

        foreach ($posts as $post) {
            $secao = $post['secao'];

            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'imagem', 'tipo' => 'imagem', 'valor' => $post['imagem'], 'created_at' => $agora, 'updated_at' => $agora];
            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'tag', 'tipo' => 'texto', 'valor' => $post['tag'], 'created_at' => $agora, 'updated_at' => $agora];
            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'titulo', 'tipo' => 'texto', 'valor' => $post['titulo'], 'created_at' => $agora, 'updated_at' => $agora];
        }

        DB::table('conteudos_site')->insert($linhas);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::table('conteudos_site')
            ->where('pagina', 'home')
            ->where(function ($query) {
                $query->where('secao', 'blog_cabecalho')
                    ->orWhere('secao', 'like', 'blog_post_%');
            })
            ->delete();
    }
};
