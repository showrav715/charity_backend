<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campaign extends Model
{
    use HasFactory;

    public function faqs()
    {
        return $this->hasMany(CampaignFaq::class);
    }

    public function galleries()
    {
        return $this->hasMany(CampaignGallery::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }
}
