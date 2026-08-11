@extends('layout.admin')

@section('title', 'Banner do Site | Restaurante Davilla')

@section('pg-titulo', 'Banner do Site')

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

                <form method="POST" action="{{ route('admin.conteudo.banner.update') }}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    @foreach ($slides as $numero => $slide)
                        <div class="card mb-4">
                            <div class="card-header">
                                <h3 class="card-title">Slide {{ $numero }}</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label">Imagem de fundo</label>
                                        @if ($slide['imagem'])
                                            <div class="mb-2">
                                                <img src="{{ asset($slide['imagem']) }}" alt="Slide {{ $numero }}"
                                                    style="width: 100%; max-width: 220px; height: 130px; object-fit: cover; border-radius: 4px;">
                                            </div>
                                        @endif
                                        <input type="file" class="form-control" name="slides[{{ $numero }}][imagem]"
                                            accept="image/png,image/jpeg,image/webp">
                                        <div class="form-text">Deixe em branco para manter a imagem atual (máx. 20MB).</div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="mb-3">
                                            <label class="form-label">Pré-título</label>
                                            <input type="text" class="form-control" name="slides[{{ $numero }}][pretitulo]"
                                                value="{{ old("slides.$numero.pretitulo", $slide['pretitulo']) }}" required>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Título</label>
                                            <textarea class="form-control" rows="2" name="slides[{{ $numero }}][titulo]"
                                                required>{{ old("slides.$numero.titulo", $slide['titulo']) }}</textarea>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Texto do botão primário</label>
                                                <input type="text" class="form-control"
                                                    name="slides[{{ $numero }}][botao_primario_texto]"
                                                    value="{{ old("slides.$numero.botao_primario_texto", $slide['botao_primario_texto']) }}"
                                                    required>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label class="form-label">Texto do botão secundário</label>
                                                <input type="text" class="form-control"
                                                    name="slides[{{ $numero }}][botao_secundario_texto]"
                                                    value="{{ old("slides.$numero.botao_secundario_texto", $slide['botao_secundario_texto']) }}"
                                                    required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach

                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary">Salvar Banner</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

@endsection
