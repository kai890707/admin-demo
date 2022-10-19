<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use HasFactory;
    protected $table = 'news_table';
    protected $fillable = [
        'id',
        'news_title',
        'category_id',
        'content',
        'year',
        'img_path',
        'is_show',
    ];
    

   
}
