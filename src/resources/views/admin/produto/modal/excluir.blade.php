<div class="modal fade" id="modalExcluirProduto{{ $linha->id_item }}" tabindex="-1"
    aria-labelledby="excluirProdutoLabel{{ $linha->id_item }}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="excluirProdutoLabel{{ $linha->id_item }}">Excluir Produto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex align-items-center gap-3">
                    @if ($linha->foto_cardapio)
                        <img src="{{ asset('restaurante/images/cardapio/' . $linha->foto_cardapio) }}"
                            alt="{{ $linha->nome_item }}"
                            style="width: 56px; height: 56px; object-fit: cover; border-radius: 4px;">
                    @endif
                    <div>
                        <p class="mb-1">Tem certeza que deseja excluir o produto <strong>{{ $linha->nome_item }}</strong>?</p>
                        <p class="text-muted mb-0 small">Esta ação não pode ser desfeita.</p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <form method="POST" action="{{ route('admin.produtos.destroy', $linha->id_item) }}">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger">
                        <i class="bi bi-trash3"></i>
                        Excluir
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
