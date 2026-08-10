<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Funcionario;
use Illuminate\Http\Request;

class FuncionarioController extends Controller
{
    public function index()
    {
        $funcionarios = Funcionario::orderBy('nome')->get();

        return view('admin.funcionario.index', compact('funcionarios'));
    }

    public function store(Request $request)
    {
        $data = $this->validarFuncionario($request);
        $data['status'] = 'ATIVO';

        Funcionario::create($data);

        return redirect()
            ->route('admin.funcionarios')
            ->with('success', 'Funcionário cadastrado com sucesso!');
    }

    public function update(Request $request, $id)
    {
        $funcionario = Funcionario::findOrFail($id);

        $funcionario->update($this->validarFuncionario($request));

        return redirect()
            ->route('admin.funcionarios')
            ->with('success', 'Funcionário atualizado com sucesso!');
    }

    public function desativar($id)
    {
        $funcionario = Funcionario::findOrFail($id);
        $funcionario->status = 'INATIVO';
        $funcionario->save();

        return redirect()
            ->route('admin.funcionarios')
            ->with('success', 'Funcionário inativado com sucesso!');
    }

    public function ativar($id)
    {
        $funcionario = Funcionario::findOrFail($id);
        $funcionario->status = 'ATIVO';
        $funcionario->save();

        return redirect()
            ->route('admin.funcionarios')
            ->with('success', 'Funcionário ativado com sucesso!');
    }

    private function validarFuncionario(Request $request): array
    {
        return $request->validate([
            'nome'              => 'required|string|max:100',
            'cargo'             => 'required|string|max:50',
            'telefone'          => 'nullable|string|max:20',
            'data_contratacao'  => 'required|date',
        ]);
    }
}
