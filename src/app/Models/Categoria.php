<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    protected $table = 'categorias_cardapio';

    protected $primaryKey = 'id_categoria';

    public $timestamps = false;

    protected $fillable = [
        'nome_categoria',
        'descricao',
        'status_categoria',
     
    ];

    // Relacionamento:
    // Uma categoria possui vários produtos
    public function itens()
    {
        return $this->hasMany(Produto::class, 'id_categoria');
    }
}
