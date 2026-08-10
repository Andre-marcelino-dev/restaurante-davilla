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
                                    <th style="width: 100px">Ações</th>
                                </tr>
                            </thead>
                            <tbody>

                                @forelse($produtos as $linha)
                                    <tr class="align-middle">
                                        <td>
                                            @if ($linha->foto)
                                                <img src="{{ asset('restaurante/images/cardapio/' . $linha->foto) }}"
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
                                            <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                                data-bs-target="#modalEditarProduto{{ $linha->id_item }}">
                                                <i class="bi bi-pencil"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    @include('admin.produto.modal.editar', ['linha' => $linha])
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
