@extends('layouts.client')
@section('content')
    <div id="main-content-wp" class="clearfix detail-blog-page">
        <div class="wp-inner">
            <div class="secion" id="breadcrumb-wp">
                <div class="secion-detail">
                    <ul class="list-item clearfix">
                        <li>
                            <a href="" title="">Trang chủ</a>
                        </li>
                        <li>
                            <a href="" title="">Blog</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-content fl-right">
                <div class="section" id="detail-blog-wp">

                    <div class="section-head clearfix">
                        <h3 class="section-title">{{ $Post_detail->title }}
                        </h3>
                    </div>
                    <div class="section-detail">
                        <span class="create-date">{{ $Post_detail->created_at }}</span>
                        <div class="detail">
                            {!! $Post_detail->detail !!}
                        </div>
                    </div>
                </div>
                <div class="section" id="social-wp">
                    <div class="section-detail">
                        <div class="fb-like" data-href="" data-layout="button_count" data-action="like" data-size="small"
                            data-show-faces="true" data-share="true"></div>
                        <div class="g-plusone-wp">
                            <div class="g-plusone" data-size="medium"></div>
                        </div>
                        <div class="fb-comments" id="fb-comment" data-href="" data-numposts="5"></div>
                    </div>
                </div>
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
                                            <a href="?page=detail_product" title=""
                                                class="product-name">{{ $info_product->title }}</a>
                                            <div class="price">
                                                <span class="new">{{ $info_product->price }}</span>
                                            </div>
                                            <a href="{{ route('Product.detail', $info_product->slug) }}" title=""
                                                class="buy-now">Xem chi tiết</a>
                                        </div>
                                    </li>
                                @endforeach
                            @endforeach
                        </ul>
                    </div>
                </div>
                <div class="section" id="banner-wp">
                    <div class="section-detail">
                        <a href="?page=detail_product" title="" class="thumb">
                            <img src="public/images/banner.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
