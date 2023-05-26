@extends('layouts.client')
@section('content')
    <style>
        #list-product-wp .section-detail .list-item li {
            float: left;
            width: 24.25%;
            margin-right: 1%;
            margin-bottom: 1%;
            background: #fff;
            padding: 10px 10px 30px 10px;
            border: 1px solid transparent;
            height: 400px;
        }
    </style>
    <div id="main-content-wp" class="clearfix category-product-page">
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
                <div class="section" id="list-product-wp">
                    <div class="section-head clearfix">
                        <h3 class="section-title fl-left">Sản phẩm</h3>
                        <div class="filter-wp fl-right">
                            <p class="desc">Hiển thị {{ $productCount }} sản phẩm</p>
                            <div class="form-filter">
                                <form method="GET" action="{{ route('Product.index') }}">
                                    <select name="select">
                                        <option value="0">Sắp xếp</option>
                                        <option value="1"
                                            {{ request()->input('select') == 1 ? 'selected=selected' : '' }}>Giá
                                            cao xuống thấp</option>
                                        <option value="2"
                                            {{ request()->input('select') == 2 ? 'selected=selected' : '' }}>Giá
                                            thấp lên cao</option>
                                    </select>
                                    <button type="submit">Lọc</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="section-detail">
                        <ul class="list-item clearfix">

                            @if ($products->count() > 0)
                                @foreach ($products as $product)
                                    <!-- Hiển thị danh sách sản phẩm -->
                                    <li>
                                        <a href="{{ route('Product.detail', $product->slug) }}" title=""
                                            class="thumb">
                                            <img src="{{ asset($product->img) }}">
                                        </a>
                                        <a href="{{ route('Product.detail', $product->slug) }}" title=""
                                            class="product-name">{{ $product->title }}</a>
                                        <div class="price">
                                            <span class="new">{{ number_format($product->price, 0, '.', ',') }}đ</span>
                                            {{-- <span class="old">{{ number_format($product->price_old, 0, '.', ',') }}đ</span> --}}
                                        </div>
                                        <div class="action clearfix">
                                            <a href="{{ route('Cart.add', $product->id) }}" title="Thêm giỏ hàng"
                                                class="add-cart fl-left">Thêm giỏ
                                                hàng</a>
                                            <a href="{{ route('Product.detail', $product->slug) }}" title="Mua ngay"
                                                class="buy-now fl-right">Mua ngay</a>
                                        </div>
                                    </li>
                                @endforeach
                            @else
                                <!-- Hiển thị thông báo khi không có sản phẩm -->
                                <p>Không có sản phẩm.</p>
                            @endif




                        </ul>
                    </div>
                </div>
                <div class="section" id="paging-wp">
                    <div class="section-detail">
                        <ul class="list-item clearfix">
                            {{ $products->links() }}
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
                                    <a
                                        href="{{ route('Product_slug.index', $parent_category->slug) }}">{{ $parent_category->title }}</a>
                                    @php
                                        $subCategories = $Category->where('product_id', $parent_category->id);
                                    @endphp
                                    @if ($subCategories->isNotEmpty())
                                        <ul class="sub-menu">
                                            @foreach ($subCategories as $category)
                                                <li>
                                                    <a
                                                        href="{{ route('Product_slug.index', $category->slug) }}">{{ $category->title }}</a>
                                                </li>
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

                                                <span
                                                    class="new">{{ number_format($info_product->price, 0, ',', '.') }}đ</span>
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
                            <img src="{{ asset('client/images/banner.png') }}" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
