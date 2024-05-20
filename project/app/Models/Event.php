<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    protected $appends = ['api_photo'];

    public function getApiPhotoAttribute()
    {
        return getPhoto($this->photo, 'feature');
    }
}
