@extends('layouts.client')
@section('content')
    <div id="main-content-wp" class="checkout-page">
        <div class="section" id="breadcrumb-wp">
            <div class="wp-inner">
                <div class="section-detail">
                    <ul class="list-item clearfix">
                        <li>
                            <a href="?page=home" title="">Trang chủ</a>
                        </li>
                        <li>
                            <a href="" title="">Thanh toán</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div id="wrapper" class="wp-inner clearfix">
            @if (session('status'))
                <div class="alert alert-primary" role="alert">
                    {!! session('status') !!}
                </div>
            @endif
            <div class="section" id="customer-info-wp">
                <div class="section-head">
                    <h1 class="section-title">Thông tin khách hàng</h1>
                </div>
                <div class="section-detail">
                    <form method="POST" action="{{ route('Checkout.add') }}" name="form-checkout">
                        @csrf
                        <div class="form-row clearfix">
                            <div class="form-col fl-left">
                                <label for="fullname">Họ tên</label>
                                <input type="text" name="fullname" id="fullname" value="{{ old('fullname') }}">
                                @error('fullname')
                                    <small style="color:red">{{ $message }} </small>
                                @enderror
                            </div>
                            <div class="form-col fl-right">
                                <label for="email">Email</label>
                                <input type="email" name="email" id="email" value="{{ old('email') }}">
                                @error('email')
                                    <small style="color:red">{{ $message }} </small>
                                @enderror
                            </div>
                        </div>
                        <div class="form-row clearfix">
                            <div class="form-col fl-left">
                                <label for="address">Địa chỉ</label>
                                <input type="text" name="address" id="address" value="{{ old('address') }}">
                                @error('address')
                                    <small style="color:red">{{ $message }} </small>
                                @enderror
                            </div>
                            <div class="form-col fl-right">
                                <label for="phone">Số điện thoại</label>
                                <input type="tel" name="phone" id="phone" value="{{ old('phone') }}">
                                @error('phone')
                                    <small style="color:red">{{ $message }} </small>
                                @enderror
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-col">
                                <label for="note">Ghi chú</label>
                                <textarea name="note" id="note" rows="4" cols="50">{{ old('note') }}</textarea>
                                @error('note')
                                    <small style="color:red">{{ $message }} </small>
                                @enderror
                            </div>
                        </div>



                </div>
            </div>
            <div class="section" id="order-review-wp">
                <div class="section-head">
                    <h1 class="section-title">Thông tin đơn hàng</h1>
                </div>
                <div class="section-detail">
                    <table class="shop-table">
                        <thead>
                            <tr>
                                <td>Sản phẩm</td>
                                <td>Tổng</td>
                            </tr>
                        </thead>
                        <tbody>
                            @if (Cart::count() > 0)
                                @foreach (Cart::content() as $item)
                                    <tr class="cart-item">
                                        <td class="product-name" name='product_name'>{{ $item->name }}<strong
                                                class="product-quantity">x
                                                {{ $item->qty }}</strong>
                                        </td>
                                        <td class="product-total" name='price'>{{ $item->price }}đ</td>
                                        <td><img src="{{ $item->options->img }}" alt="">123</td>
                                    </tr>
                                @endforeach
                            @endif


                        </tbody>
                        <tfoot>
                            <tr class="order-total">
                                <td>Tổng đơn hàng:</td>
                                <td><strong class="total-price" name='total_price'>{{ Cart::total() }}đ</strong></td>
                            </tr>
                        </tfoot>
                    </table>
                    <div id="payment-checkout-wp">
                        <ul id="payment_methods">
                            <li>
                                <input type="radio" id="direct-payment" name="payment_method" value="direct-payment">
                                <label for="direct-payment">Thanh toán tại cửa hàng</label>
                            </li>
                            <li>
                                <input type="radio" id="payment-home" name="payment_method" value="payment-home">
                                <label for="payment-home">Thanh toán tại nhà</label>
                            </li>
                        </ul>
                        @error('payment_method')
                            <small style="color:red">{{ $message }} </small>
                        @enderror
                    </div>
                    <div class="place-order-wp clearfix">
                        <input type="submit" id="order-now" value="Đặt hàng">
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
