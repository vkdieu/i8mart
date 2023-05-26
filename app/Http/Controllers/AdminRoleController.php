<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\Role;
use App\Models\Permission;



use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Gate;


use function Psy\debug;

class AdminRoleController extends Controller
{
    public $path_inteface_list = 'list-role'; //đường dẫn đến trang giao diện
    //    public $path_inteface_add = 'permission';
    public $path_inteface_edit = 'edit-role';
    public $path_inteface_add = 'add-role';


    //gọi url 
    public $path_url_add = 'Role.add';
    public $path_url_edit = 'Role.edit';
    public $path_url_list = 'Role.list';


    function list(Request $request)
    {

        $role = Role::paginate(10);
       
        // if (! Gate::allows('update-post',)) {
        //     abort(403);
        // }
        return view("admin.{$this->path_inteface_list}", compact('role'));
    }



    function add()
    {

        $Permissions = Permission::all()->groupBy(function ($Permisson) {
            return explode('.', $Permisson->slug)[0];
        });


        return view("admin.{$this->path_inteface_add}", compact('Permissions'));
    }

    function store(Request $request)
    {


        $request->validate(
            [
                'name' => 'required|unique:Roles,title',
                'description' => 'required',

            ],
            [
                'required' => 'Không được để trống',

                'unique' => 'Tên quyền   đã tồn tại'
            ]
        );




        $role = Role::create([
            'title' => ($request->input('name')),
            'description' => $request->input('description'),

        ]);
        $role->permissions()->attach($request->input('permission_id'));





        return redirect()->route("{$this->path_url_list}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        
        $role = Role::find($id);
        $permissionIds = $role->permissions->pluck('id')->toArray(); //lấy tất cả các quyền của role

        // dd($permissionIds);

        $Permissions = Permission::all()->groupBy(function ($Permission) {
            return explode('.', $Permission->slug)[0];
        });

        return view("admin.{$this->path_inteface_edit}", compact('Permissions', 'permissionIds','role'));
    }

    function update($id, Request $request)
    {
        $role = Role::find($id);

        $request->validate(
            [
                'name' => "required|unique:Roles,title,$role->id",
                'description' => 'required',

            ],
            [
                'required' => 'Không được để trống',

                'unique' => 'Tên quyền   đã tồn tại'
            ]
        );

        $role->update([
            'title' => ($request->input('name')),
            'description' => $request->input('description'),

        ]);
        $role->permissions()->sync($request->input('permission_id', []));
        return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $Role = Role::find($id);
       
            // }
            $Role->delete();
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
            $Roles = Role::whereIn('id', $ids)->get();


            foreach ($Roles as $item) {
                if (Auth::Role()->id ==  $item->id) {
                    return redirect()->route("{$this->path_url_list}")->with('status', 'Bạn không thể xóa tài khoản của bạn');
                } else
                    $item->delete();
            }
            return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa thành công');
        }
    }
}
