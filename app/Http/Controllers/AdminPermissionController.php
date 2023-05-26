<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Str;


class AdminPermissionController extends Controller
{
    public  $path_url_add = 'permission.add';
    public   $path_url_list ='permission.list';
    public   $path_url_edit ='permission.eidt';

    
    
    public   $path_inteface_add = 'permission';
    public   $path_inteface_edit = 'permission_edit';


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    // public function index()
    // {
    //     $url_view = 'home';
    //     return view('client.' . $url_view);
    // }

    function add()
    {
        // nhóm tất cả các phần tử giống nhau lại và đặt key là   return  explode('.',$Permission->slug)[0];
        $Permissions = Permission::all()->groupBy(function ($Permission) {
            return  explode('.', $Permission->slug)[0];
        });
// dd($Permissions);


        return view("admin.{$this->path_inteface_add}", compact('Permissions'));
    }

    function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required|unique:Permissions,title,slug',
                'slug' => 'required',

            ],
            [
                'required' => 'Không được để trống',
                // 'min' => 'Phải có ít nhất 1 ký tự',
                'unique' => [
                    'title' => 'Title đã tồn tại',
                    'slug' => 'Slug đã tồn tại',
                ],
            ]
        );

        Permission::create([
            'title' => $request->input('name'),
            'slug' => $request->input('slug'),
            'description' => $request->input('description')
        ]);
        return redirect()->route("{$this->path_url_add}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $Permission = Permission::find($id);
        return view("admin.{$this->path_inteface_edit}",compact('Permission'));

    }
    function update($id, Request $request)
    {

        $Page = Permission::find($id);


        
        $Page->update([
            'title' => $request->input('name'),
            'slug' => $request->input('slug'),
            'description' => $request->input('description')
      
        ]);
        return redirect()->route("{$this->path_url_add}")->with('status', 'Cập nhập thành công');
    }


    function delete($id)
    {
        $Permission = Permission::find($id);
       
        
        $Permission->delete();
        return redirect()->route("{$this->path_url_add}")->with('status', 'Xóa thành công');
    }
}
