<!-- banner start -->
<div class="rts-banner-main-area-swiper banner-one banner-five">
    <!-- Slider main container -->
    <div class="swiper-container">
        <!-- Additional required wrapper -->
        <div class="swiper-pagination"></div>
        <div class="swiper-wrapper">
            <!-- Slides -->
            @foreach (($bannerSlides ?? collect())->sortKeys() as $slide)
                <div class="swiper-slide">
                    <!-- rts-banner area end-->
                    <div class="ptb_sm-20 rts-banner-one bg_image"
                        @if ($slide->get('imagem'))
                            style="background-image: url('{{ asset($slide->get('imagem')) }}'); background-size: cover; background-position: center;"
                        @endif>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="banner-one-wrapper ptb--110">
                                        <span class="b_one-pre">
                                            {{ $slide->get('pretitulo') }}
                                        </span>
                                        <div class="banner-shape-area">
                                            <span class="shape"></span>
                                            <span class="shape"></span>
                                            <span class="shape"></span>
                                        </div>
                                        <h1 class="title-banner">
                                            {{ $slide->get('titulo') }}
                                        </h1>
                                        <div class="button-area-banner">
                                            <a href="about.html" class="rts-btn btn-primary">{{ $slide->get('botao_primario_texto') }}</a>
                                            <a href="{{ route('cardapio') }}" class="rts-btn btn-seconday">
                                                {{ $slide->get('botao_secundario_texto') }}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- rts-banner area end -->
                </div>
            @endforeach
            <!-- If we need pagination -->
        </div>
        <!-- If we need navigation buttons -->
    </div>
</div>
<!-- banner end -->
