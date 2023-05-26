@extends('layouts.admin')
@section('content')
    <style>
        .red {
            color: red
        }
    </style>
    <div id="content" class="container-fluid">
        <div class="card">
            <div class="card-header font-weight-bold">
                Cập nhập sản phẩm
            </div>
            <div class="card-body">
                <form action="{{ route('Product.update', $Product->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="name">Tên sản phẩm</label>
                                <input class="form-control" type="text" name="title" id="name"
                                    value="{{ old('title', $Product->title) }}">

                            </div>

                            <div class="form-group">
                                <label for="name">Giá</label>
                                <input class="form-control" type="text" name="price" id="name"
                                    value="{{ old('price', $Product->price) }}">

                            </div>

                            <div class="form-group">
                                <label for="name">Giá cũ ( Nếu có)</label>
                                <input class="form-control" type="text" name="price_old" id="name"
                                    value="{{ old('price_old', $Product->price_old) }}">

                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="intro">Mô tả sản phẩm</label>
                                <textarea name="describe" class="form-control" id="intro" cols="30" rows="5">{{ old('describe', $Product->describe) }}</textarea>

                            </div>

                        </div>
                    </div>


                    <div class="form-group">
                        <label for="intro">Chi tiết sản phẩm</label>
                        <textarea name="detail" class="form-control" id="intro" cols="30" rows="5">{!! old('detail', $Product->detail) !!}</textarea>

                    </div>


                    <div class="form-group">
                        <label for="">Danh mục</label>

                        <select class="form-control" id="" name="select">
                            @foreach ($category_product as $category)
                                <option value="{{ $category->id }}"
                                    {{ $Product->category_id == $category->id ? 'selected' : '' }}>
                                    {{ $category->title }}
                                </option>
                            @endforeach
                        </select>






                    </div>
                    @error('select')
                        <small style="color: red">{{ $message }}</small>
                    @enderror
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="file">Ảnh đại diện</label><br>
                                <input type="file" id="file" name="img"><br>
                                <img src="{{ asset($Product->img) }}" alt="">


                            </div>

                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="file">Ảnh mô tả</label><br>
                                <input type="file" id="file" name="img_describe[]" multiple><br>
                                @foreach ($Product->thumbnail_product as $thumbnail)
                                    <img src="{{ asset($thumbnail->title_img) }}" alt="">
                                @endforeach

                            </div>
                            @error('img_describe')
                                <small class="red"> {{ $message }}</small>
                            @enderror

                        </div>


                    </div>
                    @php
                        $isChecked = $Product->outstanding;
                        
                    @endphp
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck" name="outstanding"
                            {{ $isChecked ? 'checked' : '' }}>
                        <label class="custom-control-label" for="customCheck">Sản phẩm nổi bật</label>
                    </div>
                    <div class="form-group">
                        <label for="">Trạng thái</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="status1" value="stocking"
                                checked>
                            <label class="form-check-label" for="status1">
                                Còn hàng
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="Hết hàng"
                                value="out_of_stock">
                            <label class="form-check-label" for="status2">
                                Hết hàng
                            </label>
                        </div>
                    </div>



                    <button type="submit" class="btn btn-primary">Cập nhập</button>
                </form>
            </div>
        </div>
    </div>
@endsection
