@extends('layouts.admin')
@section('content')
    <div id="content" class="container-fluid">
        @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
        @endif
        <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-header font-weight-bold">
                        Danh mục sản phẩm
                    </div>
                    <div class="card-body">
                        <form action="{{ route('Category.update', $Category->id) }} " method="POST">
                            @csrf
                            <div class="form-group">
                                <label for="name">Tên danh mục</label>
                                <input class="form-control" type="text" name="name" id="name"
                                    value="{{ old('title', $Category->title) }}">
                                {{-- @error('name')
                                    <small style="color: red">{{ $message }}</small>
                                @enderror --}}
                            </div>
                            <div class="form-group">
                                <label for="">Danh mục cha</label>
                                {{-- @php
                                    $checkselect = in_array($Category->product_id, $category_product);
                                @endphp --}}
                                @php
                                    
                                    showCategories_slect($Category);
                                @endphp
                            </div>




                            <button type="submit" class="btn btn-primary">cập nhập</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
@endsection
