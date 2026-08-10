<div class="modal fade" id="modalEditarCategoria{{ $linha->id_categoria }}" tabindex="-1" aria-labelledby="editarCategoriaLabel{{ $linha->id_categoria }}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarCategoriaLabel{{ $linha->id_categoria }}">Editar Categoria</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" action="{{ route('admin.categorias.update', $linha->id_categoria) }}">
                    @csrf
                    @method('PUT')

                    <div class="card-body">

                        <div class="mb-3">
                            <label for="nome_categoria{{ $linha->id_categoria }}" class="form-label">Nome da Categoria</label>
                            <input type="text" class="form-control" id="nome_categoria{{ $linha->id_categoria }}" name="nome_categoria" value="{{ $linha->nome_categoria }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="descricao{{ $linha->id_categoria }}" class="form-label">Descrição</label>
                            <textarea class="form-control" id="descricao{{ $linha->id_categoria }}" rows="3" name="descricao" required>{{ $linha->descricao }}</textarea>
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
