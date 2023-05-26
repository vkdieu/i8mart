<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        
        'slug',      
        
        'description'
     
   
        
    ];
    public function product()
    {
        return $this->hasMany(Product::class, 'category_id');
     
            }



}
