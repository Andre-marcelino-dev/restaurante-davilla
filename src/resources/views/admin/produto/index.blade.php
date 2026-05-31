@extends('layout.admin')

@section('title', 'Produtos | Confeitaria Dashboard')
@section('pg-titulo', 'Produtos')
@section('link-topo', 'Produtos')

@section('content')
    <div class="app-content">
        <div class="container-fluid">
            <div class="row">

                @if (session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif

                <div class="card-header">
                    <h3 class="card-title">Gerenciamento de Produtos</h3>
                    <div class="card-tools">
                        <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal"
                            data-bs-target="#modalNovoProduto">
                            <i class="bi bi-plus-circle"></i> Novo Produto
                        </button>
                    </div>
                </div>


                <div class="card-body p-0">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Foto</th>
                                <th>Nome</th>
                                <th>Categoria</th>
                                <th>Descrição</th>
                                <th>Preço</th>
                                <th>Disponível</th>
                                <th style="width: 150px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($produtos as $produto)
                                <tr class="align-middle">
                                    <td>
                                        <img src="{{ asset('restaurante/cardapio/' . $produto->foto_cardapio) }}"
                                            alt="{{ $produto->nome_item }}" width="60" height="60"
                                            style="object-fit: cover; border-radius: 6px;">
                                    </td>
                                    <td>{{ $produto->nome_item }}</td>
                                    <td>{{ $produto->categoria->nome_categoria ?? '-' }}</td>
                                    <td>{{ Str::limit($produto->descricao, 60) }}</td>
                                    <td>R$ {{ number_format($produto->preco, 2, ',', '.') }}</td>
                                    <td>
                                        <span
                                            class="badge {{ $produto->disponivel ? 'text-bg-success' : 'text-bg-danger' }}">
                                            {{ $produto->disponivel ? 'Sim' : 'Não' }}
                                        </span>
                                    </td>
                                    <td>
                                        <button class="btn btn-warning btn-sm" data-bs-toggle="modal"
                                            data-bs-target="#modalEditarProduto{{ $produto->id_item }}">
                                            <i class="bi bi-pencil"></i> Editar
                                        </button>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="7" class="text-center text-muted">Nenhum produto cadastrado.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
    </div>

    @include('admin.produto.modal.criar')
    @foreach($produtos as $produto)
    @include('admin.produto.modal.editar', ['produto' => $produto])
@endforeach

@endsection
