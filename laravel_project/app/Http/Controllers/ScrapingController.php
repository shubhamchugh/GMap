<?php

namespace App\Http\Controllers;

use App\City;
use App\Item;
use App\User;
use App\State;
use App\Review;
use Carbon\Carbon;
use App\ItemImageGallery;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManagerStatic as Image;

class ScrapingController extends Controller
{
    public function scrape(Request $request)
    {

        $now     = Carbon::now();
        $city    = City::where('created_at', null)->orderBy('id', 'ASC')->first();
        $state   = $city->state_id;
        $country = State::where('id', $state)->orderBy('id', 'ASC')->first();
        $city->update([
            'created_at' => $now,
        ]);

        $googleMapSearch = 'http://localhost:3000/search?search=http://www.google.com/maps/search/' . urlencode($request->keyword) . '+in+' . urlencode($city->city_name) . '+' . urlencode($city->city_state) . '+' . urlencode($country->state_country_abbr) . '/';
        echo "$googleMapSearch<br>";
        $curl = curl_init($googleMapSearch);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, [
            'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',
        ]);

        $SearchResponse = curl_exec($curl);
        curl_close($curl);
        $SearchResponse = json_decode($SearchResponse, true);

        if (!empty($SearchResponse)) {
            foreach ($SearchResponse['url'] as $key => $value) {
                $googleMapUrl = $value;
                $userCount    = User::all();
                $googleMap    = 'http://localhost:3000/?url=' . $googleMapUrl;
                echo "$googleMap<br>";
                $curl = curl_init($googleMap);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($curl, CURLOPT_HTTPHEADER, [
                    'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36',
                ]);

                $response = curl_exec($curl);
                curl_close($curl);
                $response = json_decode($response, true);
                print_r($response);
                if (!empty($response)) {

                    $redirectUrl = $response['redirect'];
                    echo "$redirectUrl<br>";
                    preg_match("/\@[-?\d\.]*\,([-?\d\.]*)/m", $redirectUrl, $coordinates);

                    $coordinate = str_replace("@", "", $coordinates[0]);
                    $coordinate = explode(",", $coordinate);

                    $title             = (!empty($response['title'][0])) ? trim($response['title'][0]) : "Not Available";
                    $title2            = (!empty($response['title2'][0])) ? trim($response['title2'][0]) : "Not Available";
                    $addressContent    = (!empty($response['addressContent'][0])) ? trim($response['addressContent'][0]) : "Not Available";
                    $websiteContent    = (!empty($response['websiteContent'][0])) ? trim($response['websiteContent'][0]) : "Not Available";
                    $phoneContent      = (!empty($response['phoneContent'][0])) ? trim($response['phoneContent'][0]) : "Not Available";
                    $features          = (!empty($response['features'])) ? $response['features'] : "Not Available";
                    $rating            = (!empty($response['rating'][0])) ? trim($response['rating'][0]) : "Not Available";
                    $testimonial       = (!empty($response['testimonial'])) ? $response['testimonial'] : "Not Available";
                    $timeTable         = (!empty($response['timeTable'])) ? $response['timeTable'] : "Not Available";
                    $reviewCount       = (!empty($response['reviewCount'])) ? $response['reviewCount'] : "Not Available";
                    $reviewAuthorNames = (!empty($response['reviewAuthorNames'])) ? $response['reviewAuthorNames'] : "Not Available";
                    $dates             = (!empty($response['dates'])) ? $response['dates'] : "Not Available";
                    $ratings           = (!empty($response['ratings'])) ? $response['ratings'] : "Not Available";
                    $reviewsContent    = (!empty($response['reviewsContent'])) ? $response['reviewsContent'] : "Not Available";
                    $reviewerImage     = (!empty($response['reviewerImage'])) ? $response['reviewerImage'] : "Not Available";
                    $image             = (!empty($response['image'])) ? $response['image'] : "Not Available";
                    $imageName         = (!empty($response['imageName'])) ? $response['imageName'] : "Not Available";
                    $slug              = Str::slug($title, '-');
                    $authorImageValue  = (!empty($response['authorImageValue'])) ? $response['authorImageValue'] : "Not Available";
                    print_r($image);
                    $item_description = "<strong><h4>Time Table: </h4></strong>";
                    $item_description .= '
                <table border="1" cellspacing="0" cellpadding="2">
                    <tr>';
                    if ('Not Available' !== $timeTable) {
                        foreach ($timeTable as $time) {
                            $item_description .= "<th> $time </th>";
                        }
                        $item_description .= '</tr>';
                        $item_description .= '<p><br>';
                        $item_description .= "<strong><h4>Testimonial: </h4></strong><br>";
                    }

                    if ('Not Available' !== $testimonial) {
                        foreach ($testimonial as $testimonialValue) {
                            $item_description .= "<h4> $testimonialValue </h4> <br>";
                        }
                        $item_description .= '</p>';
                        $item_description .= "<strong><h4>Features: </h4></strong>";
                        $item_description .= '<p>';
                    }
                    if ('Not Available' !== $features) {
                        foreach ($features as $featuresValue) {
                            $item_description .= "<strong> $featuresValue </strong><br>";
                        }
                        $item_description .= '</p>';
                    }
                    //dd($item_description);
                    if ('Not Available' !== $reviewAuthorNames) {

                        foreach ($reviewAuthorNames as $key => $value) {

                            $authorImageName = Str::slug($value, '-') . '.png';

                            $authorImage = Image::make($authorImageValue[$key]);

                            $thumbnailPath = 'profile/' . $authorImageName;
                            $originalImage = $authorImage->response();
                            $originalImage = $originalImage->original;
                            Storage::disk('wasabi')->put($thumbnailPath, $originalImage);

                            User::create([
                                'name'              => $value,
                                'email'             => generateEmailAddress(),
                                'email_verified_at' => $now,
                                'role_id'           => 3,
                                'user_image'        => $authorImageName,
                                'user_suspended'    => 0,
                            ]);
                        }
                    }
                    if ('Not Available' !== $image) {
                        $singleImage = (!empty($image[0])) ? $image[0] : null;
                    } else {
                        $singleImage = false;
                    }

                    if (!empty($singleImage)) {
                        $singleImageName = Str::slug($title, '-') . '.png';
                        $img             = Image::make($singleImage);

                        //original
                        $thumbnailPath = 'original/' . $singleImageName;
                        $originalImage = $img->response();
                        $originalImage = $originalImage->original;
                        Storage::disk('wasabi')->put($thumbnailPath, $originalImage);

                        //tiny
                        $tinyPath  = 'tiny/' . $singleImageName;
                        $tinyImage = $img->resize(160, 137, function ($constraint) {
                            $constraint->aspectRatio();
                            $constraint->upsize();
                        })->response();
                        $tinyImage = $tinyImage->original;
                        Storage::disk('wasabi')->put($tinyPath, $tinyImage);

                        //medium
                        $mediumPath  = 'medium/' . $singleImageName;
                        $mediumImage = $img->resize(800, 687, function ($constraint) {
                            $constraint->aspectRatio();
                            $constraint->upsize();
                        })->response();
                        $mediumImage = $mediumImage->original;
                        Storage::disk('wasabi')->put($mediumPath, $mediumImage);

                        //blur
                        $blurPath  = 'blur/' . $singleImageName;
                        $blurImage = $img->resize(800, 687, function ($constraint) {
                            $constraint->aspectRatio();
                            $constraint->upsize();
                        })->blur(20)->response();
                        $blurImage = $blurImage->original;
                        Storage::disk('wasabi')->put($blurPath, $blurImage);

                    } else {
                        $singleImage = 'noimage.png';
                    }

                    $item = Item::create([
                        'user_id'                => 1,
                        'city_id'                => $city->id,
                        'state_id'               => $state,
                        'country_id'             => $country->country_id,
                        'item_status'            => 2,
                        'item_featured'          => 0,
                        'item_featured_by_admin' => 0,
                        'item_title'             => $title,
                        'item_description'       => $item_description,
                        'item_address'           => $addressContent,
                        'item_website'           => $websiteContent,
                        'item_phone'             => $phoneContent,
                        'item_slug'              => $slug,
                        'item_image'             => $singleImageName,
                        'item_image_medium'      => $singleImageName,
                        'item_image_small'       => $singleImageName,
                        'item_image_tiny'        => $singleImageName,
                        'item_image_blur'        => $singleImageName,
                        'item_average_rating'    => $rating[0],
                        'item_lat'               => $coordinate[0],
                        'item_lng'               => $coordinate[1],

                    ]);
                    foreach ($reviewsContent as $key => $reviewsContentValue) {
                        $recommend = array(
                            'Yes',
                            'No',
                        );
                        $reviewTitle = mb_substr($reviewsContentValue, 0, 15);
                        Review::create([
                            'rating'                  => rand(12, 50) / 10,
                            'customer_service_rating' => rand(12, 50) / 10,
                            'quality_rating'          => rand(12, 50) / 10,
                            'friendly_rating'         => rand(12, 50) / 10,
                            'pricing_rating'          => rand(12, 50) / 10,
                            'recommend'               => array_rand($recommend),
                            'department'              => 'sales',
                            'title'                   => $reviewTitle,
                            'body'                    => $reviewsContentValue,
                            'approved'                => 1,
                            'reviewrateable_type'     => 'App\Item',
                            'reviewrateable_id'       => $item->id,
                            'author_type'             => 'App\User',
                            'author_id'               => rand(2, count($userCount)),
                            'created_at'              => $now,
                            'updated_at'              => $now,
                        ]);
                    }
                    if ('Not Available' !== $image) {
                        foreach ($image as $key => $imageValue) {
                            $imageGallery = parse_url($imageValue);
                            $imageName    = Str::slug($imageGallery['path'], '-') . '.png';

                            $imageValue = Image::make($imageValue);

                            $thumbnailPath  = 'galleryThumbnail/' . $imageName;
                            $thumbnailImage = $imageValue->resize(576, 180, function ($constraint) {
                                $constraint->aspectRatio();
                                $constraint->upsize();
                            })->response();
                            $thumbnailImage = $thumbnailImage->original;
                            Storage::disk('wasabi')->put($thumbnailPath, $thumbnailImage);

                            $thumbnailPath  = 'gallery/' . $imageName;
                            $thumbnailImage = $imageValue->response();
                            $thumbnailImage = $thumbnailImage->original;
                            Storage::disk('wasabi')->put($thumbnailPath, $thumbnailImage);

                            ItemImageGallery::create(
                                [
                                    'item_id'                       => $item->id,
                                    'item_image_gallery_name'       => $imageName,
                                    'item_image_gallery_thumb_name' => $imageName,
                                    'created_at'                    => $now,
                                    'updated_at'                    => $now,
                                ]
                            );
                        }
                    }
                } else {
                    echo "Product Page Not Found";
                }
            }
        } else {
            echo "Search Page Not Found";
            die;
        }
        die;
    }
}
