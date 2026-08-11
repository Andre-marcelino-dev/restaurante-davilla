<!-- MENU area start -->
<div class="rts-shop-area rts-section-gap">
    <div class="container">
        <div class="shop-area-inner">

            <div class="shop-filter-area">
                <p class="woocommerce-result-count">
                    Mostrando {{ $itens->count() }} resultados
                </p>

                <form method="GET" action="{{ route('cardapio') }}">

                    <select name="categoria" class="from-control" onchange="this.form.submit()">

                        <option value="">Todas Categorias</option>

                        @foreach ($categorias as $categoria)
                            <option value="{{ $categoria->id_categoria }}"
                                {{ request('categoria') == $categoria->id_categoria ? 'selected' : '' }}>

                                {{ $categoria->nome_categoria }}

                            </option>
                        @endforeach

                    </select>

                </form>
            </div>

            <div class="menu-item">
                <div class="row">

                    @foreach ($itens as $item)
                        <div class="col-lg-4">
                            <div class="portfolio-wrapper2 mb-30">

                                <a href="#" class="image">

                                   <img src="{{ asset('restaurante/images/cardapio/' . $item->foto_cardapio) }}"
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

                                        <a href="#" class="rts-btn btn-primary add-to-cart-btn">
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
