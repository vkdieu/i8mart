@extends('layouts.client')
@section('content')
    <style>
        #main-thumb {
            width: 350px;
            /* Adjust the width of the container as needed */
            height: 350px;
            /* Adjust the height of the container as needed */
            overflow: hidden;
            /* Hide any overflow outside the container */
        }

        #zoom {
            max-width: 100%;
            /* Ensure the image width fits within the container */
            max-height: 100%;
            /* Ensure the image height fits within the container */
            display: block;
            /* Remove any extra spacing */
        }

        .section-detail {
            max-height: 500px;
            /* Giới hạn chiều cao */
            overflow: hidden;
            /* Ẩn phần dư thừa */
        }

        .expanded {
            max-height: none;
            /* Hiển thị toàn bộ nội dung */
        }

        .button-see {
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
            display: block;
        }
    </style>
    <div id="main-content-wp" class="clearfix detail-product-page">
        <div class="wp-inner">
            <div class="secion" id="breadcrumb-wp">
                <div class="secion-detail">
                    <ul class="list-item clearfix">
                        <li>
                            <a href="" title="">Trang chủ</a>
                        </li>
                        <li>
                            <a href="" title="">Điện thoại</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-content fl-right">
                <div class="section" id="detail-product-wp">
                    <div class="section-detail clearfix">
                        <div class="thumb-wp fl-left">
                            <a href="#" title="" id="main-thumb">
                                <img id="zoom" style="height: 350px; width: 350px;"
                                    src="{{ asset($product_detail->img) }}"
                                    data-zoom-image="{{ asset($product_detail->img) }}" />
                            </a>

                            @php
                            @endphp

                            <div id="list-thumb">
                                @foreach ($product_detail->thumbnail_product as $item)
                                    <a href="" data-image="{{ asset($item->title_img) }}"
                                        data-zoom-image="{{ asset($item->title_img) }}">
                                        <img id="zoom" src="{{ asset($item->title_img) }}" />
                                    </a>
                                @endforeach


                            </div>
                        </div>
                        <div class="thumb-respon-wp fl-left">
                            <img src="public/images/img-pro-01.png" alt="">
                        </div>


                        <div class="info fl-right">
                            <h3 class="product-name">{{ $product_detail->title }}</h3>

                            <div class="desc">
                                {!! $product_detail->describe !!}
                            </div>
                            <div class="num-product">
                                <span class="title">Sản phẩm: </span>
                                <span class="status">Còn hàng</span>
                            </div>
                            {{-- ///form --}}
                            <form action="{{ route('Cart.add', $product_detail->id) }}" method="GET">
                                <p class="price">{{ number_format($product_detail->price, 0, '.', '.') }}</p>
                                <div id="num-order-wp">
                                    <a title="" id="minus"><i class="fa fa-minus"></i></a>
                                    <input type="text" min="1" max="10" name="num-order" value="1"
                                        id="num-order">
                                    <a title="" id="plus"><i class="fa fa-plus"></i></a>
                                </div>
                                <input type="submit" value="Thêm giỏ hàng">
                            </form>
                        </div>


                    </div>
                </div>
                <div class="section" id="post-product-wp">
                    <div class="section-head">
                        <h3 class="section-title">Mô tả sản phẩm</h3>
                    </div>
                    <div class="section-detail" id="more-content">
                        {!! $product_detail->detail !!}
                    </div>

                    <button type="button" class="btn btn-outline-dark button-see btn-lg" id="more">Xem thêm</button>

                </div>
                <div class="section" id="same-category-wp">
                    <div class="section-head">
                        <h3 class="section-title">Cùng chuyên mục</h3>
                    </div>
                    <div class="section-detail">
                        <ul class="list-item">

                            @foreach ($products as $item)
                                @if ($item->category_id == $product_detail->category_id)
                                    <li>
                                        <a href="" title="" class="thumb">
                                            <img src="{{ asset($item->img) }}">
                                        </a>
                                        <a href="" title="" class="product-name">{{ $item->title }}</a>
                                        <div class="price">
                                            <span class="new">{{ number_format($item->price, 0, '.', ',') }}đ</span>
                                            {{-- <span class="old">{{ number_format($item->price_old, 0, '.', ',') }}</span> --}}
                                        </div>
                                        <div class="action clearfix">
                                            <a href="{{ route('Cart.add', $item->id) }}" title=""
                                                class="add-cart fl-left">Thêm giỏ hàng</a>
                                            <a href="{{ route('Product.detail', $item->slug) }}" title=""
                                                class="buy-now fl-right">Mua ngay</a>
                                        </div>
                                    </li>
                                @endif
                            @endforeach

                        </ul>
                    </div>
                </div>
            </div>
            <div class="sidebar fl-left">
                <div class="section" id="category-product-wp">
                    <div class="section-head">
                        <h3 class="section-title">Danh mục sản phẩm</h3>
                    </div>
                    <div class="secion-detail">
                        <ul class="list-item">

                            @foreach ($parent_categorys as $parent_category)
                                <li>
                                    <a href="?page=category_product" title="">{{ $parent_category->title }}</a>
                                    @if ($Category->count() > 0)
                                        <ul class="sub-menu">
                                            @foreach ($Category as $item)
                                                @if ($parent_category->id == $item->product_id)
                                                    <li>
                                                        <a href="?page=category_product"
                                                            title="">{{ $item->title }}</a>

                                                    </li>
                                                @endif
                                            @endforeach
                                        </ul>
                                    @endif
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
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
                        <a href="" title="" class="thumb">
                            <img src="public/images/banner.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // var sectionDetail = $(".section-detail");
        // var buttonSee = $(".button-see");
        $("#more").click(function(e) {
            e.preventDefault();

            $("#more-content").toggleClass("expanded");
            if ($("#more-content").hasClass("expanded")) {
                $("#more").text("Ẩn đi");
            } else {
                $("#more").text("Xem thêm");
            }
        });
    });
</script>
