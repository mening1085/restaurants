<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Restaurants extends Model
{
    use HasFactory;
    protected $table = 'restaurants';
    public $timestamps = true;
    protected $fillable = [
        'place_id',
        'name',
        'address',
        'tel',
        'rating',
        'is_open',
        'latitude',
        'longitude',
        'icon',
        'created_at',
        'updated_at',
    ];
}