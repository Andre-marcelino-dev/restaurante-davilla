<div class="modal fade" id="modalEditarProduto{{ $linha->id_item }}" tabindex="-1" aria-labelledby="editarProdutoLabel{{ $linha->id_item }}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editarProdutoLabel{{ $linha->id_item }}">Editar Produto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="POST" action="{{ route('admin.produtos.update', $linha->id_item) }}" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')

                    <div class="card-body">

                        @if ($linha->foto)
                            <div class="mb-3">
                                <img src="{{ asset('restaurante/images/cardapio/' . $linha->foto) }}" alt="{{ $linha->nome_item }}"
                                    style="width: 80px; height: 80px; object-fit: cover; border-radius: 4px;">
                            </div>
                        @endif

                        <div class="mb-3">
                            <label for="nome_item{{ $linha->id_item }}" class="form-label">Nome do Produto</label>
                            <input type="text" class="form-control" id="nome_item{{ $linha->id_item }}" name="nome_item" value="{{ $linha->nome_item }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="descricao{{ $linha->id_item }}" class="form-label">Descrição</label>
                            <textarea class="form-control" id="descricao{{ $linha->id_item }}" rows="3" name="descricao">{{ $linha->descricao }}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="id_categoria{{ $linha->id_item }}" class="form-label">Categoria</label>
                            <select class="form-select" id="id_categoria{{ $linha->id_item }}" name="id_categoria" required>
                                @foreach ($categorias as $categoria)
                                    <option value="{{ $categoria->id_categoria }}" @selected($categoria->id_categoria == $linha->id_categoria)>
                                        {{ $categoria->nome_categoria }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="preco{{ $linha->id_item }}" class="form-label">Preço</label>
                            <input type="number" step="0.01" min="0" class="form-control" id="preco{{ $linha->id_item }}" name="preco" value="{{ $linha->preco }}" required>
                        </div>

                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="disponivel{{ $linha->id_item }}" name="disponivel" value="1" @checked($linha->disponivel)>
                            <label class="form-check-label" for="disponivel{{ $linha->id_item }}">Disponível</label>
                        </div>

                        <div class="mb-3">
                            <label for="foto{{ $linha->id_item }}" class="form-label">Trocar Foto do Produto</label>
                            <input type="file" class="form-control" id="foto{{ $linha->id_item }}" name="foto" accept="image/png,image/jpeg,image/webp">
                            <div class="form-text">Deixe em branco para manter a foto atual.</div>
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
