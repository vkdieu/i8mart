@extends('layouts.admin')
@section('content')
    <script>
        var editor_config = {
            path_absolute: "http://localhost/laravel-unitop/",
            selector: "textarea",
            plugins: [
                "advlist autolink lists link image charmap print preview hr anchor Pagebreak",
                "searchreplace wordcount visualblocks visualchars code fullscreen",
                "insertdatetime media nonbreaking save table contextmenu directionality",
                "emoticons template paste textcolor colorpicker textpattern"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
            relative_urls: false,
            file_browser_callback: function(field_name, url, type, win) {
                var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName(
                    'body')[0].clientWidth;
                var y = window.innerHeight || document.documentElement.clientHeight || document
                    .getElementsByTagName('body')[0].clientHeight;

                var cmsURL = editor_config.path_absolute + 'laravel-filemanager?field_name=' + field_name;
                if (type == 'image') {
                    cmsURL = cmsURL + "&type=Images";
                } else {
                    cmsURL = cmsURL + "&type=Files";
                }

                tinyMCE.activeEditor.windowManager.open({
                    file: cmsURL,
                    title: 'Filemanager',
                    width: x * 0.8,
                    height: y * 0.8,
                    resizable: "yes",
                    close_previous: "no"
                });
            }
        };

        tinymce.init(editor_config);
    </script>
    <style>
        .red {
            color: red
        }
    </style>
    <div id="content" class="container-fluid">
        <div class="card">
            <div class="card-header font-weight-bold">
                Thêm sản phẩm
            </div>
            <div class="card-body">
                <form action="{{ route('Product.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="name">Tên sản phẩm</label>
                                <input class="form-control" type="text" name="title" id="name"
                                    value="{{ old('title') }}">
                                @error('title')
                                    <small class="red"> {{ $message }}</small>
                                @enderror
                            </div>



                            <div class="form-group">
                                <label for="name">Giá</label>
                                <input class="form-control" type="text" name="price" id="name"
                                    value="{{ old('price') }}">
                                @error('price')
                                    <small class="red"> {{ $message }}</small>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="name">Giá cũ ( Nếu có)</label>
                                <input class="form-control" type="text" name="price_old" id="name"
                                    value="{{ old('price_old') }}">
                                @error('price_old')
                                    <small class="red"> {{ $message }}</small>
                                @enderror
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="intro">Mô tả sản phẩm</label>
                                <textarea name="describe" class="form-control" id="intro" cols="30" rows="5">{{ old('describe') }}</textarea>
                                @error('describe')
                                    <small class="red"> {{ $message }}</small>
                                @enderror
                            </div>

                        </div>
                    </div>


                    <div class="form-group">
                        <label for="intro">Chi tiết sản phẩm</label>
                        <textarea name="detail" class="form-control" id="intro" cols="30" rows="5">{{ old('detail') }}</textarea>
                        @error('detail')
                            <small class="red"> {{ $message }}</small>
                        @enderror
                    </div>


                    <div class="form-group">
                        <label for="">Danh mục</label>
                        <select class="form-control" id="" name="select">
                            <option value="0">Chọn danh mục</option>
                            @php
                                showCategories_slect($category_product);
                                
                            @endphp

                        </select>
                        @error('select')
                            <small style="color: red">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="file">Ảnh đại diện</label><br>
                                <input type="file" id="file" name="img"><br>
                                @error('img')
                                    <small class="red"> {{ $message }}</small>
                                @enderror
                            </div>

                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="file">Ảnh mô tả</label><br>
                                <input type="file" id="file" name="img_describe[]" multiple><br>
                                @error('img_describe')
                                    <small class="red"> {{ $message }}</small>
                                @enderror
                            </div>

                        </div>


                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="customCheck" name="outstanding">
                        <label class="custom-control-label" for="customCheck">Sản phẩm nổi bật</label>
                    </div>
                    <div class="form-group">
                        <label for="">Trạng thái</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="status" value="stocking"
                                checked>
                            <label class="form-check-label" for="status">
                                Còn Hàng
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="status2"
                                value="out_of_stock">
                            <label class="form-check-label" for="status2">
                                Hết Hàng
                            </label>
                        </div>
                    </div>



                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                </form>
            </div>
        </div>
    </div>
@endsection
