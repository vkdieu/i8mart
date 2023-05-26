<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\Order;
use App\Models\Category;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use function Psy\debug;

class AdminOrderController extends Controller
{

    public $path_inteface_list = 'list-order'; //đường dẫn đến trang giao diện
    public $path_inteface_add = 'add-order';
    public $path_inteface_edit = 'edit-order';
    public $path_inteface_detail = 'list-order-detail';


    //gọi url 
    public $path_url_add = 'order.add';
    public $path_url_edit = 'order.edit';
    public $path_url_list = 'order.list';
    public $path_url_detail = 'order.detail';


    function __construct()
    {
        $this->middleware(function($request,$next){
            session(['module_active'=>'order']);
            return $next($request);
        });
        
    }

    function list(Request $request)
    {
        $action = [
            '' => 'Chọn',
            'success' => 'Đơn hàng thành công',
            'cancel' => 'Đơn hàng hủy',
            'delete' => 'Xóa',
            'delivery' => 'Đơn hàng đang vận chuyển',

        ];
        $action1 = [
            '' => 'Chọn',
            'forceDelete' => 'Xóa Vĩnh Viễn',
            'restore' => 'Khôi Phục',
        ];

        $status = $request->input('status');
        $search = $request->input('search');
        if ($status == 'pending') {
            $Orders = Order::where('status', 'pending')->paginate(10);
        } elseif ($status == 'trash') {
            $Orders = Order::where('status', 'trash')->paginate(10);
        } 
        elseif ($status == 'cancel') {
            $Orders = Order::where('status', 'cancel')->paginate(10);
        }elseif ($status == 'success') {
            $Orders = Order::where('status', 'success')->paginate(10);
        } 
        elseif ($status == 'delivery') {
            $Orders = Order::where('status', 'delivery')->paginate(10);
        }   else {
            
            if (!empty($search)) {
                $Orders = Order::where('title', 'LIKE', "%{$search}%");
            }
            $Orders = Order::paginate(10);
        }


        $active_count = Order::where('status', 'active')->count();
        $trash_count = Order::where('status', 'trash')->count();
        $all_count = Order::all()->count();
        $pending_count = Order::where('status','pending')->count();
        $cancel_count = Order::where('status','cancel')->count();
        $success_count = Order::where('status','success')->count();
        $delivery_count = Order::where('status','delivery')->count();

     




        return view("admin.{$this->path_inteface_list}", compact( 'status', 'active_count','trash_count', 'Orders','all_count','pending_count','cancel_count','success_count','delivery_count'));
    }



    function add()
    {

        $category_Order = Category::all();


        return view("admin.{$this->path_inteface_add}", compact('category_Order',));
    }

    function store(Request $request)
    {


        $request->validate(
            [
                'title' => 'required|unique:Orders,title',
                'price' => 'required',
                'describe' => 'required',
                'img' => 'required|mimes:jpeg,png,jpg,gif|max:2048',
                'img_describe' => 'mimes:jpeg,png,jpg,gif|max:2048'

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


        Order::create([
            'title' => ($request->input('title')),
            'describe' => $request->input('describe'),
            'detail' => $request->input('detail'),
            'price' => $request->input('price'),
            'price_old' => $request->input('price_old'),
            'slug' =>  $slug,
            'img' => $thumbnail,
            'img_describe' => $request->input('img_describe'),
            'user_id' => $request->user()->id,
            'status' => $request->input('status'),
            'category_id' => $request->input('select')

        ]);



        return redirect()->route("{$this->path_url_list}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $Order = Order::find($id);
        $category_Order = Category::all();

        return view("admin.{$this->path_inteface_edit}", compact('Order', 'category_Order'));
    }

    function update($id, Request $request)
    {

        $Order = Order::find($id);

        if ($request->hasFile('img')) {
            $file = $request->file('img');

            $file = $request->file('img');
            $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
            $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
            $thumbnail = 'uploads/' . $fileName;
        } else {
            $thumbnail = $Order->img;
        }
        $slug = Str::slug($request->input('title'));

        $Order->update([
            'title' => $request->input('title'),
            'describe' => $request->input('describe'),
            'detail' => $request->input('detail'),
            'price' => $request->input('price'),
            'price_old' => $request->input('price_old'),
            'slug' =>  $slug,
            'img' => $thumbnail,
            // 'img_describe' => $request->input('img_describe'),        
            'status' => $request->input('status'),
            'category_id' => $request->input('select')

        ]);
        return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $Order = Order::find($id);
        // $thumbnail = public_path($Order->img);

        // if ($thumbnail) {
        //     unlink($thumbnail);
        // }
        $Order->delete();
        return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa thành công');
    }

    function action(Request $request)
    {
        $action = $request->input('action');
        $ids = $request->input('items');
        // dd( $action);
        //   dd( $ids);

        if (empty($ids)) {
            return redirect()->route("{$this->path_url_list}")->with('status', 'Bạn chưa chọn danh sách để thực hiện tác vụ.');
        }

        if (empty($action)) {
            return redirect()->route("{$this->path_url_list}")->with('status', '<span style="color:red">Bạn chưa chọn tác vụ để thực hiện.</span>');
        }

        if ($action == 'delete') {
            $Orders = Order::whereIn('id', $ids)->get();
            foreach ($Orders as $item) {
                // $thumbnailPath = public_path($item->thumbnail);


                // if (file_exists($thumbnailPath)) {
                //     unlink($thumbnailPath);
                // }
                $item->delete();
            }


            return redirect()->route("{$this->path_url_list}")->with('status', 'xóa thành công');
        } elseif ($action == 'forceDelete') {
            Order::whereIn('id', $ids)->forceDelete();
            return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa vĩnh viễn thành công');
        } elseif ($action == 'restore') {
            Order::whereIn('id', $ids)->restore();
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } elseif ($action == 'success') {
            Order::whereIn('id', $ids)->update([
                'status' => 'success'
            ]);
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } elseif ($action == 'delivery') {
            Order::whereIn('id', $ids)->update([
                'status' => 'delivery'
            ]);
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } elseif ($action == 'cancel') {
            Order::whereIn('id', $ids)->update([
                'status' => 'cancel'
            ]);
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } else {
            return redirect()->route("{$this->path_url_list}")->with('status', '<span style="color:red">Tác vụ không hợp lệ.</span>');
        }
    }

    function detail($id, Request $request)
    {
        $Order = Order::find($id);
      

        $action = [
            '' => 'Chọn',
            'success' => 'Đơn hàng thành công',
            'cancel' => 'Đơn hàng hủy',
            'delivery' => 'Đơn hàng đang vận chuyển',

        ];


        return view("admin.{$this->path_inteface_detail}", compact('Order', 'action'));
    }
    function action_detai(Request $request, $id)
    {
   
        $Order = Order::find($id);
        $status = $request->input('action');
        // dd($status);
        if ($status == 'success') {
            $Order->update([
                'status' => 'success'
            ]);
        } elseif ($status == 'cancel') {
            $Order->update([
                'status' => 'cancel'
            ]);
        } elseif(($status == 'delivery')) {
            $Order->update([
                'status' => 'delivery'
            ]);
        }

        return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công thành công');
    }
}
