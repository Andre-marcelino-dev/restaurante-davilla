<div class="modal fade" id="modalEditarProduto{{ $produto->id_item }}" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Produto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form method="POST" action="{{ route('admin.produtos.update', $produto->id_item) }}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="mb-3">
                        <label class="form-label">Nome do Produto</label>
                        <input type="text" class="form-control" name="nome_item"
                            value="{{ $produto->nome_item }}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Categoria</label>
                        <select class="form-select" name="id_categoria" required>
                            <option value="">Selecione...</option>
                            @foreach($categorias as $categoria)
                                <option value="{{ $categoria->id_categoria }}"
                                    {{ $produto->id_categoria == $categoria->id_categoria ? 'selected' : '' }}>
                                    {{ $categoria->nome_categoria }}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Descrição</label>
                        <textarea class="form-control" name="descricao" rows="3">{{ $produto->descricao }}</textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Preço</label>
                        <div class="input-group">
                            <span class="input-group-text">R$</span>
                            <input type="number" step="0.01" min="0" class="form-control"
                                name="preco" value="{{ $produto->preco }}" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Foto atual</label><br>
                        @if($produto->foto_cardapio)
                            <img src="{{ asset('restaurante/cardapio/' . $produto->foto_cardapio) }}"
                                width="80" height="80" style="object-fit:cover; border-radius:6px;" class="mb-2">
                        @endif
                        <input type="file" class="form-control" name="foto_cardapio" accept="image/*">
                        <small class="text-muted">Deixe em branco para manter a foto atual.</small>
                    </div>

                    <div class="modal-footer px-0 pb-0 pt-3">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>