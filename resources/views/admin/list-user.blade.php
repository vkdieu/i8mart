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
                <h5 class="m-0 ">Danh sách thành viên</h5>
                <div class="form-search form-inline">
                    <form action="#" class="d-flex" method="GET">
                        <input type="" class="form-control form-search  mr-1 " placeholder="Tìm kiếm">
                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-primary">
                    </form>
                </div>
            </div>
            <div class="card-body">
                <div class="analytic">
                    <a href="{{ request()->fullurlWithQuery(['status' => 'active']) }} " class="text-primary">Kích hoạt<span
                            class="text-muted">({{ $active_count }})</span></a>
                    <a href="{{ request()->fullurlWithQuery(['status' => 'trash']) }} " class="text-primary">Vô hiệu
                        hóa<span class="text-muted">({{ $trash_count }})</span></a>
                </div>
                <form action="{{ route('User.action') }}" method="post">
                    @csrf
                    <div class="form-action form-inline py-3">
                        <select class="form-control mr-1" id="" name="action">
                            <option value="">Chọn</option>

                            <option value="delete">Xóa</option>
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
                                <th scope="col">Họ tên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Quyền</th>
                                <th scope="col">Ngày tạo</th>
                                <th scope="col">Tác vụ</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if ($Users->count() > 0)
                                @php
                                    $t = 0;
                                @endphp


                                @foreach ($Users as $item)
                                    @php
                                        $t++;
                                    @endphp
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="items[]" value="{{ $item->id }}">
                                        </td>
                                        <th scope="row">{{ $t }}</th>
                                        <td>{{ $item->name }}</td>
                                        <td>{{ $item->email }}</td>
                                        @foreach ($item->roles as $role)
                                            <td class="badge badge-warning ml-2 mt-2 ">{{ $role->title }}</td>
                                        @endforeach
                                        <td>{{ $item->created_at }}</td>
                                        <td>
                                            <a href="{{ route('User.edit', $item->id) }}"
                                                class="btn btn-success btn-sm rounded-0 text-white" type="button"
                                                data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                    class="fa fa-edit"></i></a>
                                            @if (Auth::user()->id != $item->id)
                                                <a href="{{ route('User.delete', $item->id) }}"
                                                    class="btn btn-danger btn-sm rounded-0 text-white" type="button"
                                                    data-toggle="tooltip" data-placement="top" title="Delete"><i
                                                        class="fa fa-trash"></i></a>
                                            @endif

                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <div class="alert alert-primary" role="alert">
                                    <p>không có bản ghi nào</p>
                                </div>
                            @endif



                        </tbody>
                    </table>
                    {{ $Users->links() }}
            </div>
            </form>
        </div>
    </div>
@endsection
