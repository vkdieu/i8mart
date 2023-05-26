<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class ThumbnailProduct extends Model
{
  
    use HasFactory;
    // use SoftDeletes;

    protected $fillable = [
        'title_img',   // Phương thức thanh toán
        'thumbnail_product_id',            // Địa chỉ email khách hàng
        
    ];
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'thumbnail_product_id');
    }
    
    
}
