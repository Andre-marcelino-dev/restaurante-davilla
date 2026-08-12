@extends('layout.admin')

@section('title', 'Produtos | Confeitaria Dashboard')

@section('pg-titulo', 'Produtos')

@section('link-topo', 'Produtos')

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

                @if (session('error'))
                    <div class="alert alert-danger" role="alert">
                        {{ session('error') }}
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
                        <h3 class="card-title">Gerenciamento de Produtos</h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal"
                                data-bs-target="#modalNovoProduto">
                                <i class="bi bi-plus-circle"></i>
                                Novo Produto
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="width: 70px">Foto</th>
                                    <th>Nome do Produto</th>
                                    <th>Categoria</th>
                                    <th>Preço</th>
                                    <th>Disponível</th>
                                    <th style="width: 160px">Ações</th>
                                </tr>
                            </thead>
                            <tbody>

                                @forelse($produtos as $linha)
                                    <tr class="align-middle">
                                        <td>
                                            @if ($linha->foto_cardapio)
                                                <img src="{{ asset('restaurante/images/cardapio/' . $linha->foto_cardapio) }}"
                                                    alt="{{ $linha->nome_item }}" style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
                                            @else
                                                <span class="text-muted">—</span>
                                            @endif
                                        </td>

                                        <td>{{ $linha->nome_item }}</td>

                                        <td>{{ $linha->categoria->nome_categoria ?? '—' }}</td>

                                        <td>R$ {{ number_format($linha->preco, 2, ',', '.') }}</td>

                                        <td>
                                            @if ($linha->disponivel)
                                                <span class="badge text-bg-success">Sim</span>
                                            @else
                                                <span class="badge text-bg-danger">Não</span>
                                            @endif
                                        </td>

                                        <td>
                                            <div class="d-flex gap-1">
                                                <button type="button" class="btn btn-sm btn-outline-warning" data-bs-toggle="modal"
                                                    data-bs-target="#modalEditarProduto{{ $linha->id_item }}" title="Editar">
                                                    <i class="bi bi-pencil"></i>
                                                </button>

                                                @if ($linha->disponivel)
                                                    <form action="{{ route('admin.produtos.desativar', $linha->id_item) }}"
                                                        method="post">
                                                        @csrf
                                                        @method('PATCH')
                                                        <button type="submit" class="btn btn-sm btn-outline-secondary" title="Desativar">
                                                            <i class="bi bi-eye-slash"></i>
                                                        </button>
                                                    </form>
                                                @else
                                                    <form action="{{ route('admin.produtos.ativar', $linha->id_item) }}"
                                                        method="post">
                                                        @csrf
                                                        @method('PATCH')
                                                        <button type="submit" class="btn btn-sm btn-outline-success" title="Ativar">
                                                            <i class="bi bi-check-circle"></i>
                                                        </button>
                                                    </form>
                                                @endif

                                                <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal"
                                                    data-bs-target="#modalExcluirProduto{{ $linha->id_item }}" title="Excluir">
                                                    <i class="bi bi-trash3"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    @include('admin.produto.modal.editar', ['linha' => $linha])
                                    @include('admin.produto.modal.excluir', ['linha' => $linha])
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center text-muted">Nenhum produto cadastrado.</td>
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

    @include('admin.produto.modal.criar')

@endsection
