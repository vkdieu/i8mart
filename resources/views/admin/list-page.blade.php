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
                <h5 class="m-0 ">Danh sách bài viết</h5>
                <div class="form-search form-inline">
                    <form action="#" method="GET" class="d-flex">
                        <input type="" class="form-control form-search  mr-1 " placeholder="Tìm kiếm" name="search">
                        <input type="submit" name="btn-search" value="Tìm kiếm" class="btn btn-primary">
                    </form>
                </div>
            </div>
            <div class="card-body">
                <div class="analytic">
                    @if (!empty($status))
                        @foreach ($status as $item)
                            <a href="" class="text-primary">{{ $item['status'] }}<span
                                    class="text-muted">{{ $item['count'] }}</span></a>
                        @endforeach
                    @endif

                </div>
                <form action="{{ route('Page.action') }}" method="post">
                    @csrf
                    <div class="form-action form-inline py-3">
                        <select class="form-control mr-1" id="" name='action'>

                            @foreach ($action as $key => $item)
                                {
                                <option value="{{ $key }}">{{ $item }}</option>

                                }
                            @endforeach



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
                                <th scope="col">Ảnh</th>
                                <th scope="col">Tiêu đề</th>
                                <th scope="col">Người tạo</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Ngày tạo</th>
                                <th scope="col">Tác vụ</th>
                            </tr>
                        </thead>
                        <tbody>

                            @if ($list->count() > 0)
                                @php
                                    $t = 0;
                                @endphp
                                @foreach ($list as $item)
                                    @php
                                        $t++;
                                    @endphp
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="items[]" value="{{ $item['id'] }}">
                                        </td>

                                        <td scope="row">{{ $t }}</td>
                                        <td><img style="max-width: 80px; max-height: 80px;"
                                                src="{{ asset($item['thumbnail']) }}" alt=""></td>

                                        <td><a href="">{{ $item['title'] }}</a>
                                        </td>
                                        <td>{{ $item->user['name'] }}</td>
                                        <td>{{ $item['status'] }}</td>

                                        <td>{{ $item['created_at'] }}</td>
                                        <td><a href="{{ route('Page.edit', $item->id) }}"
                                                class="btn btn-success btn-sm
                                            rounded-0"
                                                type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                    class="fa fa-edit"></i></a>
                                            <a href="{{ route('Page.delete', $item->id) }}"
                                                class="btn btn-danger btn-sm rounded-0 text-white delete_Page mb-0"
                                                type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                    class="fa fa-trash"></i></a>


                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <div class="alert alert-primary" role="alert">
                                    <p>không có bản ghi nào</p>
                                </div>
                            @endif

                </form>



                </tbody>
                </table>
                {{ $list->links() }}
            </div>
        </div>
    </div>
@endsection
