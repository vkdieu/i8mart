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
    <div id="content" class="container-fluid">
        <div class="card">
            <div class="card-header font-weight-bold">
                Thêm bài viết
            </div>
            <div class="card-body">
                <form action="{{ route('Page.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">

                        <label for="title">Tên trang</label>
                        <input class="form-control" type="text" name="title" id="name"
                            value="{{ old('title') }}">
                        @error('title')
                            <small style="color: red">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="content">Nội dung trang</label>
                        <textarea class="form-control" id="content" cols="30" rows="5" name="content" value="{{ old('content') }}"></textarea>
                    </div>
                    @error('content')
                        <small style="color: red">{{ $message }}</small>
                    @enderror


                    {{-- <div class="form-group">
                        <label for="detail">Hình ảnh</label><br /><br />
                        <input type="file" name="file">
                        @error('file')
                            <small style="color: red">{{ $message }}</small>
                        @enderror
                        <div id="show_list_file">
                        </div>
                    </div> --}}

                    <div class="form-group">
                        <label for="">Trạng thái</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="exampleRadios1" value="Chờ duyệt"
                                name="status" checked>
                            <label class="form-check-label" for="exampleRadios1">
                                Chờ duyệt
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="exampleRadios2" value="Công khai"
                                name="status">
                            <label class="form-check-label" for="exampleRadios2">
                                Công khai
                            </label>
                        </div>
                    </div>



                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                </form>
            </div>
        </div>
    </div>
@endsection
<script>
    $(function() {
        var inputFile = $('#file');
        $('#upload_single_bt').click(function(event) {
            var URI_single = $('#form-upload-single #file').attr('data-uri');
            var fileToUpload = inputFile[0].files[0];
            var formData = new FormData();
            formData.append('file', fileToUpload);
            $.ajax({
                url: '{{ route('Page.store') }}',
                type: 'post',
                data: formData,
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function(data) {
                    console.log(data);


                    $('#show_list_file').val(data.thunbnail);


                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
            return false;
        });



    });
</script>
