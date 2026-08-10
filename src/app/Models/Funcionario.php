<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Funcionario extends Model
{
    protected $table = 'funcionarios';

    protected $primaryKey = 'id_funcionario';

    public $timestamps = false;

    protected $fillable = [
        'nome',
        'cargo',
        'telefone',
        'data_contratacao',
        'status',
    ];
}
