<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Categoria;
use App\Models\Produto;
use Illuminate\Http\Request;

class ProdutoController extends Controller
{
    private const FOTO_DIR = 'restaurante/images/cardapio';

    public function index()
    {
        $produtos = Produto::with('categoria')->orderBy('nome_item')->get();
        $categorias = Categoria::orderBy('nome_categoria')->get();

        return view('admin.produto.index', compact('produtos', 'categorias'));
    }

    public function store(Request $request)
    {
        $data = $this->validarProduto($request);

        if ($request->hasFile('foto_cardapio')) {
            $data['foto_cardapio'] = $this->salvarFoto($request);
        }

        $data['disponivel'] = $request->boolean('disponivel');

        Produto::create($data);

        return redirect()
            ->route('admin.produtos')
            ->with('success', 'Produto cadastrado com sucesso!');
    }

    public function update(Request $request, $id)
    {
        $produto = Produto::findOrFail($id);

        $data = $this->validarProduto($request);

        if ($request->hasFile('foto_cardapio')) {
            $this->removerFoto($produto->foto_cardapio);
            $data['foto_cardapio'] = $this->salvarFoto($request);
        }

        $data['disponivel'] = $request->boolean('disponivel');

        $produto->update($data);

        return redirect()
            ->route('admin.produtos')
            ->with('success', 'Produto atualizado com sucesso!');
    }

    private function validarProduto(Request $request): array
    {
        return $request->validate([
            'nome_item'    => 'required|string|max:100',
            'descricao'    => 'nullable|string',
            'preco'        => 'required|numeric|min:0',
            'id_categoria' => 'required|exists:categorias_cardapio,id_categoria',
            'foto_cardapio' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:20480',
        ]);
    }

    private function salvarFoto(Request $request): string
    {
        $arquivo = $request->file('foto_cardapio');
        $nomeArquivo = uniqid('produto_') . '.' . $arquivo->extension();

        $arquivo->move(public_path(self::FOTO_DIR), $nomeArquivo);

        return $nomeArquivo;
    }

    private function removerFoto(?string $foto): void
    {
        if (!$foto) {
            return;
        }

        $caminho = public_path(self::FOTO_DIR . '/' . $foto);

        if (file_exists($caminho)) {
            unlink($caminho);
        }
    }
}
