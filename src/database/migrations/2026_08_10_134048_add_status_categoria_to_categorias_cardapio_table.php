<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasColumn('categorias_cardapio', 'status_categoria')) {
            Schema::table('categorias_cardapio', function (Blueprint $table) {
                $table->string('status_categoria', 10)->default('ATIVO')->after('descricao');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('categorias_cardapio', 'status_categoria')) {
            Schema::table('categorias_cardapio', function (Blueprint $table) {
                $table->dropColumn('status_categoria');
            });
        }
    }
};
