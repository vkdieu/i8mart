<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
  
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'payment_method',   // Phương thức thanh toán
        'email',            // Địa chỉ email khách hàng
        'note',             // Ghi chú đơn hàng
        'fullname',         // Họ tên khách hàng
        'product_id',       // ID sản phẩm
        'qty',              // Số lượng sản phẩm
        'info_product',
        'status',
        'slug'
    ];
    public function product()
    
    {
        return $this->belongsTo(Product::class);
    }
    
}
