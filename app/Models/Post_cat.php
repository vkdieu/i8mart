<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post_cat extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        
        'slug',      
        
        'parent_id'
     
   
        
    ];
    public function post()
    {
        return $this->hasMany(Post::class,'cat_post_id');
     
}



}
