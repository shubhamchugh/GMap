<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = ['rating', 'customer_service_rating', 'quality_rating', 'friendly_rating',
        'pricing_rating', 'recommend', 'department', 'title', 'body', 'approved', 'reviewrateable_type',
        'reviewrateable_id', 'author_type', 'author_id', 'created_at', 'updated_at',
    ];
}
