@extends('layouts.admin')
@section('content')
    <div id="content" class="ontainer-fluid">
        @if (session('status'))
            <div class="alert alert-success">{{ session('status') }}</div>
        @endif

        <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-header font-weight-bold ">
                        Thêm Slide
                    </div>
                    <div class="card-body">
                        <form action="{{ route('Slide.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">

                                <label for="name" class="text-warning font-weight-bold">Tên Slide</label>
                                <input class="form-control" type="text" name="name" id="name" value="">
                                @error('name')
                                    <samp class="text-danger">{{ $message }}</samp>
                                @enderror
                            </div>
                            <input type="file" name="file" id=""><br><br>
                            @error('file')
                                <samp class="text-danger">{{ $message }}</samp>
                            @enderror
                            <button type="submit" class="btn btn-primary" name="addcat" value="Cập Nhập">Thêm mới</button>
                    </div>
                </div>
            </div>
            </form>

            <div class="col-8">
                <div class="card">
                    <div class="card-header font-weight-bold">
                        Danh mục Slide
                    </div>


                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>

                                    <th scope="col">Stt</th>

                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">NGÀY TẠO</th>
                                    <th scope="col">Tác vụ</th>

                                </tr>
                            </thead>

                            <tbody>
                                @php
                                    $t = 1;
                                @endphp
                                <tr>
                                    @foreach ($slides as $slide)
                                        <th>{{ $t++ }}</th>
                                        <td><img style="width :200px" src="{{ asset($slide->images) }}" alt=""></td>
                                        <td>{{ $slide->created_at }}</td>
                                        <td>
                                            <a href="{{ route('Slide.edit', $slide->id) }}"
                                                class="btn btn-success btn-sm rounded-0 text-white" type="button"
                                                data-toggle="tooltip" data-placement="top" title="Edit"><i
                                                    class="fa fa-edit"></i></a>

                                            <a href="{{ route('Slide.delete', $slide->id) }}"
                                                onclick="return confirm('bạn có muốn xóa bài viết')"
                                                class="btn btn-danger btn-sm rounded-0 text-white" type="button"
                                                data-toggle="tooltip" data-placement="top" title="Delete"><i
                                                    class="fa fa-trash"></i></a>
                                        </td>


                                </tr>
                                @endforeach


                            </tbody>
                            <td> {{ $slides->links() }}</td>
                        @endsection
