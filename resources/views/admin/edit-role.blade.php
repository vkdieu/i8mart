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
                <h5 class="m-0 ">Thêm mới vai trò</h5>
                <div class="form-search form-inline">
                    <form action="#">
                        <input type="" class="form-control form-search" placeholder="Tìm kiếm">
                        <input type="submit" name="btn-search" value="Tìm kiếm" class="btn btn-primary">
                    </form>
                </div>
            </div>
            <div class="card-body">
                <form action="{{ route('Role.update', $role->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="form-group">
                        <label class="text-strong" for="name">Tên vai trò</label>
                        <input class="form-control" type="text" name="name" id="name"
                            value="{{ old('name', $role->title) }}">
                        @error('name')
                            <small style="color: red">{{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label class="text-strong" for="description">Mô tả</label>
                        <textarea class="form-control" type="text" name="description" id="description">{{ old('description', $role->description) }}</textarea>
                    </div>
                    <strong>Vai trò này có quyền gì?</strong>
                    <small class="form-text text-muted pb-2">Check vào module hoặc các hành động bên dưới để chọn
                        quyền.</small>
                    <!-- List Permission  -->

                    <div class="card my-4 border">
                        @foreach ($Permissions as $key => $item)
                            <div class="card-header">
                                <input type="checkbox" class="check-all" name="" id="{{ $key }}">
                                <label for="{{ $key }}" class="m-0">Module {{ $key }}</label>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    @foreach ($item as $item1)
                                        <div class="col-md-3">
                                            @php
                                                $isChecked = in_array($item1->id, $permissionIds); // Kiểm tra xem quyền đã được chọn hay chưa
                                                // dd($permissionIds);
                                            @endphp
                                            <input type="checkbox" class="permission" value="{{ $item1->id }}"
                                                name="permission_id[]"
                                                id="{{ $item1->slug }} "{{ $isChecked ? 'checked' : '' }}>
                                            <label for="{{ $item1->slug }}">{{ $item1->title }}</label>
                                        </div>
                                    @endforeach

                                </div>
                            </div>
                        @endforeach
                    </div>

                    <input type="submit" name="btn-add" class="btn btn-primary" value="Cập nhập">
                </form>
            </div>
        </div>
    </div>
@endsection

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $('.check-all').click(function() {
        $(this).closest('.card').find('.permission').prop('checked', this.checked);
    });
</script>
