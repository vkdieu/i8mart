<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\Post_cat;
use App\Models\Product;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use function Psy\debug;

class AdminPost_catController extends Controller
{
    // public $path_inteface_list = 'cat-post'; //đường dẫn đến trang giao diện
    public $path_inteface_add = 'cat-post';
    public $path_inteface_edit = 'edit-cat-post';


    //gọi url 
    public $path_url_add = 'post_cat.add';
    public $path_url_edit = 'post_cat.edit';

    




    function add()
    {
        $Post_cat_list = Post_cat::all();
        $Post_cat = Post_cat::all();


        $count_Post_cat = Post_cat::count();

        return view("admin.{$this->path_inteface_add}", compact('Post_cat_list', 'count_Post_cat', 'Post_cat'));
    }


    function store(Request $request)
    {


        // dd($request);


        $request->validate(
            ['name' => 'required|unique:Post_cats,title',],
            [
                'required' => 'Không được để trống',
                'min' => 'Phải có ít nhất 1 ký tự',
                'unique' => 'Tên này đã tồn tại',
            ]
        );

        $slug = str::slug($request->input('name'));



        Post_cat::create([
            'title' => $request->input('name'),
            'slug' => $slug,
            'parent_id' => $request->input('parent_id')
        ]);
        return redirect()->route("{$this->path_url_add}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $Post_cat = Post_cat::find($id);
        $category_Post=Post_cat::all();
        return view("admin.{$this->path_inteface_edit}", compact('Post_cat','category_Post'));
    }

    function update($id, Request $request)
    {



        $slug = str::slug($request->input('name'));
        $Post_cat = Post_cat::find($id);
        $count_Post_cat = Post_cat::count();


        $Post_cat->update([
            'title' => $request->input('name'),
            'parent_id' => $request->input('parent_id'),
            'slug' => $slug
        ]);
        return redirect()->route("{$this->path_url_add}", compact('count_Post_cat', 'Post_cat'))->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $Post_cat = Post_cat::find($id);
    
     
            if ( $Post_cat->parent_id == 0)
             {
                // Nếu đây là danh mục cha, tìm các danh mục con và xóa chúng
                $subcategories = Post_cat::where('parent_id', $Post_cat->id)->get();
                foreach ($subcategories as $subPost_cat) 
                {
                    $subPost_cat->delete();
                }
            }
    
            // Xóa danh mục
            $Post_cat->delete();
    
            return redirect()->route("{$this->path_url_add}")->with('status', 'Xóa thành công');
        
    
}
}
