<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Produto extends Model
{
    protected $table = 'itens_cardapio';

    protected $primaryKey = 'id_item';

    public $timestamps = false;

    protected $fillable = [
        'nome_item',
        'descricao',
        'preco',
        'id_categoria',
        'disponivel',
        'foto',
    ];

    // Relacionamento:
    // Um produto pertence a uma categoria
    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'id_categoria', 'id_categoria');
    }
}
