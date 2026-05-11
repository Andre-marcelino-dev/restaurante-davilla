<!-- MENU area start -->
<div class="rts-menu-area-5 rts-section-gap">
    <div class="container">
        <div class="menu-area-5-inner">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                </div>
                <div class="col-lg-6">
                    <div class="menu-wrapper" data-sal="zoom-in" data-sal-delay="150" data-sal-duration="800">
                        <div class="banner-one-wrapper">
                            <div class="title-img" data-sal="zoom-in" data-sal-delay="150" data-sal-duration="800">
                                <img src="{{ asset('restaurante/images/about/title-shape.png') }}" alt="about">
                            </div>
                            <h1 class="title-banner" data-sal="slide-up" data-sal-delay="170" data-sal-duration="800">
                                Selected Menu Items
                            </h1>
                        </div>

                        @foreach ($itens as $item)
                            <div class="menu-item">
                                <div class="item">
                                    <div class="content">
                                        <h4 class="p-title"><a href="shop-details.html">{{ $item->nome_item }}</a></h4>
                                        <p class="desc">{{ $item->descricao }}</p>
                                    </div>
                                    <div class="price-tag"><a href="#">R$ {{ number_format($item->preco, 2, ',', '.') }}</a></div>
                                </div>



                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- MENU area end -->
