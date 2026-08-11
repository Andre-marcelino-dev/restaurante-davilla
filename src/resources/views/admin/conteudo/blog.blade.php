@extends('layout.admin')

@section('title', 'Blog da Home | Restaurante Davilla')

@section('pg-titulo', 'Blog & Insights (Home)')

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

                <form method="POST" action="{{ route('admin.conteudo.blog.update') }}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="card mb-4">
                        <div class="card-header">
                            <h3 class="card-title">Cabeçalho da seção</h3>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Título</label>
                                <input type="text" class="form-control" name="cabecalho[titulo]"
                                    value="{{ old('cabecalho.titulo', $cabecalho['titulo']) }}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Subtítulo</label>
                                <textarea class="form-control" rows="2" name="cabecalho[subtitulo]"
                                    required>{{ old('cabecalho.subtitulo', $cabecalho['subtitulo']) }}</textarea>
                            </div>
                        </div>
                    </div>

                    @foreach ($posts as $numero => $post)
                        <div class="card mb-4">
                            <div class="card-header">
                                <h3 class="card-title">Post {{ $numero }}</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label">Imagem</label>
                                        @if ($post['imagem'])
                                            <div class="mb-2">
                                                <img src="{{ asset($post['imagem']) }}" alt="Post {{ $numero }}"
                                                    style="width: 100%; max-width: 220px; height: 130px; object-fit: cover; border-radius: 4px;">
                                            </div>
                                        @endif
                                        <input type="file" class="form-control" name="posts[{{ $numero }}][imagem]"
                                            accept="image/png,image/jpeg,image/webp">
                                        <div class="form-text">Deixe em branco para manter a imagem atual (máx. 20MB).</div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="mb-3">
                                            <label class="form-label">Categoria (tag)</label>
                                            <input type="text" class="form-control" name="posts[{{ $numero }}][tag]"
                                                value="{{ old("posts.$numero.tag", $post['tag']) }}" required>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Título do post</label>
                                            <textarea class="form-control" rows="2" name="posts[{{ $numero }}][titulo]"
                                                required>{{ old("posts.$numero.titulo", $post['titulo']) }}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach

                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary">Salvar Blog</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

@endsection
