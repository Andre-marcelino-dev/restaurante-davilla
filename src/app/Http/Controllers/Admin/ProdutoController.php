<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Produto;
use App\Models\Categoria;
use Illuminate\Http\Request; // 👈 estava faltando isso

class ProdutoController extends Controller
{
    public function index()
    {
        $produtos = Produto::with('categoria')->orderBy('nome_item')->get();
        $categorias = Categoria::orderBy('nome_categoria')->get();
        return view('admin.produto.index', compact('produtos', 'categorias'));
    }

    public function store(Request $request)
{
    $request->validate([
        'nome_item'    => 'required|string|max:100',
        'id_categoria' => 'required|integer',
        'descricao'    => 'nullable|string|max:300',
        'preco'        => 'required|numeric|min:0',
        'foto_cardapio'=> 'nullable|image|mimes:png,jpg,jpeg|max:2048',
    ]);

    $nomeArquivo = null;

    if ($request->hasFile('foto_cardapio')) {
        $nomeArquivo = $request->file('foto_cardapio')->getClientOriginalName();
        $request->file('foto_cardapio')->move(public_path('restaurante/cardapio'), $nomeArquivo);
    }

    Produto::create([
        'nome_item'     => $request->nome_item,
        'id_categoria'  => $request->id_categoria,
        'descricao'     => $request->descricao,
        'preco'         => $request->preco,
        'disponivel'    => 1,
        'foto_cardapio' => $nomeArquivo,
    ]);

    return redirect()
        ->route('admin.produtos')
        ->with('success', 'Produto cadastrado com sucesso!');
}

public function update(Request $request, $id)
{
    $request->validate([
        'nome_item'     => 'required|string|max:100',
        'id_categoria'  => 'required|integer',
        'descricao'     => 'nullable|string|max:300',
        'preco'         => 'required|numeric|min:0',
        'foto_cardapio' => 'nullable|image|mimes:png,jpg,jpeg|max:2048',
    ]);

    $produto = Produto::findOrFail($id);

    if ($request->hasFile('foto_cardapio')) {
        $nomeArquivo = $request->file('foto_cardapio')->getClientOriginalName();
        $request->file('foto_cardapio')->move(public_path('restaurante/cardapio'), $nomeArquivo);
        $produto->foto_cardapio = $nomeArquivo;
    }

    $produto->nome_item    = $request->nome_item;
    $produto->id_categoria = $request->id_categoria;
    $produto->descricao    = $request->descricao;
    $produto->preco        = $request->preco;
    $produto->save();

    return redirect()
        ->route('admin.produtos')
        ->with('success', 'Produto atualizado com sucesso!');
}
}