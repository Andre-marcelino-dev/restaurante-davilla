<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Categoria;
use Illuminate\Http\Request;

class CategoriaController extends Controller
{
    public function index()
    {
        $categorias = Categoria::orderBy('nome_categoria')->get();
        return view('admin.categoria.index', compact('categorias'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nome_categoria' => 'required|string|max:50',
            'descricao'      => 'nullable|string|max:200',
        ]);

        Categoria::create([
            'nome_categoria'   => $request->nome_categoria,
            'descricao'        => $request->descricao,
            'status_categoria' => 'ATIVO', // Já cria como ativo por padrão
        ]);

        return redirect()
            ->route('admin.categorias')
            ->with('success', 'Categoria cadastrada com sucesso!');
    }

    public function update(Request $request, $id)
    {
        $categoria = Categoria::findOrFail($id);

        $request->validate([
            'nome_categoria' => 'required|string|max:50',
            'descricao'      => 'nullable|string|max:200',
        ]);

        $categoria->update([
            'nome_categoria' => $request->nome_categoria,
            'descricao'      => $request->descricao,
        ]);

        return redirect()
            ->route('admin.categorias')
            ->with('success', 'Categoria atualizada com sucesso!');
    }

    // 🔴 ADICIONADO: Função para desativar (Resolve o erro do seu print!)
    public function desativar($id)
    {
        $categoria = Categoria::findOrFail($id);
        $categoria->status_categoria = 'INATIVO';
        $categoria->save();

        return redirect()
            ->route('admin.categorias')
            ->with('success', 'Categoria desativada com sucesso!');
    }

    // 🔴 ADICIONADO: Função para ativar
    public function ativar($id)
    {
        $categoria = Categoria::findOrFail($id);
        $categoria->status_categoria = 'ATIVO';
        $categoria->save();

        return redirect()
            ->route('admin.categorias')
            ->with('success', 'Categoria ativada com sucesso!');
    }
}