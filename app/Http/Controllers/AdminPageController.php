<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use function Psy\debug;

class AdminPageController extends Controller
{
   public $path_inteface_list = 'list-page'; //đường dẫn đến trang giao diện
   public $path_inteface_add = 'add-page';
   public $path_inteface_eidt = 'edit-page';


   //gọi url 
   public $path_url_add = 'page.add';
   public $path_url_edit = 'page.edit';
   public $path_url_list = 'page.list'; 

   function __construct()
   {
       $this->middleware(function($request,$next){
           session(['module_active'=>'page']);
           return $next($request);
       });
       
   }

    function list( Request $request)
    {
       
        $action = [
            '' => 'Chọn',
            'delete' => 'Xóa',
            'public' => 'Công khai',
            'pending' => 'Chờ duyệt'
        ];
        $status = Page::selectRaw('status, count(status) as count')->groupBy('status')->get();
        $query = Page::query();
        $search = $request->input('search');
        if(!empty($search)){
            $query->where('title','LIKE','%'.$search.'%');
        }



        $list = $query->orderBy ('id',)->paginate(2);
        return view(("admin.{$this->path_inteface_list}"), compact('list', 'action', 'status'));
    }


    function add()
    {


        return view("admin.{$this->path_inteface_add}");
    }

    function store(Request $request)
    {
        $file = $request->file('file');






        $request->validate(
            [
                'title' => 'required|min:5|unique:Pages,title',
                'content' => 'required',
                // 'file' => 'required|mimes:jpeg,png,jpg,gif|max:2048'
            ],
            [
                'required' => 'Không được để trống',
                // 'image' => 'Phải là hình ảnh',
                // 'mimes' => 'Hình ảnh phải là định dạng: jpeg,png,jpg,gif',
                // 'max' => 'Dung lượng hình ảnh không được vượt quá 2MB',
            ]
        );

        // if ($request->hasFile('file')) {
        //     $file = $request->file('file');
        //     $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
        //     $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
        //     $thumbnail = 'uploads/' . $fileName;
        // }
        //     $data=[
        //         'thunbnail'=>$thumbnail,
        //     ];
        //  json_encode($data);



        $slug = Str::slug($request->input('title'));

        Page::create([
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'status' => $request->input('status'),
            // 'thumbnail' => $thumbnail,
            'slug' => $slug,
            'user_id' => $request->user()->id
        ]);
        return redirect()->route("{$this->path_url_list}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $page = Page::find($id);
        return view("admin.{$this->path_inteface_eidt}",compact('page'));

    }

    function update($id, Request $request)
    {



        $request->validate(
            [
                'title' => 'required|min:5|',
                'content' => 'required',
                'file' => 'mimes:jpeg,png,jpg,gif|max:2048'

            ],
            [
                'required' => 'Không được để trống',
                'mimes' => 'Hình ảnh phải là định dạng: jpeg,png,jpg,gif',
                'max' => 'Dung lượng hình ảnh không được vượt quá 2MB',
            ]
        );
        $Page = Page::find($id);


        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
            $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
            $thumbnail = 'uploads/' . $fileName;
        } else {
            $thumbnail = $Page->thumbnail;
        }
        $Page->update([
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'status' => $request->input('status'),
            'thumbnail' => $thumbnail,
        ]);
        return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $Page = Page::find($id);
        $thumbnail = public_path($Page->thumbnail);

        if ($thumbnail) {
            unlink($thumbnail);
        }
        $Page->delete();
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
            $Pages = Page::whereIn('id', $ids)->get();
            foreach ($Pages as $item) {
                $thumbnailPath = public_path($item->thumbnail);


                if (file_exists($thumbnailPath)) {
                    unlink($thumbnailPath);
                }
                $item->delete();
            }





            return redirect()->route('{$this->list_path}')->with('status', 'Xóa thành công');
        } elseif ($action == 'pending') {
            Page::whereIn('id', $ids)->update([
                'status' => 'Chờ Duyệt'
            ]);
            return redirect()->route('{$this->list_path}')->with('status', 'Cập nhập thành công');
        } elseif ($action == 'public') {
            Page::whereIn('id', $ids)->update([
                'status' => 'Công khai'
            ]);
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } else {
            return redirect()->route("{$this->path_url_list}")->with('status', '<span style="color:red">Tác vụ không hợp lệ.</span>');
        }
    }
  
}
