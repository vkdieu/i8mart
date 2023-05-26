@extends('layouts.client')
@section('content')
    <div id="main-content-wp" class="cart-page">
        <div class="section" id="breadcrumb-wp">
            <div class="wp-inner">
                <div class="section-detail">
                    <ul class="list-item clearfix">
                        <li>
                            <a href="?page=home" title="">Trang chủ</a>
                        </li>
                        <li>
                            <a href="" title="">Sản phẩm làm đẹp da</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="wrapper" class="wp-inner clearfix">
            <div class="section" id="info-cart-wp">
                <div class="section-detail table-responsive">
                    @if (session('status'))
                        <div class="alert alert-primary" role="alert">
                            {!! session('status') !!}
                        </div>
                    @endif
                    <form action="{{ route('Cart.update') }}" method="post">
                        @csrf
                        <table class="table">
                            <thead>
                                <tr>
                                    <td>Tên sản phẩm</td>
                                    <td>Ảnh sản phẩm</td>
                                    <td>Giá sản phẩm</td>
                                    <td>Số lượng</td>
                                    <td colspan="2">Thành tiền</td>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach (Cart::content() as $item)
                                    <tr>
                                        <td><a href="{{ route('Product.detail', $item->id) }}">{{ $item->name }}</a></td>
                                        <td>
                                            <a href="{{ route('Product.detail', $item->id) }}" title=""
                                                class="thumb">
                                                <img src="{{ asset($item->options->image) }}" alt="">
                                            </a>
                                        </td>

                                        <td>{{ number_format($item->price, 0, ',', '.') }}</td>
                                        <td>
                                            <input type="number" name="qty[{{ $item->rowId }}]" min="1"
                                                value="{{ $item->qty }}" data-id="{{ $item->rowId }}" class="num-order">
                                        </td>
                                        {{-- <td>
                                        <input type="number" data-id="{{ $row->rowId }}" name="qty[{{ $row->rowId }}]"
                                            min=1 max="{{ product::find($row->id)->qty }}" value="{{ $row->qty }}"
                                            class="num-order">
                                    </td> --}}


                                        <td id="total_price_{{ $item->rowId }}">
                                            {{ number_format($item->price * $item->qty) }}đ</td>
                                        <td>
                                            <a href="{{ route('Cart.delete', $item->rowId) }}" title=""
                                                class="del-product"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                    </tr>
                                @endforeach
                    </form>

                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="7">
                                <div class="clearfix">
                                    <p id="total" class="fl-right">Tổng giá:
                                        <span>{{ Cart::total() }}đ</span>
                                    </p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <div class="clearfix">
                                    <div class="fl-right">

                                        <a href="{{ route('Checkout.index') }}" title="" id="checkout-cart">Thanh
                                            toán</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                    </table>
                </div>
            </div>
            <div class="section" id="action-cart-wp">
                <div class="section-detail">
                    <p class="title">Click vào <span>“Cập nhật giỏ hàng”</span> để cập nhật số lượng. Nhập vào số lượng
                        <span>0</span> để xóa sản phẩm khỏi giỏ hàng. Nhấn vào thanh toán để hoàn tất mua hàng.
                    </p>
                    <a href="{{ route('Home.index') }}" title="" id="buy-more">Mua tiếp</a><br />
                    <a href="{{ route('Cart.destroy') }}" title="" id="delete-cart">Xóa giỏ hàng</a>
                </div>
            </div>
        </div>
    </div>
@endsection
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    var url = "{{ route('Cart.update') }}";
    $(document).ready(function() {
        $(".num-order").change(function(e) {
            e.preventDefault();

            var id = $(this).attr('data-id');
            var qty = $(this).val();
            var numorder = $(this).attr('data-price');

            console.log(numorder);
            // console.log(price);


            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                method: 'post',
                url: url,
                data: {
                    id: id,
                    qty: qty,
                },
                dataType: 'json',
                success: function(data) {

                    console.log(data)
                    $('#total').text(data.total + 'đ');
                    $('#total_price_' + id).text(data.total_product + 'đ');

                }
            });
        });
    });
</script>
