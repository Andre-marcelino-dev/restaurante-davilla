<!-- about area start -->
@php
    $sobreConteudo = $sobreConteudo ?? collect();
@endphp
<div class="rts-about-area home-two home-five">
    <div class="container">
        <div class="about-area-inner">
            <div class="row align-items-center">
                <div
                    class="col-xl-6 col-lg-7 pr_md--0 pr_sm--0 mt_md--50 mt_sm--50 pl_md--0 pl_sm--0 pb_md--0 pb_sm--150">
                    <div class="about-one-img">
                        <div class="left-side">
                            <div class="content">
                                <h2 class="heading-title"><img src="{{ asset('restaurante/images/about/time.png') }}"
                                        alt="about-image">Horário de funcionamento</h2>
                                <ul class="bottom-content">

                                    @foreach ($horarios as $horario)
                                        <li>
                                            {{ $horario->dia }} {{ $horario->horario }}
                                        </li>
                                    @endforeach

                                </ul>
                            </div>
                            <div class="image">
                                @if ($sobreConteudo->get('imagem_1'))
                                    <img src="{{ asset($sobreConteudo->get('imagem_1')) }}" alt="about-image">
                                @endif
                            </div>
                        </div>
                        <div class="right-side">
                            <div class="image">
                                @if ($sobreConteudo->get('imagem_2'))
                                    <img src="{{ asset($sobreConteudo->get('imagem_2')) }}" alt="about-image">
                                @endif
                            </div>
                            <div class="content">
                                <div class="content-icon">
                                    <img src="{{ asset('restaurante/images/about/knife.png') }}" alt="about-image">
                                    <div class="icon">
                                        <img src="{{ asset('restaurante/images/about/back-icon.png') }}" alt="icon">
                                    </div>
                                </div>
                                <div class="counter-up-area">
                                    <h2 class="title-main"><span class="counter">{{ $sobreConteudo->get('contador_numero') }}</span><span class="prefix">+</span>
                                    </h2>
                                    <p class="disc">
                                        {{ $sobreConteudo->get('contador_texto') }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-5 pr--10">
                    <div class="banner-one-wrapper ptb--110">
                        <div class="title-img" data-sal="zoom-in" data-sal-delay="150" data-sal-duration="800">
                            <img src="{{ asset('restaurante/images/about/title-shape.png') }}" alt="about">
                        </div>
                        <h1 class="title-banner" data-sal="slide-up" data-sal-delay="170" data-sal-duration="800">
                            {!! nl2br(e($sobreConteudo->get('titulo'))) !!}
                        </h1>
                        <div class="banner-shape-area" data-sal="slide-up" data-sal-delay="200" data-sal-duration="800">
                            <span class="shape"></span>
                            <span class="shape"></span>
                            <span class="shape"></span>
                        </div>
                        <p class="desc" data-sal="slide-up" data-sal-duration="800">{{ $sobreConteudo->get('descricao') }}</p>
                        <div class="button-area-banner" data-sal="slide-up" data-sal-delay="350"
                            data-sal-duration="800">
                            <a href="menu-list.html" class="rts-btn btn-secondary">{{ $sobreConteudo->get('botao_texto') }}</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="vector-shape">
                <img src="{{ asset('restaurante/images/about/vector8.webp') }}" alt="">
            </div>
        </div>
    </div>
</div>
<!-- about area end -->
