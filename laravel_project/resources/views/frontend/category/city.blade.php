@extends('frontend.layouts.app')

@section('styles')

    @if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_OPEN_STREET_MAP)
        <link href="{{ asset('frontend/vendor/leaflet/leaflet.css') }}" rel="stylesheet" />
    @endif

    <link href="{{ asset('frontend/vendor/bootstrap-select/bootstrap-select.min.css') }}" rel="stylesheet" />
@endsection

@section('content')

    @if($site_innerpage_header_background_type == \App\Customization::SITE_INNERPAGE_HEADER_BACKGROUND_TYPE_DEFAULT)
        <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url( {{ asset('frontend/images/placeholder/header-inner.webp') }});" data-aos="fade" data-stellar-background-ratio="0.5">

    @elseif($site_innerpage_header_background_type == \App\Customization::SITE_INNERPAGE_HEADER_BACKGROUND_TYPE_COLOR)
        <div class="site-blocks-cover inner-page-cover overlay" style="background-color: {{ $site_innerpage_header_background_color }};" data-aos="fade" data-stellar-background-ratio="0.5">

    @elseif($site_innerpage_header_background_type == \App\Customization::SITE_INNERPAGE_HEADER_BACKGROUND_TYPE_IMAGE)
        <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url( {{ Storage::disk('public')->url('customization/' . $site_innerpage_header_background_image) }});" data-aos="fade" data-stellar-background-ratio="0.5">

    @elseif($site_innerpage_header_background_type == \App\Customization::SITE_INNERPAGE_HEADER_BACKGROUND_TYPE_YOUTUBE_VIDEO)
        <div class="site-blocks-cover inner-page-cover overlay" style="background-color: #333333;" data-aos="fade" data-stellar-background-ratio="0.5">
    @endif

        @if($site_innerpage_header_background_type == \App\Customization::SITE_INNERPAGE_HEADER_BACKGROUND_TYPE_YOUTUBE_VIDEO)
            <div data-youtube="{{ $site_innerpage_header_background_youtube_video }}"></div>
        @endif

        <div class="container">
            <div class="row align-items-center justify-content-center text-center">

                <div class="col-md-10" data-aos="fade-up" data-aos-delay="400">


                    <div class="row justify-content-center mt-5">
                        <div class="col-md-8 text-center">
                            <h1 style="color: {{ $site_innerpage_header_title_font_color }};">{{ $category->category_name }}</h1>
                            <p class="mb-0" style="color: {{ $site_innerpage_header_paragraph_font_color }};">{{ $city->city_name }}, {{ $state->state_name }}</p>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="site-section">
        <div class="container">

            @if($children_categories->count() > 0)
                <div class="overlap-category mb-5">

                    <div class="row align-items-stretch no-gutters">
                        @foreach( $children_categories as $key => $children_category )
                            <div class="col-sm-6 col-md-4 mb-4 mb-lg-0 col-lg-2">
                                <a href="{{ route('page.category.state', ['category_slug' => $children_category->category_slug, 'state_slug' => $state->state_slug]) }}" class="popular-category h-100">

                                    @if($children_category->category_icon)
                                        <span class="icon"><span><i class="{{ $children_category->category_icon }}"></i></span></span>
                                    @else
                                        <span class="icon"><span><i class="fas fa-heart"></i></span></span>
                                    @endif

                                    <span class="caption mb-2 d-block">{{ $children_category->category_name }}</span>
                                </a>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif

            <!-- Start Filter -->
            <form method="GET" action="{{ route('page.category.state.city', ['category_slug' => $category->category_slug, 'state_slug' => $state->state_slug, 'city_slug' => $city->city_slug]) }}" id="filter_form">
                <div class="row pt-3 pb-3 ml-1 mr-1 mb-5 rounded border">
                    <div class="col-12">

                        @if($ads_before_breadcrumb->count() > 0)
                            @foreach($ads_before_breadcrumb as $ads_before_breadcrumb_key => $ad_before_breadcrumb)
                                <div class="row mb-4">
                                    @if($ad_before_breadcrumb->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_LEFT)
                                        <div class="col-12 text-left">
                                            <div>
                                                {!! $ad_before_breadcrumb->advertisement_code !!}
                                            </div>
                                        </div>
                                    @elseif($ad_before_breadcrumb->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_CENTER)
                                        <div class="col-12 text-center">
                                            <div>
                                                {!! $ad_before_breadcrumb->advertisement_code !!}
                                            </div>
                                        </div>
                                    @elseif($ad_before_breadcrumb->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_RIGHT)
                                        <div class="col-12 text-right">
                                            <div>
                                                {!! $ad_before_breadcrumb->advertisement_code !!}
                                            </div>
                                        </div>
                                    @endif

                                </div>
                            @endforeach
                        @endif
                        <div class="row">
                            <div class="col-md-12">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb bg-white pl-0 pr-0">
                                        <li class="breadcrumb-item">
                                            <a href="{{ route('page.home') }}">
                                                <i class="fas fa-bars"></i>
                                                {{ __('frontend.shared.home') }}
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="{{ route('page.categories') }}">{{ __('frontend.item.all-categories') }}</a></li>
                                        @foreach($parent_categories as $key => $parent_category)
                                            <li class="breadcrumb-item"><a href="{{ route('page.category', $parent_category->category_slug) }}">{{ $parent_category->category_name }}</a></li>
                                        @endforeach
                                        <li class="breadcrumb-item"><a href="{{ route('page.category', $category->category_slug) }}">{{ $category->category_name }}</a></li>
                                        <li class="breadcrumb-item"><a href="{{ route('page.category.state', ['category_slug'=>$category->category_slug, 'state_slug'=>$state->state_slug]) }}">{{ $state->state_name }}</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">{{ $city->city_name }}</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        @if($ads_after_breadcrumb->count() > 0)
                                @foreach($ads_after_breadcrumb as $ads_after_breadcrumb_key => $ad_after_breadcrumb)
                                    <div class="row mb-5">
                                        @if($ad_after_breadcrumb->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_LEFT)
                                            <div class="col-12 text-left">
                                                <div>
                                                    {!! $ad_after_breadcrumb->advertisement_code !!}
                                                </div>
                                            </div>
                                        @elseif($ad_after_breadcrumb->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_CENTER)
                                            <div class="col-12 text-center">
                                                <div>
                                                    {!! $ad_after_breadcrumb->advertisement_code !!}
                                                </div>
                                            </div>
                                        @elseif($ad_after_breadcrumb->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_RIGHT)
                                            <div class="col-12 text-right">
                                                <div>
                                                    {!! $ad_after_breadcrumb->advertisement_code !!}
                                                </div>
                                            </div>
                                        @endif

                                    </div>
                                @endforeach
                            @endif

                        <div class="row form-group align-items-center">
                            <div class="col-12 col-md-2">
                                <strong>{{ $total_results }}</strong>
                                {{ __('theme_directory_hub.filter-results') }}
                            </div>
                            <div class="col-12 col-md-7 text-right pl-0">
                                {{ __('theme_directory_hub.filter-filter-by') }}
                            </div>

                            <div class="col-12 col-md-3 pl-0">
                                <select class="selectpicker form-control @error('filter_sort_by') is-invalid @enderror" name="filter_sort_by" id="filter_sort_by">
                                    <option value="{{ \App\Item::ITEMS_SORT_BY_NEWEST_CREATED }}" {{ $filter_sort_by == \App\Item::ITEMS_SORT_BY_NEWEST_CREATED ? 'selected' : '' }}>{{ __('listings_filter.sort-by-newest') }}</option>
                                    <option value="{{ \App\Item::ITEMS_SORT_BY_OLDEST_CREATED }}" {{ $filter_sort_by == \App\Item::ITEMS_SORT_BY_OLDEST_CREATED ? 'selected' : '' }}>{{ __('listings_filter.sort-by-oldest') }}</option>
                                    <option value="{{ \App\Item::ITEMS_SORT_BY_HIGHEST_RATING }}" {{ $filter_sort_by == \App\Item::ITEMS_SORT_BY_HIGHEST_RATING ? 'selected' : '' }}>{{ __('listings_filter.sort-by-highest') }}</option>
                                    <option value="{{ \App\Item::ITEMS_SORT_BY_LOWEST_RATING }}" {{ $filter_sort_by == \App\Item::ITEMS_SORT_BY_LOWEST_RATING ? 'selected' : '' }}>{{ __('listings_filter.sort-by-lowest') }}</option>
                                    <option value="{{ \App\Item::ITEMS_SORT_BY_NEARBY_FIRST }}" {{ $filter_sort_by == \App\Item::ITEMS_SORT_BY_NEARBY_FIRST ? 'selected' : '' }}>{{ __('theme_directory_hub.filter-sort-by-nearby-first') }}</option>
                                </select>
                                @error('filter_sort_by')
                                <span class="invalid-tooltip">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>
                        <hr>

                        @if($children_categories->count() > 0)

                            <div class="row">

                                @foreach($children_categories as $children_categories_key => $children_category)
                                    <div class="col-6 col-sm-4 col-md-3">
                                        <div class="form-check filter_category_div">
                                            <input {{ in_array($children_category->id, $filter_categories) ? 'checked' : '' }} name="filter_categories[]" class="form-check-input" type="checkbox" value="{{ $children_category->id }}" id="filter_categories_{{ $children_category->id }}">
                                            <label class="form-check-label" for="filter_categories_{{ $children_category->id }}">
                                                {{ $children_category->category_name }}
                                            </label>
                                        </div>
                                    </div>
                                    @error('filter_categories')
                                    <span class="invalid-tooltip">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                @endforeach
                            </div>
                            <div class="row">
                                <div class="col-12 text-center">
                                    <a href="javascript:;" class="show_more text-sm">{{ __('listings_filter.show-more') }}</a>
                                </div>
                            </div>
                            <hr>

                        @endif

                        <div class="row">
                            <div class="col-12 text-right">
                                <a class="btn btn-sm btn-outline-primary rounded" href="{{ route('page.category.state.city', ['category_slug' => $category->category_slug, 'state_slug' => $state->state_slug, 'city_slug' => $city->city_slug]) }}">
                                    {{ __('theme_directory_hub.filter-link-reset-all') }}
                                </a>
                                <a class="btn btn-sm btn-primary text-white rounded" id="filter_form_submit">
                                    {{ __('theme_directory_hub.filter-button-filter-results') }}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- End Filter -->

            <div class="row">
                <div class="col-lg-6">

                    <div class="row mb-4">
                        <div class="col-md-12 text-left border-primary">
                            <h2 class="font-weight-light text-primary">{{ __('frontend.category.city.sub-title-1', ['category_name' => $category->category_name, 'city_name' => $city->city_name, 'state_name' => $state->state_name]) }}</h2>
                        </div>
                    </div>

                    @if($ads_before_content->count() > 0)
                        @foreach($ads_before_content as $ads_before_content_key => $ad_before_content)
                            <div class="row mb-5">
                                @if($ad_before_content->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_LEFT)
                                    <div class="col-12 text-left">
                                        <div>
                                            {!! $ad_before_content->advertisement_code !!}
                                        </div>
                                    </div>
                                @elseif($ad_before_content->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_CENTER)
                                    <div class="col-12 text-center">
                                        <div>
                                            {!! $ad_before_content->advertisement_code !!}
                                        </div>
                                    </div>
                                @elseif($ad_before_content->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_RIGHT)
                                    <div class="col-12 text-right">
                                        <div>
                                            {!! $ad_before_content->advertisement_code !!}
                                        </div>
                                    </div>
                                @endif

                            </div>
                        @endforeach
                    @endif

                    <div class="row">

                        @if($paid_items->count() > 0)
                            @foreach($paid_items as $paid_items_key => $item)
                                <div class="col-lg-6">
                                    @include('frontend.partials.paid-item-block')
                                </div>
                            @endforeach
                        @endif

                        @if($free_items->count() > 0)
                            @foreach($free_items as $free_items_key => $item)
                                <div class="col-lg-6">
                                    @include('frontend.partials.free-item-block')
                                </div>
                            @endforeach
                        @endif

                    </div>

                    <div class="row">
                        <div class="col-12">

                            {{ $pagination->links() }}
                        </div>
                    </div>

                    @if($ads_after_content->count() > 0)
                        @foreach($ads_after_content as $ads_after_content_key => $ad_after_content)
                            <div class="row mt-5">
                                @if($ad_after_content->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_LEFT)
                                    <div class="col-12 text-left">
                                        <div>
                                            {!! $ad_after_content->advertisement_code !!}
                                        </div>
                                    </div>
                                @elseif($ad_after_content->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_CENTER)
                                    <div class="col-12 text-center">
                                        <div>
                                            {!! $ad_after_content->advertisement_code !!}
                                        </div>
                                    </div>
                                @elseif($ad_after_content->advertisement_alignment == \App\Advertisement::AD_ALIGNMENT_RIGHT)
                                    <div class="col-12 text-right">
                                        <div>
                                            {!! $ad_after_content->advertisement_code !!}
                                        </div>
                                    </div>
                                @endif

                            </div>
                        @endforeach
                    @endif

                </div>

                <div class="col-lg-6">
                    <div class="sticky-top" id="mapid-box"></div>
                </div>

            </div>
        </div>
    </div>

    @if($all_item_cities->count() > 0)
    <div class="site-section bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-7 text-left border-primary">
                    <h2 class="font-weight-light text-primary">{{ __('frontend.category.city.sub-title-2', ['category_name' => $category->category_name, 'state_name' => $state->state_name]) }}</h2>
                </div>
            </div>
            <div class="row mt-5">

                @foreach($all_item_cities as $all_item_cities_key => $item_city)
                    <div class="col-sm-12 col-md-6 col-lg-4 mb-3">
                        <a href="{{ route('page.category.state.city', ['category_slug' => $category->category_slug, 'state_slug' => $state->state_slug, 'city_slug' => $item_city->city->city_slug]) }}">{{ $item_city->city->city_name }} {{ $category->category_name }}</a>
                    </div>
                @endforeach

            </div>
        </div>
    </div>
    @endif


@endsection

@section('scripts')

    @if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_OPEN_STREET_MAP)
    <!-- Make sure you put this AFTER Leaflet's CSS -->
        <script src="{{ asset('frontend/vendor/leaflet/leaflet.js') }}"></script>
    @endif

    @if($site_innerpage_header_background_type == \App\Customization::SITE_INNERPAGE_HEADER_BACKGROUND_TYPE_YOUTUBE_VIDEO)
        <!-- Youtube Background for Header -->
            <script src="{{ asset('frontend/vendor/jquery-youtube-background/jquery.youtube-background.js') }}"></script>
    @endif

    <script src="{{ asset('frontend/vendor/bootstrap-select/bootstrap-select.min.js') }}"></script>
    @include('frontend.partials.bootstrap-select-locale')
    <script>

        $(document).ready(function(){

            @if($site_innerpage_header_background_type == \App\Customization::SITE_INNERPAGE_HEADER_BACKGROUND_TYPE_YOUTUBE_VIDEO)
            /**
             * Start Initial Youtube Background
             */
            $("[data-youtube]").youtube_background();
            /**
             * End Initial Youtube Background
             */
            @endif

            /**
             * Start initial map box with OpenStreetMap
             */
            @if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_OPEN_STREET_MAP)

            @if(count($paid_items) || count($free_items))

            var window_height = $(window).height();
            $('#mapid-box').css('height', window_height + 'px');

            var map = L.map('mapid-box', {
                zoom: 15,
                scrollWheelZoom: true,
            });

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            var bounds = [];
            @foreach($paid_items as $key => $paid_item)
                @if($paid_item->item_type == \App\Item::ITEM_TYPE_REGULAR)
                    bounds.push([ {{ $paid_item->item_lat }}, {{ $paid_item->item_lng }} ]);
                    var marker = L.marker([{{ $paid_item->item_lat }}, {{ $paid_item->item_lng }}]).addTo(map);

                    @if($paid_item->item_address_hide)
                    marker.bindPopup("{{ $paid_item->item_title . ', ' . $paid_item->city->city_name . ', ' . $paid_item->state->state_name . ' ' . $paid_item->item_postal_code }}");
                    @else
                    marker.bindPopup("{{ $paid_item->item_title . ', ' . $paid_item->item_address . ', ' . $paid_item->city->city_name . ', ' . $paid_item->state->state_name . ' ' . $paid_item->item_postal_code }}");
                    @endif
                @endif
            @endforeach

            @foreach($free_items as $key => $free_item)
                @if($free_item->item_type == \App\Item::ITEM_TYPE_REGULAR)
                    bounds.push([ {{ $free_item->item_lat }}, {{ $free_item->item_lng }} ]);
                    var marker = L.marker([{{ $free_item->item_lat }}, {{ $free_item->item_lng }}]).addTo(map);

                    @if($free_item->item_address_hide)
                    marker.bindPopup("{{ $free_item->item_title . ', ' . $free_item->city->city_name . ', ' . $free_item->state->state_name . ' ' . $free_item->item_postal_code }}");
                    @else
                    marker.bindPopup("{{ $free_item->item_title . ', ' . $free_item->item_address . ', ' . $free_item->city->city_name . ', ' . $free_item->state->state_name . ' ' . $free_item->item_postal_code }}");
                    @endif
                @endif
            @endforeach

            map.fitBounds(bounds);

            @endif

            @endif
            /**
             * End initial map box with OpenStreetMap
             */

            /**
             * Start show more/less
             */
            //this will execute on page load(to be more specific when document ready event occurs)
            @if(count($filter_categories) == 0)
            if ($(".filter_category_div").length > 7)
            {
                $(".filter_category_div:gt(7)").hide();
                $(".show_more").show();
            }
            else
            {
                $(".show_more").hide();
            }
            @else
            if ($(".filter_category_div").length > 7)
            {
                $(".show_more").text("{{ __('listings_filter.show-less') }}");
                $(".show_more").show();
            }
            else
            {
                $(".show_more").hide();
            }
            @endif

            $(".show_more").on('click', function() {
                //toggle elements with class .ty-compact-list that their index is bigger than 2
                $(".filter_category_div:gt(7)").toggle();
                //change text of show more element just for demonstration purposes to this demo
                $(this).text() === "{{ __('listings_filter.show-more') }}" ? $(this).text("{{ __('listings_filter.show-less') }}") : $(this).text("{{ __('listings_filter.show-more') }}");
            });
            /**
             * End show more/less
             */

            /**
             * Start filter form submit
             */
            $("#filter_form_submit").on('click', function() {
                $("#filter_form").submit();
            });
            /**
             * End filter form submit
             */

        });

    </script>

    @if($site_global_settings->setting_site_map == \App\Setting::SITE_MAP_GOOGLE_MAP)
            <script>
                // Initial the google map
                function initMap() {

                    @if(count($paid_items) || count($free_items))

                    var window_height = $(window).height();
                    $('#mapid-box').css('height', window_height + 'px');

                    var locations = [];

                    @foreach($paid_items as $key => $paid_item)
                        @if($paid_item->item_type == \App\Item::ITEM_TYPE_REGULAR)
                            locations.push([ '{{ $paid_item->item_title }}', {{ $paid_item->item_lat }}, {{ $paid_item->item_lng }} ]);
                        @endif
                    @endforeach

                    @foreach($free_items as $key => $free_item)
                        @if($free_item->item_type == \App\Item::ITEM_TYPE_REGULAR)
                    locations.push([ '{{ $free_item->item_title }}', {{ $free_item->item_lat }}, {{ $free_item->item_lng }} ]);
                        @endif
                    @endforeach

                    var map = new google.maps.Map(document.getElementById('mapid-box'), {
                            zoom: 12,
                            //center: new google.maps.LatLng(-33.92, 151.25),
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        });

                    //create empty LatLngBounds object
                    var bounds = new google.maps.LatLngBounds();
                    var infowindow = new google.maps.InfoWindow();

                    var marker, i;

                    for (i = 0; i < locations.length; i++) {
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                            map: map
                        });

                        //extend the bounds to include each marker's position
                        bounds.extend(marker.position);

                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                                infowindow.setContent(locations[i][0]);
                                infowindow.open(map, marker);
                            }
                        })(marker, i));
                    }

                    //now fit the map to the newly inclusive bounds
                    map.fitBounds(bounds);

                    //(optional) restore the zoom level after the map is done scaling
                    // var listener = google.maps.event.addListener(map, "idle", function () {
                    //     map.setZoom(5);
                    //     google.maps.event.removeListener(listener);
                    // });

                    @endif
                }

            </script>
            <script async defer src="https://maps.googleapis.com/maps/api/js??v=quarterly&key={{ $site_global_settings->setting_site_map_google_api_key }}&callback=initMap"></script>
    @endif

@endsection
