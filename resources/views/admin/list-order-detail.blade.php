@extends('layouts.admin')
@section('content')
    <div id="content" class="container-fluid">
        <div class="card">
            <div class="card-header font-weight-bold d-flex align-items-center">
                <h5 class="m-0 mr-5"><a href="">Thông tin đơn hàng</a></h5>
            </div>
            <div class="card-body" id="detail-order">
                <h5>Thông tin khách hàng</h5>
                <table class="table table-bordered">
                    <thead>
                        <tr style="background-color: rgb(247, 242, 242)">
                            <th class="text-center">Mã đơn hàng</th>
                            <th class="text-center">Họ và tên</th>
                            <th class="text-center">Số điện thoại</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Địa chỉ</th>
                            <th class="text-center">Thời gian đặt hàng</th>
                            <th class="text-center">Ghi chú</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td style="width:14%;" class="text-center">ISM-65UY2BJFCAG</td>
                            <td style="width:10%;" class="text-center">{{ $Order->fullname }}</td>
                            <td style="width:8%;" class="text-center">{{ $Order->phone }}</td>
                            <td style="width:15%;" class="text-center">{{ $Order->email }}</td>
                            <td style="width:30%;" class="text-center">{{ $Order->address }}
                            </td>
                            <td style="width:12%;" class="text-center">{{ $Order->created_at }}</td>
                            <td style="width:10%;"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="  mt-3">
                    <div class="row">
                        <div class="col-md-6">
                            <h5>Trạng thái đơn hàng:
                                <span style="font-size: 14px" class="badge badge-warning">{{ $Order->status }}</span>
                            </h5>
                            <div class="form-action form-inline py-2">
                                <form action="{{ route('Order.action_detai', $Order->id) }}" method="post">
                                    @csrf
                                    <select name="action" class="form-control mr-2">
                                        @foreach ($action as $key => $item)
                                            <option value="{{ $key }}">{{ $item }}</option>
                                        @endforeach

                                    </select>
                                    <input type="submit" name="btn-update" value="Cập nhật"
                                        style="padding: 5px 8px;border:1px solid rgb(163, 241, 241);color:aliceblue"
                                        class="rounded bg-primary">
                                </form>
                            </div>
                        </div>
                        <div class="col-md-6" style="">
                            <table class="table table-bordered">
                                @php
                                    $data = json_decode($Order->info_product);
                                    
                                @endphp
                                <thead>
                                    <tr>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-center">Tổng tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">{{ $data[0]->quantity }}</td>
                                        <td class="text-center">{{ $data[0]->total_price }} đ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header font-weight-bold d-flex justify-content-between align-items-center">
                <h5 class="m-0 "><a href="">Chi tiết đơn hàng</a></h5>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr style="border-bottom: 1px solid gray; background-color: rgb(247, 242, 242)">
                            <th class="text-center py-2">Ảnh sản phẩm</th>
                            <th class="text-center">Tên sản phẩm</th>
                            <th class="text-center">Số lượng</th>
                            <th class="text-center">Giá</th>
                            <th class="text-center">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="border-bottom: 1px solid rgb(241, 229, 229);">
                            <td style="width:15%;" class="text-center p-2"><img src="{{ asset($data[0]->image) }}"
                                    alt="" class="img-fluid" style="max-width:110px;"></td>
                            <td style="width:40%;" class="text-center">{{ $data[0]->title }}</td>
                            <td style="width:15%;" class="text-center">{{ $data[0]->quantity }}</td>
                            <td style="width:15%;" class="text-center">{{ $data[0]->price }} đ</td>
                            <td style="width:15%;" class="text-center">{{ $data[0]->total_price }} đ</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
