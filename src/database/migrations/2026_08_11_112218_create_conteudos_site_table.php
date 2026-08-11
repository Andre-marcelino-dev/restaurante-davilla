<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('conteudos_site', function (Blueprint $table) {
            $table->id();
            $table->string('pagina');
            $table->string('secao');
            $table->string('chave');
            $table->enum('tipo', ['texto', 'imagem'])->default('texto');
            $table->text('valor')->nullable();
            $table->timestamps();

            $table->unique(['pagina', 'secao', 'chave']);
        });

        $agora = now();

        $slides = [
            [
                'secao' => 'banner_slide_1',
                'imagem' => 'restaurante/images/bg/bg-image-4.webp',
                'pretitulo' => 'Servimos comida, harmonia e risos desde 1998',
                'titulo' => 'Deliciosos frutos do mar com a verdadeira essência da alta gastronomia.',
                'botao_primario_texto' => 'Ver mais',
                'botao_secundario_texto' => 'Cardapio de Comida',
            ],
            [
                'secao' => 'banner_slide_2',
                'imagem' => 'restaurante/images/bg/bg-image-5.webp',
                'pretitulo' => 'Servimos comida, harmonia e risos desde 1998',
                'titulo' => 'Sabores frescos do oceano direto para a sua mesa',
                'botao_primario_texto' => 'Mais opções',
                'botao_secundario_texto' => 'Cardapio de Comida',
            ],
            [
                'secao' => 'banner_slide_3',
                'imagem' => 'restaurante/images/bg/bg-image-6.webp',
                'pretitulo' => 'Servimos comida, harmonia e risos desde 1998',
                'titulo' => 'Deliciosos frutos do mar com um toque de sofisticação',
                'botao_primario_texto' => 'Ver mais',
                'botao_secundario_texto' => 'Cardapio de Comida',
            ],
        ];

        $linhas = [];

        foreach ($slides as $slide) {
            $secao = $slide['secao'];

            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'imagem', 'tipo' => 'imagem', 'valor' => $slide['imagem'], 'created_at' => $agora, 'updated_at' => $agora];
            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'pretitulo', 'tipo' => 'texto', 'valor' => $slide['pretitulo'], 'created_at' => $agora, 'updated_at' => $agora];
            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'titulo', 'tipo' => 'texto', 'valor' => $slide['titulo'], 'created_at' => $agora, 'updated_at' => $agora];
            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'botao_primario_texto', 'tipo' => 'texto', 'valor' => $slide['botao_primario_texto'], 'created_at' => $agora, 'updated_at' => $agora];
            $linhas[] = ['pagina' => 'home', 'secao' => $secao, 'chave' => 'botao_secundario_texto', 'tipo' => 'texto', 'valor' => $slide['botao_secundario_texto'], 'created_at' => $agora, 'updated_at' => $agora];
        }

        DB::table('conteudos_site')->insert($linhas);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('conteudos_site');
    }
};
