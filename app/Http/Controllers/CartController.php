<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Cart;





class CartController extends Controller
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
    public $url_view = 'cart';

    function index()
    {
        return view('client.' . $this->url_view);
    }
    function add(Request $request, $id)
    {

        $product = Product::find($id);
        $qty = $request->input('num-order',1);
   
   
        
      

        // Lấy danh sách sản phẩm trong giỏ hàng
        $cartContent = Cart::content();

        // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng hay chưa
        foreach ($cartContent as $item) {
            if ($item->rowId == $product->rowId) {
                $qty = $item->qty + 1;
            }
        }
  

        // Thêm sản phẩm vào giỏ hàng
        Cart::add([
            'id' => $product->id,
            'name' => $product->title,
            'qty' => $qty,
            'price' => $product->price,
            'weight' => 0,
            'options' => [
                'image' => $product->img,
            ]
        ]);

        return redirect()->route('Cart.index')->with('status', 'Thêm thành công vào giỏ hàng');
    }
    function delete($rowId)
    {
        Cart::remove($rowId);
        return redirect()->route('Cart.index')->with('status', 'Xóa thành công vào giỏ hàng');
    }
    function destroy()
    {
        Cart::destroy();
        return redirect()->route('Cart.index')->with('status', 'Xóa thành công vào giỏ hàng');
    }

    function update(Request $request)
    {


        $id = $request->id;
        $qty = $request->qty;
        Cart::update($id, $qty);
        $data = [
            'total_product' => (number_format(Cart::get($id)->subtotal, 0, '.', '.')),
            'total' => Cart::total(),
        ];
        echo json_encode($data);

        // Xử lý logic cập nhật giỏ hàng tại đây

        // Trả về phản hồi JSON
    }
}
