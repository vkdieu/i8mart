<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Order;
use App\Models\Slide;




class HomeController extends Controller
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
    public  $url_view = 'home';
    public function index()
    {
       $products =Product::all();
       
       $Category=Category::where('product_id','>',0)->get();//danh mục cha
       $parent_categorys = Category::where('product_id',0)->get();//danh mục con

       $product_order = Order::all();
       $product_outstanding = Product::where('outstanding', 'on')->get();
       $Slides=Slide::all();





    


        return view('client.'. $this->url_view ,compact('products','parent_categorys','Category','product_order','product_outstanding','Slides'));   
     }
}
