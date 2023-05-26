<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\Category;
use App\Models\Product;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use function Psy\debug;

class AdminCategoryController extends Controller
{
    public $path_inteface_list = 'list-category'; //đường dẫn đến trang giao diện
    public $path_inteface_add = 'cat-product';
    public $path_inteface_edit = 'edit-cat-product';


    //gọi url 
    public $path_url_add = 'Category.add';
    public $path_url_edit = 'Category.edit';






    function add()
    {
        $Category = Category::all();
        $list_category = Category::all();


        $count_category = Category::count();

        return view("admin.{$this->path_inteface_add}", compact('Category', 'count_category', 'list_category'));
    }


    function store(Request $request)
    {


        // dd($request);


        $request->validate(
            ['name' => 'required|unique:categorys,title',],
            [
                'required' => 'Không được để trống',
                'min' => 'Phải có ít nhất 1 ký tự',
                'unique' => 'Tên này đã tồn tại',
            ]
        );

        $slug = str::slug($request->input('name'));



        Category::create([
            'title' => $request->input('name'),
            'slug' => $slug,
            'product_id' => $request->input('product_id')
        ]);
        return redirect()->route("{$this->path_url_add}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $Category = Category::find($id);
        $category_product = Category::pluck('id')->toArray();
     
        return view("admin.{$this->path_inteface_edit}", compact('Category','category_product'));
    }

    function update($id, Request $request)
    {


// dd($request->input('product_id'));
        $slug = str::slug($request->input('name'));
        $Category = Category::find($id);
        $count_category = Category::count();


        $Category->update([
            'title' => $request->input('name'),
            'product_id' => $request->input('product_id'),
            'slug' => $slug
        ]);
        return redirect()->route("{$this->path_url_add}", compact('count_category', 'Category'))->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $category = Category::find($id);
    
     
            if ( $category->product_id == 0)
             {
                // Nếu đây là danh mục cha, tìm các danh mục con và xóa chúng
                $subcategories = Category::where('product_id', $category->id)->get();
                foreach ($subcategories as $subcategory) 
                {
                    $subcategory->delete();
                }
            }
    
            // Xóa danh mục
            $category->delete();
    
            return redirect()->route("{$this->path_url_add}")->with('status', 'Xóa thành công');
        
    
}
}
