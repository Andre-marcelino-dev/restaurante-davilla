<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Produto extends Model
{
    protected $table = 'itens_cardapio';
    protected $primaryKey = 'id_item';
    public $timestamps = false; // 👈 adicione isso

    protected $fillable = [
        'id_categoria',
        'nome_item',
        'descricao',
        'preco',
        'disponivel',
        'foto_cardapio',
    ];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'id_categoria', 'id_categoria');
    }
}
