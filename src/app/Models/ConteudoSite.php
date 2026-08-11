<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ConteudoSite extends Model
{
    protected $table = 'conteudos_site';

    protected $fillable = [
        'pagina',
        'secao',
        'chave',
        'tipo',
        'valor',
    ];

    /**
     * Agrupa os registros de uma página em coleções chave => valor por seção,
     * para seções cujo nome comece com o prefixo informado (ex.: 'banner_slide_').
     */
    public static function agruparPorSecao(string $pagina, string $prefixoSecao): \Illuminate\Support\Collection
    {
        return static::where('pagina', $pagina)
            ->where('secao', 'like', "{$prefixoSecao}%")
            ->get()
            ->groupBy('secao')
            ->map(fn ($linhas) => $linhas->pluck('valor', 'chave'));
    }
}
