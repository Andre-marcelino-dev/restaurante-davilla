@extends('layout.admin')

@section('title', 'Sobre (Home) | Restaurante Davilla')

@section('pg-titulo', 'Seção Sobre (Home)')

@section('link-topo', 'Conteúdo do Site')

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

                <form method="POST" action="{{ route('admin.conteudo.sobre.update') }}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="card mb-4">
                        <div class="card-header">
                            <h3 class="card-title">Imagens</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Imagem 1</label>
                                    @if ($sobre['imagem_1'])
                                        <div class="mb-2">
                                            <img src="{{ asset($sobre['imagem_1']) }}" alt="Imagem 1"
                                                style="width: 100%; max-width: 220px; height: 130px; object-fit: cover; border-radius: 4px;">
                                        </div>
                                    @endif
                                    <input type="file" class="form-control" name="imagem_1"
                                        accept="image/png,image/jpeg,image/webp">
                                    <div class="form-text">Deixe em branco para manter a imagem atual (máx. 20MB).</div>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Imagem 2</label>
                                    @if ($sobre['imagem_2'])
                                        <div class="mb-2">
                                            <img src="{{ asset($sobre['imagem_2']) }}" alt="Imagem 2"
                                                style="width: 100%; max-width: 220px; height: 130px; object-fit: cover; border-radius: 4px;">
                                        </div>
                                    @endif
                                    <input type="file" class="form-control" name="imagem_2"
                                        accept="image/png,image/jpeg,image/webp">
                                    <div class="form-text">Deixe em branco para manter a imagem atual (máx. 20MB).</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            <h3 class="card-title">Textos</h3>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Título</label>
                                <textarea class="form-control" rows="2" name="campos[titulo]"
                                    required>{{ old('campos.titulo', $sobre['titulo']) }}</textarea>
                                <div class="form-text">Use uma quebra de linha para separar em duas linhas.</div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Descrição</label>
                                <textarea class="form-control" rows="3" name="campos[descricao]"
                                    required>{{ old('campos.descricao', $sobre['descricao']) }}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Número do contador</label>
                                    <input type="text" class="form-control" name="campos[contador_numero]"
                                        value="{{ old('campos.contador_numero', $sobre['contador_numero']) }}" required>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Texto do contador</label>
                                    <input type="text" class="form-control" name="campos[contador_texto]"
                                        value="{{ old('campos.contador_texto', $sobre['contador_texto']) }}" required>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label class="form-label">Texto do botão</label>
                                    <input type="text" class="form-control" name="campos[botao_texto]"
                                        value="{{ old('campos.botao_texto', $sobre['botao_texto']) }}" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary">Salvar Sobre</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

@endsection
