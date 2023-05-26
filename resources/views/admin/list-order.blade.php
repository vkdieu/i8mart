@extends('layouts.admin')
@section('content')
    @if (session('status'))
        <div class="alert alert-primary" role="alert">
            {!! session('status') !!}
        </div>
    @endif
    <div id="content" class="container-fluid">
        <div class="card">
            <div class="card-header font-weight-bold d-flex justify-content-between align-items-center">
                <h5 class="m-0 ">Danh sách đơn hàng</h5>
                <div class="form-search form-inline">
                    <form action="#">
                        <input type="" class="form-control form-search" placeholder="Tìm kiếm">
                        <input type="submit" name="btn-search" value="Tìm kiếm" class="btn btn-primary">
                    </form>
                </div>
            </div>
            <div class="card-body">
                <div class="analytic">
                    <a href="{{ request()->fullurlWithQuery(['status' => '']) }} " class="text-primary">Tất cả đơn hàng
                        <span class="text-muted">({{ $all_count }})</span></a>
                    <a href="{{ request()->fullurlWithQuery(['status' => 'pending']) }} " class="text-primary">Đơn hàng
                        mới<span class="text-muted">({{ $pending_count }})</span></a>
                    <a href="{{ request()->fullurlWithQuery(['status' => 'cancel']) }} " class="text-primary">Đơn hàng hủy
                        <span class="text-muted">({{ $cancel_count }})</span></a>
                    <a href="{{ request()->fullurlWithQuery(['status' => 'success']) }} " class="text-primary">Đơn hàng
                        thành công
                        <span class="text-muted">({{ $success_count }})</span></a>
                    <a href="{{ request()->fullurlWithQuery(['status' => 'delivery']) }} " class="text-primary">Đơn hàng
                        đang vẫn chuyển
                        <span class="text-muted">({{ $delivery_count }})</span></a>



                </div>
                <form action="{{ route('Order.action') }}" method="post">
                    @csrf
                    <div class="form-action form-inline py-3">
                        <select class="form-control mr-1" id="" name="action">
                            {{-- @if ($status == 'trash')
                                @foreach ($action1 as $key => $item)
                                    {
                                    <option value="{{ $key }}">{{ $item }}</option>

                                    }
                                @endforeach
                            @else
                                @foreach ($action as $key => $item)
                                    {
                                    <option value="{{ $key }}">{{ $item }}</option>

                                    }
                                @endforeach
                            @endif --}}

                        </select>
                        <input type="submit" name="btn-search" value="Áp dụng" class="btn btn-primary">

                    </div>

                    <table class="table table-striped table-checkall">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" name="checkall">
                                </th>
                                <th scope="col">#</th>
                                <th scope="col">Khách hàng</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Thời gian</th>
                                <th scope="col" class="text-center">Xem thêm</th>

                                <th scope="col">Tác vụ</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($Orders->count() > 0)
                                @php
                                    $t = 0;
                                @endphp
                                @foreach ($Orders as $order)
                                    @php
                                        $info_products = json_decode($order->info_product);
                                    @endphp
                                    @foreach ($info_products as $info_product)
                                        @php
                                            $t++;
                                        @endphp
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="items[]" value="{{ $order->id }}">
                                            </td>
                                            <td>{{ $t }}</td>
                                            <td>
                                                {{ $order->fullname }}
                                            </td>
                                            <td><a href="#">{{ $info_product->total_price }}</a>
                                            </td>
                                            <td class="badge badge-warning badge-pill mt-2 text-center">
                                                {{ $order->status }}</td>
                                            <td>{{ $order->created_at }}</td>
                                            <td class="text-center"><a href="{{ route('Order.detail', $order->id) }}"
                                                    class="text-primary border rounded-circle px-1"><i
                                                        class="fa fa-ellipsis-h" aria-hidden="true"></i></a></td>
                                            <td>

                                                <a href="{{ route('Order.delete', $order->id) }}"
                                                    class="btn btn-danger btn-sm rounded-0 text-white" type="button"
                                                    data-toggle="tooltip" data-placement="top" title="Delete"><i
                                                        class="fa fa-trash"></i></a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endforeach
                            @else
                                <div class="alert alert-primary" role="alert">
                                    <p>không có bản ghi nào</p>
                                </div>
                            @endif
                </form>
                </tbody>


                </table>
                {{ $Orders->links() }}
            </div>
        </div>
    </div>
@endsection
