@extends('layouts.client')
@section('content')
    <style>
        img {
            max-width: 100%;
            height: auto;
            display: block;
        }
    </style>

    <div id="main-content-wp" class="clearfix blog-page">
        <div class="wp-inner">
            <div class="secion" id="breadcrumb-wp">
                <div class="secion-detail">
                    <ul class="list-item clearfix">
                        <li>
                            <a href="{{ route('Home.index') }}" title="">Trang chủ</a>
                        </li>
                        <li>
                            <a href="{{ route('Page.index', ['slug' => $page->slug]) }}"
                                title="">{{ $page->title }}</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-content fl-right">
                <div class="section" id="list-blog-wp">
                    <div class="section-head clearfix">
                        <h3 class="section-title">{{ $page->title }}</h3>
                        <span class="create-date">{{ $page->created_at }}</span>
                        <p class="desc">{!! $page->content !!} </p>

                    </div>

                </div>
                {{-- <div class="section" id="paging-wp">
                    <div class="section-detail">
                        <ul class="list-item clearfix">
                            {{ $pages->links() }}
                        </ul>
                    </div>
                </div> --}}
            </div>
            <div class="sidebar fl-left">
                <div class="section" id="selling-wp">
                    <div class="section-head">
                        <h3 class="section-title">Sản phẩm bán chạy</h3>
                    </div>
                    <div class="section-detail">
                        <ul class="list-item">
                            @foreach ($product_order as $item)
                                @php
                                    $info_products = json_decode($item->info_product);
                                    $info_products = collect($info_products)->take(6); // Giới hạn số lượng sản phẩm là 6
                                @endphp
                                @foreach ($info_products as $info_product)
                                    <li class="clearfix">
                                        <a href="{{ route('Product.detail', $info_product->slug) }}" title=""
                                            class="thumb fl-left">
                                            <img src="{{ asset($info_product->image) }}" alt="">
                                        </a>
                                        <div class="info fl-right">
                                            <a href="{{ route('Product.detail', $info_product->slug) }}" title=""
                                                class="product-name">{{ $info_product->title }}</a>
                                            <div class="price">
                                                <span class="new">{{ $info_product->price }}đ</span>
                                            </div>

                                        </div>
                                    </li>
                                @endforeach
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="section" id="banner-wp">
                    <div class="section-detail">
                        <a href="?page=detail_blog_product" title="" class="thumb">
                            <img src="{{ asset('client/images/banner.png') }}" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
