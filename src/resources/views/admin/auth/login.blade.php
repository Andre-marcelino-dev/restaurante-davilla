<!DOCTYPE html>
<html lang="pt-BR">

<head>
    @include('admin.partials.head')
</head>

<body class="login-page bg-body-tertiary">

    <div class="login-box">
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                <a href="{{ route('home') }}" class="h1"><b>Davilla</b>Admin</a>
            </div>
            <div class="card-body">
                <p class="login-box-msg">Acesse o painel administrativo</p>

                @if (session('error'))
                    <div class="alert alert-danger" role="alert">
                        {{ session('error') }}
                    </div>
                @endif

                @if ($errors->any())
                    <div class="alert alert-danger" role="alert">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $erro)
                                <li>{{ $erro }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form method="POST" action="{{ route('admin.login.attempt') }}">
                    @csrf

                    <div class="input-group mb-3">
                        <input type="email" name="email" class="form-control" placeholder="E-mail"
                            value="{{ old('email') }}" required autofocus>
                        <div class="input-group-text">
                            <i class="bi bi-envelope"></i>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <input type="password" name="password" class="form-control" placeholder="Senha" required>
                        <div class="input-group-text">
                            <i class="bi bi-lock-fill"></i>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-7">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="lembrar" name="lembrar" value="1">
                                <label class="form-check-label" for="lembrar">Lembrar-me</label>
                            </div>
                        </div>
                        <div class="col-5">
                            <button type="submit" class="btn btn-primary w-100">Entrar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.min.js"
        crossorigin="anonymous"></script>

</body>

</html>
