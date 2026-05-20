<div class="modal fade" id="modalNovaCategoria" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cadastro de Categoria</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" action="{{ route('admin.categoria.store') }}">
                    @csrf

                    <div class="card-body">
                        
                        <div class="mb-3">
                            <label for="nome_categoria" class="form-label">Nome da Categoria</label>
                            <input type="text" class="form-control" id="nome_categoria" name="nome_categoria" aria-describedby="alerta-nome_categoria" required>
                            <div id="alerta-nome_categoria" class="form-text">
                                Informe o nome da categoria (Ex: Doces, Bebidas)
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="descricao" class="form-label">Descrição</label>
                            <textarea class="form-control" id="descricao" rows="3" aria-describedby="alerta-descricao" name="descricao" required></textarea>
                            <div id="alerta-descricao" class="form-text">
                                Breve descrição sobre o que entra nesta categoria.
                            </div>
                        </div>

                        <div class="modal-footer px-0 pb-0 pt-3">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Salvar Categoria</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>