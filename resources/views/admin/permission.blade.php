@extends('layouts.admin')
@section('content')
    <div id="content" class="container-fluid">
        @if (session('status'))
            <div class="alert alert-primary" role="alert">
                {!! session('status') !!}
            </div>
        @endif
        <div class="row">

            <div class="col-4">
                <div class="card">

                    <div class="card-header font-weight-bold">
                        Thêm quyền
                    </div>
                    <div class="card-body">
                        <form action="{{ route('Permission.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="name">Tên quyền</label>
                                <input class="form-control" type="text" name="name" id="name">
                                @error('name')
                                    <small style="color:red
                                    ">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <small class="form-text text-muted pb-2">Ví dụ: posts.add</small>
                                <input class="form-control" type="text" name="slug" id="slug">
                                @error('slug')
                                    <small style="color:red
                                    ">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả</label>
                                <textarea class="form-control" type="text" name="description" id="description"> </textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </form>
                    </div>
                </div>
            </div>
            @if ($Permissions->count() > 0)
                <div class="col-8">
                    <div class="card">
                        <div class="card-header font-weight-bold">
                            Danh sách quyền
                        </div>
                        <div class="card-body">
                            <table class="table table-striped ">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tên quyền</th>
                                        <th scope="col">Slug</th>
                                        <th scope="col">Tác vụ</th>
                                        <!-- <th scope="col">Mô tả</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $t = 1;
                                    @endphp
                                    @foreach ($Permissions as $key => $item)
                                        <tr>
                                            <td scope="row"></td>
                                            <td><strong>{{ ucfirst($key) }}</strong></td>
                                            <td></td>
                                            <!-- <td></td> -->
                                        </tr>
                                        @foreach ($item as $item1)
                                            <tr>
                                                <td scope="row">{{ $t++ }}</td>
                                                <td>|---{{ $item1->title }}</td>
                                                <td>|---{{ $item1->slug }}</td>
                                                <td><a href="{{ route('Permission.edit', $item1->id) }}"
                                                        class="btn btn-success btn-sm
                                                rounded-0"
                                                        type="button" data-toggle="tooltip" data-placement="top"
                                                        title="Edit"><i class="fa fa-edit"></i></a>
                                                    <a href="{{ route('Permission.delete', $item1->id) }}  "
                                                        onclick="return confirm('Bạn có chắc chắn muốn xóa quyền này?')"
                                                        class="btn btn-danger btn-sm rounded-0 text-white delete_Page mb-0"
                                                        type="button" data-toggle="tooltip" data-placement="top"
                                                        title="Edit"><i class="fa fa-trash"></i></a>


                                                </td>
                                            </tr>
                                        @endforeach
                                    @endforeach

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            @else
                <p>không có bản ghi</p>
            @endif

        </div>

    </div>
@endsection
