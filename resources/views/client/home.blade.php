@extends('layouts.client')
@section('content')
    <style>
        #feature-product-wp .list-item li,
        #same-category-wp .list-item li {
            background: #fff;
            padding: 10px 10px 30px 10px;
            margin: 0% 2%;
            height: 332px;
        }

        #slider-wp .item img {
            width: 100% !important;
            height: 384px;
        }
    </style>
    @php
        use App\Models\Category;
        use App\Models\Product;
        
    @endphp

    <div id="main-content-wp" class="home-page clearfix">
        <div class="wp-inner">
            <div class="main-content fl-right">
                <div class="section" id="slider-wp">
                    <div class="section-detail">
                        @foreach ($Slides as $slide)
                            <div class="item">
                                <img src="{{ asset($slide->images) }}" alt="">
                            </div>
                        @endforeach


                    </div>
                </div>
                <div class="section" id="support-wp">
                    <div class="section-detail">
                        <ul class="list-item clearfix">
                            <li>
                                <div class="thumb">
                                    <img src="{{ asset('client/images/icon-1.png') }}">
                                </div>
                                <h3 class="title">Miễn phí vận chuyển</h3>
                                <p class="desc">Tới tận tay khách hàng</p>
                            </li>
                            <li>
                                <div class="thumb">
                                    <img src="{{ asset('client/images/icon-2.png') }}">
                                </div>
                                <h3 class="title">Tư vấn 24/7</h3>
                                <p class="desc">1900.9999</p>
                            </li>
                            <li>
                                <div class="thumb">
                                    <img src="{{ asset('client/images/icon-3.png') }}">
                                </div>
                                <h3 class="title">Tiết kiệm hơn</h3>
                                <p class="desc">Với nhiều ưu đãi cực lớn</p>
                            </li>
                            <li>
                                <div class="thumb">
                                    <img src="{{ asset('client/images/icon-4.png') }}">
                                </div>
                                <h3 class="title">Thanh toán nhanh</h3>
                                <p class="desc">Hỗ trợ nhiều hình thức</p>
                            </li>
                            <li>
                                <div class="thumb">
                                    <img src="{{ asset('client/images/icon-5.png') }}">
                                </div>
                                <h3 class="title">Đặt hàng online</h3>
                                <p class="desc">Thao tác đơn giản</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="section" id="feature-product-wp">
                    <div class="section-head">
                        <h3 class="section-title">Sản phẩm nổi bật</h3>
                    </div>
                    <div class="section-detail">
                        <ul class="list-item">

                            @foreach ($product_outstanding as $item)
                                <li>

                                    <a href="{{ route('Product.detail', $item->slug) }}" title="" class="thumb">
                                        <img src="{{ asset($item->img) }}">
                                    </a>
                                    <a href="{{ route('Product.detail', $item->slug) }}" title=""
                                        class="product-name">{{ $item->title }}</a>
                                    <div class="price">
                                        <span class="new">{{ number_format($item->price, 0, ',', '.') }}đ</span>
                                        {{-- <span class="old">6.190.000đ</span> --}}
                                    </div>
                                    <div class="action clearfix">
                                        <a href="{{ route('Cart.add', $item->id) }}" title=""
                                            class="add-cart fl-left">Thêm giỏ
                                            hàng</a>
                                        <a href="{{ route('Product.detail', $item->slug) }}" title=""
                                            class="buy-now fl-right">Xem chi tiết</a>
                                    </div>
                                </li>
                            @endforeach

                        </ul>
                    </div>
                </div>
                <div class="section" id="list-product-wp">
                    <div class="section-head">

                        <div class="section" id="list-product-wp">
                            <div class="section-head">

                                @foreach ($parent_categorys as $category)
                                    @php
                                        // lấy các thằng có product_id= id category rồi tham chiếu đến bảng id lấy tất cho vào mảng
                                        $subCategoryIds = Category::where('product_id', $category->id)
                                            ->pluck('id')
                                            ->toArray();
                                        
                                        $products = Product::where('category_id', $category->id)
                                            ->orWhereIn('category_id', $subCategoryIds)
                                            ->get();
                                    @endphp

                                    @if ($products->isNotEmpty())
                                        <h3 class="section-title">{{ $category->title }}</h3>
                                    @endif
                                    <div class="section-detail">
                                        <ul class="list-item clearfix">

                                            @foreach ($products as $product)
                                                <li>
                                                    <a href="{{ route('Product.detail', $product->slug) }}" title=""
                                                        class="thumb">
                                                        <img src="{{ asset($product->img) }}">
                                                    </a>
                                                    <a href="{{ route('Product.detail', $product->slug) }}" title=""
                                                        class="product-name">{{ $product->title }}</a>
                                                    <div class="price">
                                                        <span
                                                            class="new">{{ number_format($product->price, 0, ',', '.') }}đ</span>
                                                        {{-- <span class="old">8.690.000đ</span> --}}
                                                    </div>
                                                    <div class="action clearfix">
                                                        <a href="{{ route('Cart.add', $product->id) }}"
                                                            title="Thêm giỏ hàng" class="add-cart fl-left">Thêm giỏ hàng</a>
                                                        <a href="{{ route('Product.detail', $product->slug) }}"
                                                            title="Mua ngay" class="buy-now fl-right">Xem chi tiết</a>
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endforeach



                            </div>
                        </div>


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
                            <img src="{{ asset('client/images/banner.png') }}" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
