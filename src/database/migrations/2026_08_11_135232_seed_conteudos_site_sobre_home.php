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

        $linhas = [
            ['pagina' => 'home', 'secao' => 'sobre_home', 'chave' => 'imagem_1', 'tipo' => 'imagem', 'valor' => 'restaurante/images/about/about7.jpg', 'created_at' => $agora, 'updated_at' => $agora],
            ['pagina' => 'home', 'secao' => 'sobre_home', 'chave' => 'imagem_2', 'tipo' => 'imagem', 'valor' => 'restaurante/images/about/about8.jpg', 'created_at' => $agora, 'updated_at' => $agora],
            ['pagina' => 'home', 'secao' => 'sobre_home', 'chave' => 'titulo', 'tipo' => 'texto', 'valor' => "Bem-vindo ao Nosso\nRestaurante de Luxo", 'created_at' => $agora, 'updated_at' => $agora],
            ['pagina' => 'home', 'secao' => 'sobre_home', 'chave' => 'descricao', 'tipo' => 'texto', 'valor' => 'É a história de um caso de amor eterno, Dieter Delicioz e o Oceano Atlântico. Nossa proximidade com as riquezas abundantes do mar e a excelente produção de Portugal.', 'created_at' => $agora, 'updated_at' => $agora],
            ['pagina' => 'home', 'secao' => 'sobre_home', 'chave' => 'contador_numero', 'tipo' => 'texto', 'valor' => '30', 'created_at' => $agora, 'updated_at' => $agora],
            ['pagina' => 'home', 'secao' => 'sobre_home', 'chave' => 'contador_texto', 'tipo' => 'texto', 'valor' => 'Anos de Experiência', 'created_at' => $agora, 'updated_at' => $agora],
            ['pagina' => 'home', 'secao' => 'sobre_home', 'chave' => 'botao_texto', 'tipo' => 'texto', 'valor' => 'Mais Comidas', 'created_at' => $agora, 'updated_at' => $agora],
        ];

        DB::table('conteudos_site')->insert($linhas);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::table('conteudos_site')
            ->where('pagina', 'home')
            ->where('secao', 'sobre_home')
            ->delete();
    }
};
