 <!-- blog area start -->
    @php
        $blogConteudo = $blogConteudo ?? collect();
        $blogCabecalho = $blogConteudo->get('blog_cabecalho', collect());
        $blogPosts = $blogConteudo->except('blog_cabecalho')->sortKeys();
    @endphp
    <div class="rts-blog-area rts-blog-area-2 rts-section-gap">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-12">
                    <div class="banner-one-wrapper">
                        <h1 class="title-banner" data-sal="slide-up" data-sal-delay="120" data-sal-duration="800">
                            {{ $blogCabecalho->get('titulo') }}
                        </h1>
                        <p class="desc" data-sal="slide-up" data-sal-delay="700" data-sal-duration="800">{{ $blogCabecalho->get('subtitulo') }}</p>
                    </div>
                </div>
            </div>
            <div class="swiper-technical-main-wrapper" data-sal="slide-up" data-sal-delay="1500" data-sal-duration="800">
                <div class="swiper mySwiper-blog">
                    <div class="swiper-wrapper">
                        @foreach ($blogPosts as $post)
                            <div class="swiper-slide">
                                <div class="blog-wrapper">
                                    <div class="image-part">
                                        @if ($post->get('imagem'))
                                            <img src="{{ asset($post->get('imagem')) }}" alt="blog">
                                        @endif
                                    </div>
                                    <div class="blog-badge">
                                        <span class="date">12</span>
                                        <span class="month">APR</span>
                                    </div>
                                    <div class="content">
                                        <p class="tag"><a href="#">{{ $post->get('tag') }}</a></p>
                                        <h3 class="title"><a href="blog-details.html">{{ $post->get('titulo') }}</a></h3>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- blog area end -->