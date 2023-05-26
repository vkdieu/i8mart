@extends('layouts.admin')
@section('content')
    <div id="content" class="container-fluid">
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif
        <div class="alert alert-success" role="alert">
            Chú ý nếu bạn xáo danh mục sản phẩm cha tất cả danh mục sản phẩm con sẽ bị xóa,tất cả sản phẩm theo danh mục sẽ
            bị xóa
        </div>
        <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-header font-weight-bold">
                        Danh mục sản phẩm
                    </div>
                    <div class="card-body">
                        <form action="{{ route('Category.store') }} " method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="name">Tên danh mục</label>
                                <input class="form-control" type="text" name="name" id="name">
                                @error('name')
                                    <small style="color: red">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="">Danh mục cha</label>
                                <select class="form-control" id="" name="product_id">

                                    <option value="0">Không có danh mục cha</option>


                                    @php
                                        
                                        showCategories_slect($Category);
                                    @endphp

                                </select>
                            </div>




                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-8">
                <div class="card">
                    <div class="card-header font-weight-bold">

                        Danh sách có {{ $count_category }} danh mục

                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Tên danh mục</th>
                                    <th scope="col">Slug</th>




                                    <th scope="col">Tác vụ</th>
                                </tr>
                            </thead>
                            <tbody>

                                @if ($count_category > 0)
                                    @php
                                        showCategories($list_category);
                                    @endphp
                                @else
                                    <div class="alert alert-primary" role="alert">
                                        <p>không có bản ghi nào</p>
                                    </div>
                                @endif

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection
