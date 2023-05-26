<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Page;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\View\View;



class PageController extends Controller
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
    public $url_view = 'page';
    public $url_clien = 'client'; //phần url page foreach ra
    public $interface_edit = 'edit-page'; //phần url page foreach ra



    public function index($slug)
    {
        $page = Page::where('slug', $slug)->first(); // Thêm phương thức first() vào câu truy vấn
        $product_order = Order::all();

        return view('client.' . $this->url_view, compact('product_order', 'page'));
    }
   
    // phải thêm 2 thàng này use App\Http\View\Composers\HeaderComposer;
    //use Illuminate\Support\Facades\View;
    //Trong phương thức boot() của AppServiceProvider, thêm đoạn mã sau để sử dụng view composer:
    public function composer(View $view) /// truyển biến sang view
    {
        $pages = Page::all();

        $view->with('pages', $pages);
    }
}
