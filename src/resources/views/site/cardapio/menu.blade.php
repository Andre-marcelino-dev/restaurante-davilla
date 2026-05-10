<!-- MENU area start -->
<div class="rts-shop-area rts-section-gap">
    <div class="container">
        <div class="shop-area-inner">

            <div class="shop-filter-area">
                <p class="woocommerce-result-count">
                    Mostrando {{ $itens->count() }} resultados
                </p>

                <select class="from-control">
                    <option>Ordenação padrão</option>
                    <option>Mais populares</option>
                    <option>Melhor avaliados</option>
                    <option>Mais recentes</option>
                    <option>Menor preço</option>
                    <option>Maior preço</option>
                </select>
            </div>

            <div class="menu-item">
                <div class="row">

                    @foreach ($itens as $item)

                        <div class="col-lg-4">
                            <div class="portfolio-wrapper2 mb-30">

                                <a href="#" class="image">

                                    <img class="img-fluid"
                                        src="{{ asset('restaurante/images/cardapio/' . $item->foto) }}"
                                        alt="{{ $item->nome_item }}">

                                </a>

                                <div class="portfolio-content">
                                    <div class="content">

                                        <p class="title">
                                            <a href="#">
                                                {{ $item->nome_item }}
                                            </a>
                                        </p>

                                        <p class="price">
                                            R$ {{ number_format($item->preco, 2, ',', '.') }}
                                        </p>

                                        <p>
                                            {{ $item->descricao }}
                                        </p>

                                        <a href="#"
                                            class="rts-btn btn-primary add-to-cart-btn">
                                            VER PRODUTO
                                        </a>

                                    </div>
                                </div>

                            </div>
                        </div>

                    @endforeach

                </div>
            </div>

        </div>
    </div>
</div>
<!-- MENU area end -->
