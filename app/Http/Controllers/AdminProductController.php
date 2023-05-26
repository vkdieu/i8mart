<?php

namespace App\Http\Controllers;

use Illuminate\Http\UploadedFile;
use App\Models\Product;
use App\Models\Category;
use App\Models\ThumbnailProduct;



use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

use function Psy\debug;

class AdminProductController extends Controller
{
    public $path_inteface_list = 'list-product'; //đường dẫn đến trang giao diện
    public $path_inteface_add = 'add-product';
    public $path_inteface_edit = 'edit-product';

    //gọi url 
    public $path_url_add = 'product.add';
    public $path_url_edit = 'product.edit';
    public $path_url_list = 'product.list';

    function __construct()
    {
        $this->middleware(function ($request, $next) {
            session(['module_active' => 'product']);
            return $next($request);
        });
    }

    function list(Request $request)
    {
        $action = [
            '' => 'Chọn',
            'stocking' => 'Còn hàng',
            'out_of_stock' => 'Hết hàng',
            'destroys' => 'Xóa',
        ];
        $action1 = [
            '' => 'Chọn',
            'forceDelete' => 'Xóa Vĩnh Viễn',
            'restore' => 'Khôi Phục',
        ];

        $status = $request->input('status');
        $search = $request->input('search');
        $products = Product::orderBy('id','desc');
        if ($status == 'stocking') {
            $products->where('status', 'stocking');
        } elseif ($status == 'out_of_stock') {
            $products->where('status', 'out_of_stock');
        } elseif ($status == 'trash') {
            $products->onlyTrashed();
        } else {
            if (!empty($search)) {
                $products->where('title', 'LIKE', "%{$search}%");
            }
        }
        

        $products = $products->paginate(10);
        $trash_count = Product::onlyTrashed()->count();
        $stocking_count = Product::where('status', 'stocking')->count();
        $out_of_stock_count = Product::where('status', 'out_of_stock')->count();

        return view("admin.{$this->path_inteface_list}", compact('action', 'trash_count', 'products', 'status', 'action1', 'stocking_count', 'out_of_stock_count'));
    }



    function add()
    {

        $category_product = Category::all();


        return view("admin.{$this->path_inteface_add}", compact('category_product',));
    }

    function store(Request $request)
    {


        $request->validate(
            [
                'title' => 'required|unique:Products,title',
                'describe' => 'required',
                'img' => 'required|mimes:jpeg,png,jpg,gif|max:2048',
                'img_describe' => 'mimes:jpeg,png,jpg,gif|max:2048',
                'price' => 'required', 'numeric', 'min:0',
                'select'=>'required'


            ],
            [
                'required' => 'Không được để trống',
                'mimes' => 'Hình ảnh phải là định dạng: jpeg,png,jpg,gif',
                'max' => 'Dung lượng hình ảnh không được vượt quá 2MB',
                'unique' => 'tiêu đề đã tồn tại',
                'numeric' => 'Giá tiền phải là một số.',
                'min' => 'Giá tiền phải lớn hơn hoặc bằng 0.'
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
        $get_price = $request->input('price');
        $price = preg_replace('/[^0-9]/', '', $get_price);//thay thế tấy cả các dấu bưangf khoảng trắng
      
        $product=Product::create([
            'title' => ($request->input('title')),
            'describe' => $request->input('describe'),
            'detail' => $request->input('detail'),
            'price' => $price,
            'price_old' => $request->input('price_old'),
            'slug' =>  $slug,
            'img' => $thumbnail,
            'img_describe' => $request->input('img_describe'),
            'user_id' => $request->user()->id,
            'status' => $request->input('status'),
            'category_id' => $request->input('select'),
            'outstanding' => $request->input('outstanding')

        ],[
            [
                'required' => 'Không được để trống',
                'mimes' => 'Hình ảnh phải là định dạng: jpeg,png,jpg,gif',
                'max' => 'Dung lượng hình ảnh không được vượt quá 2MB',
                'unique' => 'tiêu đề đã tồn tại',
                'numeric' => 'Giá tiền phải là một số.',
                'min' => 'Giá tiền phải lớn hơn hoặc bằng 0.'
            ]
        ]);
        if ($request->hasFile('img_describe')) {
            $img_describe = $request->file('img_describe');
        
            foreach ($img_describe as $file) {
                $fileName = time() . '_' . $file->getClientOriginalName();
                $file->move(public_path('uploads'), $fileName);
                $thumbnail = 'uploads/' . $fileName;
        
                ThumbnailProduct::create([
                    'title_img' => $thumbnail,
                    'thumbnail_product_id' => $product->id
                ]);
            }
        }
            


        return redirect()->route("{$this->path_url_list}")->with('status', 'Thêm thành công');
    }

    function edit($id)
    {
        $Product = Product::find($id);
        $category_product = Category::all();
        $selected_category_id = $Product->category_id; // Gán giá trị của danh mục được chọn ban đầu
    
        return view("admin.{$this->path_inteface_edit}", compact('Product', 'category_product', 'selected_category_id'));
    }
    

    function update($id, Request $request)
    {

        $request->validate([
            'select' => 'required|not_in:0',

        ], [
            'required' => 'Không được để trống',
            'not_in' => 'Không có danh mục không hợp lệ'
        ]);
        $Product = Product::find($id);

        if ($request->hasFile('img')) {
            $file = $request->file('img');

            $file = $request->file('img');
            $fileName = time() . '_' . $file->getClientOriginalName(); // Đổi tên file để tránh trùng lặp
            $file->move(public_path('uploads'), $fileName); // Lưu file vào thư mục uploads
            $thumbnail = 'uploads/' . $fileName;
        } else {
            $thumbnail = $Product->img;
        }
        $slug = Str::slug($request->input('title'));

        $Product->update([
            'title' => $request->input('title'),
            'describe' => $request->input('describe'),
            'detail' => $request->input('detail'),
            'price' => $request->input('price'),
            'price_old' => $request->input('price_old'),
            'slug' =>  $slug,
            'img' => $thumbnail,
            // 'img_describe' => $request->input('img_describe'),        
            'status' => $request->input('status'),
            'category_id' => $request->input('select'),
            'outstanding' => $request->input('outstanding')


        ]);
        if ($request->hasFile('img_describe')) {
            $img_describe = $request->file('img_describe');
        
            foreach ($img_describe as $file) {
                $fileName = time() . '_' . $file->getClientOriginalName();
                $file->move(public_path('uploads'), $fileName);
                $thumbnail = 'uploads/' . $fileName;
        
                ThumbnailProduct::create([
                    'title_img' => $thumbnail,
                    'thumbnail_product_id' => $Product->id
                ]);
            }
        
        }
        return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
    }

    function delete($id)
    {
        $Product = Product::find($id);
        // $thumbnail = public_path($Product->img);

        // if ($thumbnail) {
        //     unlink($thumbnail);
        // }
        $Product->delete();
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
            $Products = Product::whereIn('id', $ids)->get();
            foreach ($Products as $item) {
                // $thumbnailPath = public_path($item->img);


                // if (file_exists($thumbnailPath)) {
                //     unlink($thumbnailPath);
                // }
                $item->delete();
            }
            return redirect()->route("{$this->path_url_list}")->with('status', 'Xóa thành công');
        } elseif ($action == 'stocking') {
            Product::whereIn('id', $ids)->update([
                'status' => 'stocking'
            ]);
            return redirect()->route('{$this->list_path}')->with('status', 'Cập nhập thành công');
        } elseif ($action == 'out_of_stock') {
            Product::whereIn('id', $ids)->update([
                'status' => 'out_of_stock'
            ]);
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } elseif ($action == 'forceDelete') {
            Product::whereIn('id', $ids)->forceDelete()();
            return redirect()->route("{$this->path_url_list}")->with('status', 'Khôi thành công');
        } elseif ($action == 'restore') {
            Product::whereIn('id', $ids)->restore();
            return redirect()->route("{$this->path_url_list}")->with('status', 'Cập nhập thành công');
        } else {
            return redirect()->route("{$this->path_url_list}")->with('status', '<span style="color:red">Tác vụ không hợp lệ.</span>');
        }
    }
}
