@extends('layout.admin')

@section('title', 'Funcionários | Confeitaria Dashboard')

@section('pg-titulo', 'Funcionários')

@section('link-topo', 'Funcionários')

@section('content')

    <div class="app-content">
        <!--begin::Container-->
        <div class="container-fluid">
            <!--begin::Row-->
            <div class="row">

                @if (session('success'))
                    <div class="alert alert-success" role="alert">
                        {{ session('success') }}
                    </div>
                @endif

                @if ($errors->any())
                    <div class="alert alert-danger" role="alert">
                        <strong>Atenção!</strong> verifique os campos do formulário.
                        <ul class="mb-0">
                            @foreach ($errors->all() as $erro)
                                <li>{{ $erro }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Gerenciamento de Funcionários</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal"
                                data-bs-target="#modalNovoFuncionario">
                                <i class="bi bi-plus-circle"></i>
                                Novo Funcionário
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Cargo</th>
                                    <th>Telefone</th>
                                    <th>Data de Contratação</th>
                                    <th>Status</th>
                                    <th style="width: 200px">Ações</th>
                                </tr>
                            </thead>
                            <tbody>

                                @forelse($funcionarios as $linha)
                                    <tr class="align-middle">
                                        <td>{{ $linha->nome }}</td>

                                        <td>{{ $linha->cargo }}</td>

                                        <td>{{ $linha->telefone }}</td>

                                        <td>{{ \Illuminate\Support\Carbon::parse($linha->data_contratacao)->format('d/m/Y') }}</td>

                                        <td>
                                            @if ($linha->status === 'ATIVO')
                                                <span class="badge text-bg-success">Ativo</span>
                                            @else
                                                <span class="badge text-bg-danger">Inativo</span>
                                            @endif
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                                data-bs-target="#modalEditarFuncionario{{ $linha->id_funcionario }}">
                                                <i class="bi bi-pencil"></i>
                                            </button>

                                            @if ($linha->status === 'ATIVO')
                                                <form
                                                    action="{{ route('admin.funcionarios.desativar', $linha->id_funcionario) }}"
                                                    method="post" style="display: inline;">
                                                    @csrf
                                                    @method('PATCH')
                                                    <button type="submit" class="btn btn-danger">
                                                        <i class="bi bi-trash3"></i>
                                                    </button>
                                                </form>
                                            @else
                                                <form action="{{ route('admin.funcionarios.ativar', $linha->id_funcionario) }}"
                                                    method="post" style="display: inline;">
                                                    @csrf
                                                    @method('PATCH')
                                                    <button type="submit" class="btn btn-success">
                                                        <i class="bi bi-check-circle"></i>
                                                    </button>
                                                </form>
                                            @endif
                                        </td>
                                    </tr>
                                    @include('admin.funcionario.modal.editar', ['linha' => $linha])
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center text-muted">Nenhum funcionário cadastrado.</td>
                                    </tr>
                                @endforelse

                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>


            </div>
        </div>
    </div>

    @include('admin.funcionario.modal.criar')

@endsection
