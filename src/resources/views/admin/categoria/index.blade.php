@extends('layout.admin')

@section('title', 'Categoria | Restaurante Davilla')

@section('pg-titulo', 'Categoria')

@section('link-topo', 'Categoria')

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
                    </div>
                @endif

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Gerenciamento de Categorias</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal"
                                data-bs-target="#modalNovaCategoria">
                                <i class="bi bi-plus-circle"></i>
                                Nova Categoria
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 60px"></th>
                                    <th>Nome da Categoria</th>
                                    <th>Descrição</th>
                                    <th>Status</th>
                                    <th style="width: 200px">Ações</th>
                                </tr>
                            </thead>
                            <tbody>

                                @forelse($categorias as $linha)
                                    <tr class="align-middle">
                                        <td></td>

                                        <td>{{ $linha->nome_categoria }}</td>

                                        <td>{{ $linha->descricao }}</td>

                                        <td>
                                            <form action="{{ route('admin.categorias.toggle', $linha->id_categoria) }}" method="POST" class="d-inline">
                                                @csrf
                                                @method('PATCH')
                                                <button type="submit"
                                                    class="badge border-0
                                                    {{ $linha->status_categoria === 'ATIVO' ? 'text-bg-success' : 'text-bg-danger' }}">
                                                    {{ $linha->status_categoria === 'ATIVO' ? 'Ativo' : 'Inativo' }}
                                                </button>
                                            </form>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                                data-bs-target="#modalEditarCategoria{{ $linha->id_categoria }}">
                                                <i class="bi bi-pencil"></i>
                                            </button>

                                            @if ($linha->status_categoria === 'ATIVO')
                                                <form
                                                    action="{{ route('admin.categorias.desativar', $linha->id_categoria) }}"
                                                    method="post" style="display: inline;">
                                                    @csrf
                                                    @method('PATCH')
                                                    <button type="submit" class="btn btn-danger">
                                                        <i class="bi bi-trash3"></i>
                                                    </button>
                                                </form>
                                            @else
                                                <form action="{{ route('admin.categorias.ativar', $linha->id_categoria) }}"
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
                                @empty
                                    <tr>
                                        <td colspan="5" class="text-center text-muted">Nenhuma categoria cadastrada.</td>
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


    @include('admin.categoria.modal.criar')
    @include('admin.categoria.modal.editar')

@endsection
