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
                        <form action="{{ route('Permission.update', $Permission->id) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="name">Tên quyền</label>
                                <input class="form-control" type="text" name="name" id="name"
                                    value="{{ old('name', $Permission->title) }}">
                                @error('name')
                                    <small style="color:red
                                    ">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="slug">Slug</label>
                                <small class="form-text text-muted pb-2">Ví dụ: posts.add</small>
                                <input class="form-control" type="text" name="slug" id="slug"
                                    value="{{ old('slug', $Permission->slug) }}">
                                @error('slug')
                                    <small style="color:red ">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả</label>
                                <textarea class="form-control" type="text" name="description" id="description"> </textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Cập nhập</button>
                        </form>
                    </div>
                </div>
            </div>


        </div>

    </div>
@endsection
