<div class="modal fade" id="modalNovoFuncionario" tabindex="-1" aria-labelledby="novoFuncionarioLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="novoFuncionarioLabel">Cadastro de Funcionário</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" action="{{ route('admin.funcionarios.store') }}">
                    @csrf

                    <div class="card-body">

                        <div class="mb-3">
                            <label for="nome" class="form-label">Nome</label>
                            <input type="text" class="form-control" id="nome" name="nome" required>
                        </div>

                        <div class="mb-3">
                            <label for="cargo" class="form-label">Cargo</label>
                            <input type="text" class="form-control" id="cargo" name="cargo" aria-describedby="alerta-cargo" required>
                            <div id="alerta-cargo" class="form-text">
                                Ex: Gerente, Garçom, Cozinheiro, Auxiliar de Cozinha
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="telefone" class="form-label">Telefone</label>
                            <input type="text" class="form-control" id="telefone" name="telefone" placeholder="(11) 91234-5678">
                        </div>

                        <div class="mb-3">
                            <label for="data_contratacao" class="form-label">Data de Contratação</label>
                            <input type="date" class="form-control" id="data_contratacao" name="data_contratacao" required>
                        </div>

                        <div class="modal-footer px-0 pb-0 pt-3">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Salvar Funcionário</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
