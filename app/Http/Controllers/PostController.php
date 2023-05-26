<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Order;

use Illuminate\Http\Request;

class PostController extends Controller
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
     */   public $url_view = 'blog';
        public $url_detail = 'post-detail';



    public function index()
    {

        $Posts = Post::paginate(10);
        $product_order = Order::all();
        return view('client.' . $this->url_view, compact('Posts', 'product_order'));
    }
    function detail($slug)
    {
        $Post_detail=Post::where('slug',$slug)->first();
        $product_order=Order::paginate(10);
        return view('client.' . $this->url_detail,compact('Post_detail','product_order'));
    }
}
