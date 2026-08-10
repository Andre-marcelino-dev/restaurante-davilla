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
        if (!Schema::hasColumn('funcionarios', 'status')) {
            Schema::table('funcionarios', function (Blueprint $table) {
                $table->string('status', 10)->default('ATIVO')->after('data_contratacao');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('funcionarios', 'status')) {
            Schema::table('funcionarios', function (Blueprint $table) {
                $table->dropColumn('status');
            });
        }
    }
};
