<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Post extends Model
{
  
    use HasFactory;
    use SoftDeletes;

        protected $fillable = [
        'title',
        'detail',
        'img',
        'slug',
        'user_id',
        'status',
        'cat_post_id',
        'detail',
        'description'
        


    ];
    public function cat_post()
    {
        return $this->belongsTo(Post_cat::class);
     
}
    
}
