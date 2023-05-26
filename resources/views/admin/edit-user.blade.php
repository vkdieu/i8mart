@extends('layouts.admin')
@section('content')
    <style>
        select option[selected] {
            color: red;
        }
    </style>
    <div id="content" class="container-fluid">
        <div class="card">
            <div class="card-header font-weight-bold">
                Thêm người dùng
            </div>
            <div class="card-body">
                <form action="{{ route('User.store') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="name">Họ và tên</label>
                        <input class="form-control" type="text" name="name" id="name"
                            value="{{ old('name', $User->name) }}">
                        @error('name')
                            <small class="red"> {{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control" type="text" name="email" id="email">
                        @error('email')
                            <small class="red"> {{ $message }}</small>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input class="form-control" type="password" name="password" id="email">
                        @error('password')
                            <small class="red"> {{ $message }}</small>
                        @enderror
                    </div>

                    <div class="form-group multiple=true">
                        <label for="">Nhóm quyền</label>
                        <select class="form-control tag" id="" name="permission_id[]" multiple>

                            <option value="0">Chọn quyền</option>


                            @foreach ($role as $item)
                                <option value="{{ $item->id }}"
                                    {{ in_array($item->id, $userPermissions) ? 'selected' : '' }}>{{ $item->title }}
                                </option>
                            @endforeach

                        </select>
                    </div>


                    <button type="submit" class="btn btn-primary">Thêm mới</button>
                </form>
            </div>
        </div>
    </div>
@endsection
