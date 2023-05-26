@extends('layouts.admin')
@section('content')
    <div id="content" class="container-fluid">
        @if (session('status'))
            <div class="alert alert-danger" role="alert">
                {{ session('status') }}
            </div>
        @endif
        {{-- <div class="alert alert-success" role="alert">
            Bạn lưu ý, khi bạn xóa danh mục cha các danh mục con sẽ bị xóa, các sản phẩm theo danh mục cũng sẽ bị xóa
        </div> --}}
        <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-header font-weight-bold">
                        Danh mục sản phẩm
                    </div>
                    <div class="card-body">
                        <form action="{{ route('Post_cat.update', $Post_cat->id) }} " method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="name">Tên danh mục</label>
                                <input class="form-control" type="text" name="name" id="name"
                                    value="{{ old('name', $Post_cat->title) }}">
                                @error('name')
                                    <small style="color: red">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="">Danh mục cha</label>
                                <select class="form-control" id="" name="parent_id">

                                    <option value="0">Không có danh mục cha</option>


                                    @php
                                        
                                        showCategories_post_slect($category_Post);
                                    @endphp

                                </select>
                            </div>




                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
@endsection
