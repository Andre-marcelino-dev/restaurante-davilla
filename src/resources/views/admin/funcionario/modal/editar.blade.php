<div class="modal fade" id="modalEditarFuncionario{{ $linha->id_funcionario }}" tabindex="-1" aria-labelledby="editarFuncionarioLabel{{ $linha->id_funcionario }}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarFuncionarioLabel{{ $linha->id_funcionario }}">Editar Funcionário</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" action="{{ route('admin.funcionarios.update', $linha->id_funcionario) }}">
                    @csrf
                    @method('PUT')

                    <div class="card-body">

                        <div class="mb-3">
                            <label for="nome{{ $linha->id_funcionario }}" class="form-label">Nome</label>
                            <input type="text" class="form-control" id="nome{{ $linha->id_funcionario }}" name="nome" value="{{ $linha->nome }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="cargo{{ $linha->id_funcionario }}" class="form-label">Cargo</label>
                            <input type="text" class="form-control" id="cargo{{ $linha->id_funcionario }}" name="cargo" value="{{ $linha->cargo }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="telefone{{ $linha->id_funcionario }}" class="form-label">Telefone</label>
                            <input type="text" class="form-control" id="telefone{{ $linha->id_funcionario }}" name="telefone" value="{{ $linha->telefone }}">
                        </div>

                        <div class="mb-3">
                            <label for="data_contratacao{{ $linha->id_funcionario }}" class="form-label">Data de Contratação</label>
                            <input type="date" class="form-control" id="data_contratacao{{ $linha->id_funcionario }}" name="data_contratacao" value="{{ \Illuminate\Support\Carbon::parse($linha->data_contratacao)->format('Y-m-d') }}" required>
                        </div>

                        <div class="modal-footer px-0 pb-0 pt-3">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
