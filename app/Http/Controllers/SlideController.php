<?php

namespace App\Http\Controllers;

use App\images;
use App\Post;
use App\Models\Slide;

use Illuminate\Support\Facades\file;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SlideController extends Controller

{
    //
    function __construct()
    {
        $this->middleware(function ($request, $next) {
            session(['module_active' => 'slide']);
            return $next($request);
        });
    }
    function list()
    {
        // $slides = Slide::paginate(10);
        return view('admin.slide');
    }
    function slide()
    {
        $slides = Slide::paginate(10);
        return view('admin.slide',compact('slides'));
    }
    function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required|unique:Slides,name',
                'file' => 'required|mimes:jpeg,png,jpg,gif|max:2048',
            ],
            [
                'required' => 'Không được để trống',
                'unique' => 'tiêu đề đã tồn tại',
                'mimes' => 'Hình ảnh phải là định dạng: jpeg,png,jpg,gif',
                'max' => 'Dung lượng hình ảnh không được vượt quá 2MB',


            ]
        );

        if ($request->hasFile('file')) {
            $file = $request->file('file');

            $file = $request->file('file');
            $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
            $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
            $thumbnail = 'uploads/' . $fileName;
        }
        $slug = Str::slug($request->input('name'));
        Slide::create([
            'name' => $request->input('name'),
            'images' => $thumbnail,
            'slug' => $slug,

        ]);
        return redirect()->route('Slide.add')->with('status', 'uploat thành công');
        // ------------------------------update ảnh------------------------------
    }

    function delete($id)
    {
        $slide = Slide::find($id);
        $slide->delete();
        return redirect()->route('Slide.add')->with('status', 'xóa thành công');
    }
    function edit($id)
    {
        $slide = Slide::find($id);
        return view('admin.slide_edit', compact('slide'));
    }
    function update(Request $request, $id)
    {
        $slide = Slide::find($id);

        if ($request->hasFile('file')) {



            $file = $request->file('file');

            $namefile = $file->getClientOriginalName();

            $rename = time();
            $file->move('public/uploat/slide/', $rename . $namefile);
            $thumbnail = ('public/uploat/slide/' . $rename . $namefile);
        } else {
            $thumbnail = $slide->images;
        }

            Slide::where('id', $id)
                ->update([
                    'name' => $request->input('name'),
                    'images' => $thumbnail,
                ]);

            return redirect()->route('Slide.add')->with('status', 'update thành công');
        }
    }

