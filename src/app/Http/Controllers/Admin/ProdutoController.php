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

    public function desativar($id)
    {
        $produto = Produto::findOrFail($id);
        $produto->disponivel = false;
        $produto->save();

        return redirect()
            ->route('admin.produtos')
            ->with('success', 'Produto desativado com sucesso!');
    }

    public function ativar($id)
    {
        $produto = Produto::findOrFail($id);
        $produto->disponivel = true;
        $produto->save();

        return redirect()
            ->route('admin.produtos')
            ->with('success', 'Produto ativado com sucesso!');
    }

    public function destroy($id)
    {
        $produto = Produto::findOrFail($id);

        try {
            $produto->delete();
        } catch (\Illuminate\Database\QueryException $e) {
            return redirect()
                ->route('admin.produtos')
                ->with('error', 'Não é possível excluir "' . $produto->nome_item . '" porque já existem pedidos com este produto. Desative-o em vez de excluir.');
        }

        $this->removerFoto($produto->foto_cardapio);

        return redirect()
            ->route('admin.produtos')
            ->with('success', 'Produto excluído com sucesso!');
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
