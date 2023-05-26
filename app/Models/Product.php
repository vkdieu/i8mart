<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
  
    use HasFactory;
    use SoftDeletes;

        protected $fillable = [
        'title',
        'describe',
        'detail',
        'price',
        'price_old',
        'slug',
        'category_id',
        'img',
        'img_describe',
        'user_id',
        'status',
        'outstanding'
        

      


    ];
    public function category()
    
    {
        return $this->belongsTo(Category::class);
    }
    
    
    public function thumbnail_product()
{
    return $this->hasMany(ThumbnailProduct::class, 'thumbnail_product_id');
}

    
}
