<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\Post;
use App\Models\Post_cat;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use function Psy\debug;

class AdminPostController extends Controller
{
   public $path_inteface_list = 'list-post'; //đường dẫn đến trang giao diện
   public $path_inteface_add = 'add-post';
   public $path_inteface_edit = 'edit-post';

   //gọi url 
   public $path_url_add = 'post.add';
   public $path_url_edit = 'post.edit';
   public $path_url_list = 'post.list'; 

   function __construct()
   {
       $this->middleware(function($request,$next){
           session(['module_active'=>'post']);
           return $next($request);
       });
       
   }

   function list(Request $request)
   {


       $action = [
           '' => 'Chọn',
           'pending' => 'Chờ duyệt',
           'public' => 'Công khai',
           'destroys' => 'Xóa',
       ];
       $action1 = [
           '' => 'Chọn',
           'forceDelete' => 'Xóa Vĩnh Viễn',
           'restore' => 'Khôi Phục',
       ];
   
       $status = $request->input('status');
       if ($status == 'pending') {
           $Posts = Post::where('status', 'pending')->paginate(10);
       } elseif ($status == 'public') {
           $Posts = Post::where('status', 'public')->paginate(10);
       } elseif ($status == 'trash') {
           $Posts = Post::onlyTrashed()->paginate(10);
       } else {
           $search = '';
           if ($request->input('search')) {
               $search = ($request->input('search'));
               $Posts = Post::where('title', 'LIKE', "%{$search}%")->paginate(10);
           } else {
               $Posts = Post::orderBy('id')->paginate(10);
           }
       }
   
       $trash_count = Post::onlyTrashed()->count();
       $pending_count = Post::where('status','pending')->count();
       $public_count = Post::where('status','public')->count();


   
       return view("admin.{$this->path_inteface_list}", compact('action', 'trash_count', 'Posts', 'status', 'action1','public_count','pending_count'));
   }
   
   

    function add()
    {

        $category_Post = Post_cat::all();
    

        return view("admin.{$this->path_inteface_add}",compact('category_Post'));
    }

    function store(Request $request)
    {
//   dd($request->input('describe'));
    
        $request->validate(
            [
                'title' => 'required|unique:Posts,title',
               
                'detail' => 'required',
                'img' => 'required|mimes:jpeg,png,jpg,gif|max:2048',
                // 'img_describe' => 'mimes:jpeg,png,jpg,gif|max:2048'

            ],
            [
                'required' => 'Không được để trống',
                'mimes' => 'Hình ảnh phải là định dạng: jpeg,png,jpg,gif',
                'max' => 'Dung lượng hình ảnh không được vượt quá 2MB',
                'unique' => 'tiêu đề đã tồn tại'
            ]
        );

        if ($request->hasFile('img')) {
            $file = $request->file('img');

            $file = $request->file('img');
            $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
            $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
            $thumbnail = 'uploads/' . $fileName;
        }
        



        $slug = Str::slug($request->input('title'));
    

       Post::create([
            'title' => ($request->input('title')),
            'detail' => $request->input('detail'),
            'cat_post_id' => $request->input('select'),
            'slug' =>  $slug,
            'img' => $thumbnail,
            'user_id' => $request->user()->id,
            'status' =>$request->input('status'),
            'description' =>$request->input('description'),


        ]);
    

       
        return redirect()->route("{$this->path_url_list}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $Post = Post::find($id);
        $category_Post = Post_cat::all();
      
        return view("admin.{$this->path_inteface_edit}",compact('Post','category_Post'));

    }

    function update($id, Request $request)
    {

        $Post = Post::find($id);

        if ($request->hasFile('img')) {
            $file = $request->file('img');

            $file = $request->file('img');
            $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
            $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
            $thumbnail = 'uploads/' . $fileName;
        }
         else {
            $thumbnail = $Post->img;
        }
        $slug = Str::slug($request->input('title'));

        $Post->update([
            'title' => ($request->input('title')),
            'detail' => $request->input('detail'),
            'parent_id' => $request->input('select'),
            'slug' =>  $slug,
            'img' => $thumbnail,
            'user_id' => $request->user()->id,
            'status' =>$request->input('status'),
            'description' =>$request->input('description'),
            'detail' =>$request->input('detail'),



        ]);
        return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $Post = Post::find($id);
        // $thumbnail = public_path($Post->img);

        // if ($thumbnail) {
        //     unlink($thumbnail);
        // }
        $Post->delete();
        return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa thành công');
    }

    function action(Request $request)
    {
        $action = $request->input('action');
        $ids = $request->input('items');
        // dd( $action,);

        if (empty($ids)) {
            return redirect()->route("{$this->path_url_list}")->with('status', 'Bạn chưa chọn danh sách để thực hiện tác vụ.');
        }

        if (empty($action)) {
            return redirect()->route("{$this->path_url_list}")->with('status', '<span style="color:red">Bạn chưa chọn tác vụ để thực hiện.</span>');
        }

        if ($action == 'delete') {
            $Posts = Post::whereIn('id', $ids)->get();
            foreach ($Posts as $item) {
                // $thumbnailPath = public_path($item->img);


                // if (file_exists($thumbnailPath)) {
                //     unlink($thumbnailPath);
                // }
                $item->delete();
            }
            return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa thành công');
        } elseif ($action == 'stocking') {
            Post::whereIn('id', $ids)->update([
                'status' => 'stocking'
            ]);
            return redirect()->route('{$this->list_path}')->with('status', 'Cập nhập thành công');
        } elseif ($action == 'out_of_stock') {
            Post::whereIn('id', $ids)->update([
                'status' => 'out_of_stock'
            ]);
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        }  elseif ($action == 'forceDelete') {
            Post::whereIn('id', $ids)->forceDelete()();
            return redirect()->route("{$this->path_url_list}")->with('status', 'Khôi thành công');
        }  elseif ($action == 'restore') {
            Post::whereIn('id', $ids)->restore();
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } 
        else {
            return redirect()->route("{$this->path_url_list}")->with('status', '<span style="color:red">Tác vụ không hợp lệ.</span>');
        }
    }
  
}
