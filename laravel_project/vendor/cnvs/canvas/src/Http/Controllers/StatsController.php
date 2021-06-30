<?php

namespace Canvas\Http\Controllers;

use Canvas\Post;
use Canvas\Tracker;
use Canvas\View;
use Canvas\Visit;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller;

class StatsController extends Controller
{
    use Tracker;

    /**
     * Number of days to get stats for.
     *
     * @const int
     */
    private const DAYS = 30;

    /**
     * Display a listing of the resource.
     *
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        $published = Post::forCurrentUser()
                         ->published()
                         ->latest()
                         ->get();

        $views = View::select('created_at')
                     ->whereIn('post_id', $published->pluck('id'))
                     ->whereBetween('created_at', [
                         today()->subDays(self::DAYS)->startOfDay()->toDateTimeString(),
                         today()->endOfDay()->toDateTimeString(),
                     ])->get();

        $visits = Visit::select('created_at')
                       ->whereIn('post_id', $published->pluck('id'))
                       ->whereBetween('created_at', [
                           today()->subDays(self::DAYS)->startOfDay()->toDateTimeString(),
                           today()->endOfDay()->toDateTimeString(),
                       ])->get();

        return response()->json([
            'view_count' => $views->count(),
            'view_trend' => json_encode($this->countTrackedData($views, self::DAYS)),
            'visit_count' => $visits->count(),
            'visit_trend' => json_encode($this->countTrackedData($visits, self::DAYS)),
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param string $id
     * @return JsonResponse
     */
    public function show(string $id): JsonResponse
    {
        $post = Post::forCurrentUser()->find($id);

        if ($post && $post->published) {
            $views = View::where('post_id', $post->id)->get();
            $previousMonthlyViews = $views->whereBetween('created_at', [
                today()->subMonth()->startOfMonth()->startOfDay()->toDateTimeString(),
                today()->subMonth()->endOfMonth()->endOfDay()->toDateTimeString(),
            ]);
            $currentMonthlyViews = $views->whereBetween('created_at', [
                today()->startOfMonth()->startOfDay()->toDateTimeString(),
                today()->endOfMonth()->endOfDay()->toDateTimeString(),
            ]);
            $lastThirtyDays = $views->whereBetween('created_at', [
                today()->subDays(self::DAYS)->startOfDay()->toDateTimeString(),
                today()->endOfDay()->toDateTimeString(),
            ]);

            $visits = Visit::where('post_id', $post->id)->get();
            $previousMonthlyVisits = $visits->whereBetween('created_at', [
                today()->subMonth()->startOfMonth()->startOfDay()->toDateTimeString(),
                today()->subMonth()->endOfMonth()->endOfDay()->toDateTimeString(),
            ]);
            $currentMonthlyVisits = $visits->whereBetween('created_at', [
                today()->startOfMonth()->startOfDay()->toDateTimeString(),
                today()->endOfMonth()->endOfDay()->toDateTimeString(),
            ]);

            return response()->json([
                'post' => $post,
                'read_time' => $post->read_time,
                'popular_reading_times' => $post->popular_reading_times,
                'traffic' => $post->top_referers,
                'view_count' => $currentMonthlyViews->count(),
                'view_trend' => json_encode($this->countTrackedData($lastThirtyDays, self::DAYS)),
                'view_month_over_month' => $this->compareMonthToMonth($currentMonthlyViews, $previousMonthlyViews),
                'view_count_lifetime' => $views->count(),
                'visit_count' => $currentMonthlyVisits->count(),
                'visit_trend' => json_encode($this->countTrackedData($visits, self::DAYS)),
                'visit_month_over_month' => $this->compareMonthToMonth($currentMonthlyVisits, $previousMonthlyVisits),
            ]);
        } else {
            return response()->json(null, 404);
        }
    }
}
