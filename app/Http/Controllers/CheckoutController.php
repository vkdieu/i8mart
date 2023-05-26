<?php

namespace App\Http\Controllers;
use Cart;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Str;


class CheckoutController extends Controller
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
     * 
     */
    public  $url_view = 'checkout';

    function index()
    {
        return view('client.' . $this->url_view);
    }

    function add(Request $request)
{
    
    // Validate dữ liệu form
$request->validate([
    'fullname' => 'required',
    'email' => 'required|email|',
    'address' => 'required',
    'phone' => 'required',
    'payment_method' => 'required',
], [
    'required' => ':attribute không được để trống.',
    'email' => 'Địa chỉ email không hợp lệ.',
    'unique' => ':attribute đã được sử dụng.',
], [
    'fullname' => 'Họ tên',
    'email' => 'Email',
    'address' => 'Địa chỉ',
    'phone' => 'Số điện thoại',
    'payment_method' => 'Phương thức thanh toán',
]);
$orderDetails = array();
foreach (Cart::content() as $item) {
    $slug = Str::slug($item->name);
    $orderDetails[] = [
        'title' => $item->name,
        'quantity' => $item->qty,
        'price' => $item->price,
        'total_price' => Cart::total(),
        'slug'=>$slug,
        'image' => $item->options->image,
   


    ];

    
}


$orderDetailsJson = json_encode($orderDetails);
// print_r(json_decode($orderDetailsJson));


Order::create([
    'fullname' => $request->fullname,
    'email' => $request->email,
    'address' => $request->address,
    'phone' => $request->phone,
    'note' => $request->note,
    'status' => 'pending',
    'payment_method' => $request->payment_method,
    'info_product' => $orderDetailsJson
]);


//Lưu thông tin chi tiết đơn hàng



return redirect()->route('Checkout.index')->with('status','Mua hàng thành công vào giỏ hàng');

}
}