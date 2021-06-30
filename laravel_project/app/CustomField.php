<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CustomField extends Model
{
    const TYPE_TEXT = 1;
    const TYPE_SELECT = 2;
    const TYPE_MULTI_SELECT = 3;
    const TYPE_LINK = 4;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_id', 'custom_field_name', 'custom_field_type', 'custom_field_seed_value',
        'custom_field_icon_class', 'custom_field_order'
    ];

    /**
     * Get the category that owns the item.
     */
//    public function category()
//    {
//        return $this->belongsTo('App\Category');
//    }

    public function allCategories()
    {
        return $this->belongsToMany('App\Category', 'category_custom_field')->withTimestamps();
    }

    /**
     * Get the item features for the custom field.
     */
    public function itemFeatures()
    {
        return $this->hasMany('App\ItemFeature');
    }

    public function isBelongToCategory(int $category_id)
    {
        return DB::table('category_custom_field')
            ->where('category_id', $category_id)
            ->where('custom_field_id', $this->id)
            ->get()
            ->count() > 0 ? true : false;
    }

    public function getDistinctCustomFieldsByCategories(array $category_ids)
    {
        $custom_field_ids = DB::table('category_custom_field')
            ->whereIn('category_id', $category_ids)
            ->distinct('custom_field_id')
            ->get();

        $select_custom_field = array();
        foreach($custom_field_ids as $key => $custom_field_id)
        {
            $select_custom_field[] = $custom_field_id->custom_field_id;
        }

        return CustomField::whereIn('id', $select_custom_field)
            ->orderBy('custom_field_order')
            ->orderBy('created_at')
            ->get();
    }
}
