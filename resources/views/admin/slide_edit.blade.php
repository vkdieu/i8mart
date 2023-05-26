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
                        <form action="{{ route('Slide.update', $slide->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">

                                <label for="name" class="text-warning font-weight-bold">Tên Slide</label>
                                <input class="form-control" type="text" name="name" id="name" value="">
                                @error('name')
                                    <samp class="text-danger">{{ $message }}</samp>
                                @enderror
                            </div>
                            <input type="file" name="file" id=""><br><br>
                            <img src="{{ asset($slide->images) }}" alt="Slide Image">

                            <button type="submit" class="btn btn-primary" name="addcat" value="Cập Nhập">Cập Nhập</button>
                    </div>
                </div>
            </div>
            </form>


            </tbody>
        @endsection
