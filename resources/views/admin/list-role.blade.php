@extends('layouts.admin')
@section('content')
    @if (session('status'))
        <div class="alert alert-primary" role="alert">
            {!! session('status') !!}
        </div>
    @endif
    <div id="content" class="container-fluid">
        <div class="card">
            {{-- @php
                dd($role);
            @endphp --}}
            <div class="card-header font-weight-bold d-flex justify-content-between align-items-center">
                <h5 class="m-0 ">Danh sách vai trò</h5>
                <div class="form-search form-inline">
                    <form action="#">
                        <input type="" class="form-control form-search" placeholder="Tìm kiếm">
                        <input type="submit" name="btn-search" value="Tìm kiếm" class="btn btn-primary">
                    </form>
                </div>
            </div>
            <div class="card-body">
                <div class="form-action form-inline py-3">
                    <select class="form-control mr-1" id="">
                        <option>Chọn</option>
                        <option>Tác vụ 1</option>
                        <option>Tác vụ 2</option>
                    </select>
                    <input type="submit" name="btn-search" value="Áp dụng" class="btn btn-primary">
                </div>
                <table class="table table-striped table-checkall">
                    <thead>
                        <tr>
                            <th scope="col">
                                <input name="checkall" type="checkbox">
                            </th>
                            <th scope="col">#</th>
                            <th scope="col">Vai trò</th>
                            <th scope="col">Mô tả</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Tác vụ</th>
                        </tr>
                    </thead>
                    <tbody>

                        @if ($role->count() > 0)
                            @foreach ($role as $item)
                                <tr>
                                    <td>
                                        <input type="checkbox">
                                    </td>
                                    <td scope="row">2</td>
                                    <td><a href="">{{ $item->title }}</a></td>
                                    <td>{{ $item->description }}</td>
                                    <td>{{ $item->created_at }}</td>
                                    <td><a href="{{ route('Role.edit', $item->id) }}"
                                            class="btn btn-success btn-sm
                        rounded-0" type="button"
                                            data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                class="fa fa-edit"></i></a>
                                        <a href="{{ route('Role.delete', $item->id) }}"
                                            class="btn btn-danger btn-sm rounded-0 text-white delete_Product mb-0"
                                            type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                class="fa fa-trash"></i></a>


                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <p>không có bản ghi nào</p>
                        @endif



                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td scope="row">2</td>
                            <td><a href="">Content Manager</a></td>
                            <td>Quản lý phát triển nội dung</td>
                            <td>26:06:2025 14:00</td>
                            <td><button class="btn btn-success btn-sm rounded-0" type="button" data-toggle="tooltip"
                                    data-placement="top" title="Edit"><i class="fa fa-edit"></i></button>
                                <button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip"
                                    data-placement="top" title="Delete"><i class="fa fa-trash"></i></button>
                            </td>
                        </tr>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
@endsection
