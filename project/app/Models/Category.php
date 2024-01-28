<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{


    public $timestamps = false;
    protected $fillable = [
        'name',
        'slug',
        'status'
    ];

    public function campaign()
    {
        return $this->hasMany(Blog::class, 'category_id', 'id');
    }
}
