<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use App\Models\Order;


use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public $path_inteface_index = 'category_product';
    public $path_inteface_detail = 'detail_product';


    public function index(Request $request,$slug)
    {
        
        $productCount = Product::all()->count(); // Khởi tạo biến $productCount với giá trị mặc định

        $product_order=Order::all();
        $products = Product::paginate(10);
        $Category = Category::where('product_id', '>', 0)->get(); //danh mục cha
        $parent_categorys = Category::where('product_id', 0)->get(); //danh mục con
       
        $select = $request->input('select');
        $slug_category = $request->route('slug');// lấy slug để lọc sản phẩm
        
        
        if ($select == 1) 
        {
            $products = Product::orderBy('price', 'desc')->paginate(10);
        }
         elseif ($select == 2) {
            $products = Product::orderBy('price', 'asc')->paginate(10);
        } 
        elseif ($slug_category) {
            $products = Product::where('slug', 'LIKE', "%{$slug_category}%")->paginate(10);
          
                $productCount = $products->count(); // Lấy số lượng sản phẩm


        } else {
            $search = '';
            if ($request->input('s')) {
                $search = $request->input('s');
                $products = Product::where('title', 'LIKE', "%{$search}%")->paginate(10);

            } else {
                $products = Product::orderBy('id')->paginate(10);
            }
            // if ($products->count() == 0) {
            //     $ehco = "Không có sản phẩm";
            // }

        }
       
        $products->appends(['select' => $select]); // để phần trang không bị mất select
        
    
        return view('client.' . $this->path_inteface_index, compact('products', 'Category', 'parent_categorys','product_order','productCount'));
    }

    function list(Request $request)
    {
        $productCount = Product::all()->count(); // Khởi tạo biến $productCount với giá trị mặc định
    
        $product_order = Order::all();
        $products = Product::paginate(10);
        $Category = Category::where('product_id', '>', 0)->get(); //danh mục cha
        $parent_categorys = Category::where('product_id', 0)->get(); //danh mục con
    
        $select = $request->input('select');
        $slug_category = $request->route('slug');// lấy slug để lọc sản phẩm
    
        if ($select == 1) {
            $products = Product::orderBy('price', 'desc')->paginate(10);
        } elseif ($select == 2) {
            $products = Product::orderBy('price', 'asc')->paginate(10);
        } elseif ($slug_category) {
            $products = Product::where('slug', 'LIKE', "%{$slug_category}%")->paginate(10);
            $productCount = $products->count(); // Lấy số lượng sản phẩm
        } else {
            $search = $request->input('s', '');
            if ($search) {
                $products = Product::where('title', 'LIKE', "%{$search}%")->paginate(10);
                $productCount = $products->count(); // Lấy số lượng sản phẩm
            } else {
                $products = Product::orderBy('id')->paginate(10);
                $productCount = $products->count(); // Lấy số lượng sản phẩm
            }
        }
    
    
        $products->appends(['select' => $select]); // để phần trang không bị mất select
    
        return view('client.' . $this->path_inteface_index, compact('products', 'Category', 'parent_categorys', 'product_order', 'productCount'));
    }
    
    function detail($slug,Request $request) {
        $product_detail = Product::where('slug', $slug)->first();

        $product_order = Order::all();

        $products =Product::all();
        $Category=Category::where('product_id','>',0)->get();//danh mục cha
        $parent_categorys = Category::where('product_id',0)->get();//danh mục con
      
        return view('client.'.$this->path_inteface_detail,compact('parent_categorys','Category','products','product_detail','product_order'));

    }
    
}    
