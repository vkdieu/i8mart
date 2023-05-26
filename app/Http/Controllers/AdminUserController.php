<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\User;
use App\Models\Role;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use function Psy\debug;

class AdminUserController extends Controller
{
   public $path_inteface_list = 'list-user'; //đường dẫn đến trang giao diện
   public $path_inteface_add = 'add-user';
   public $path_inteface_edit = 'edit-user';

   //gọi url 
   public $path_url_add = 'user.add';
   public $path_url_edit = 'user.edit';
   public $path_url_list = 'user.list'; 

   function __construct()
   {
       $this->middleware(function($request,$next){
           session(['module_active'=>'user']);
           return $next($request);
       });
       
   }
   function list(Request $request)
   {

   
       $status = $request->input('status');
       $search = $request->input('search');
       if ($status == 'active') {
          $Users= User::where('status', 'active')->paginate(10);
       } elseif ($status == 'trash') {
        $Users= User::where('status', 'trash')->paginate(10);
       } else {
           if (!empty($search)) {
            $Users= User::where('name', 'LIKE', "%{$search}%");
           }
           $Users = User::paginate(10);

       }
   
       $trash_count = User::where('status','trash')->count();
       $active_count = User::where('status','active')->count();

   
       return view("admin.{$this->path_inteface_list}", compact('active_count', 'trash_count', 'Users'));
   }
   
   

    function add()
    {

        $role = Role::all();
     

        return view("admin.{$this->path_inteface_add}",compact('role'));
    }

    function store(Request $request)
    {
  
    
        $request->validate(
            [
                'name' => 'required|',
                'email' => 'required|unique:users,email',
                'password' => 'required|',


               

            ],
            [
                'required' => 'Không được để trống',
                'mimes' => 'Hình ảnh phải là định dạng: jpeg,png,jpg,gif',
                'max' => 'Dung lượng hình ảnh không được vượt quá 2MB',
                'unique' => 'email  đã tồn tại'
            ]
        );

       



    

        $user=User::create([
            'name' => ($request->input('name')),
            'email' => $request->input('email'),
            'status' =>'active',
            'permission_id'=>$request->input('permission_id'),
            'password' => Hash::make($request->input('password')),
        ]);
        $user->roles()->attach($request->input('permission_id'));

       
        return redirect()->route("{$this->path_url_list}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $User = User::find($id);
        $role = Role::all();
        $userPermissions=$User->roles->pluck('id')->toArray();
      
        return view("admin.{$this->path_inteface_edit}",compact('role','userPermissions','User'));

    }

    function update($id, Request $request)
    {

        $User = User::find($id);

        if ($request->hasFile('img')) {
            $file = $request->file('img');

            $file = $request->file('img');
            $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
            $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
            $thumbnail = 'uploads/' . $fileName;
        }
         else {
            $thumbnail = $User->img;
        }
        $slug = Str::slug($request->input('name'));

        $User->update([
            'name' => ($request->input('name')),
            'email' => $request->input('email'),
            'status' =>'active',
            'password' => Hash::make($request->input('password')),
              

        ]);
        return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $User = User::find($id);
        if (Auth::user()->id ==  $User->id){
            return redirect()->route("{$this->path_url_list}")->with('status', 'Bạn không thể xóa tài khoản của bạn');

        }else
        // $thumbnail = public_path($User->img);

        // if ($thumbnail) {
        //     unlink($thumbnail);
        // }
        $User->delete();
        return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa thành công');
    }

    function action(Request $request)
    {
        $action = $request->input('action');
        $ids = $request->input('items');
        // dd( $ids);

        if (empty($ids)) {
            return redirect()->route("{$this->path_url_list}")->with('status', 'Bạn chưa chọn danh sách để thực hiện tác vụ.');
        }

        if (empty($action)) {
            return redirect()->route("{$this->path_url_list}")->with('status', '<span style="color:red">Bạn chưa chọn tác vụ để thực hiện.</span>');
        }

        if ($action == 'delete') {
            $Users = User::whereIn('id', $ids)->get();
            
         
            foreach ($Users as $item) {
                if (Auth::user()->id ==  $item->id){
                    return redirect()->route("{$this->path_url_list}")->with('status', 'Bạn không thể xóa tài khoản của bạn');
        
                }else
                $item->delete();
            }
            return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa thành công');
        }
  
}}
