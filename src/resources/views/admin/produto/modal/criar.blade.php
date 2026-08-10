<div class="modal fade" id="modalNovoProduto" tabindex="-1" aria-labelledby="novoProdutoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="novoProdutoLabel">Cadastro de Produto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" action="{{ route('admin.produtos.store') }}" enctype="multipart/form-data">
                    @csrf

                    <div class="card-body">

                        <div class="mb-3">
                            <label for="nome_item" class="form-label">Nome do Produto</label>
                            <input type="text" class="form-control" id="nome_item" name="nome_item" required>
                        </div>

                        <div class="mb-3">
                            <label for="descricao" class="form-label">Descrição</label>
                            <textarea class="form-control" id="descricao" rows="3" name="descricao"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="id_categoria" class="form-label">Categoria</label>
                            <select class="form-select" id="id_categoria" name="id_categoria" required>
                                <option value="">Selecione...</option>
                                @foreach ($categorias as $categoria)
                                    <option value="{{ $categoria->id_categoria }}">{{ $categoria->nome_categoria }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="preco" class="form-label">Preço</label>
                            <input type="number" step="0.01" min="0" class="form-control" id="preco" name="preco" required>
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="disponivel" name="disponivel" value="1" checked>
                            <label class="form-check-label" for="disponivel">Disponível</label>
                        </div>

                        <div class="mb-3">
                            <label for="foto" class="form-label">Foto do Produto</label>
                            <input type="file" class="form-control" id="foto" name="foto" accept="image/png,image/jpeg,image/webp">
                            <div class="form-text">Formatos aceitos: JPG, PNG ou WEBP (máx. 20MB).</div>
                        </div>

                        <div class="modal-footer px-0 pb-0 pt-3">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Salvar Produto</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
