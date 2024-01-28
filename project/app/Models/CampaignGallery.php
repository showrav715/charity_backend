<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CampaignGallery extends Model
{
    use HasFactory;
    // timestamp
    public $timestamps = false;
    // fillable
    protected $fillable = [
        'campaign_id',
        'photo',
    ];
}
