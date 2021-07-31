<?php

namespace App\Http\Controllers;

use App\Models\Restaurants;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RestaurantsController extends Controller
{
    public function index()
    {
        return DB::table('restaurants')->get();
    }
    public function store(Request $request)
    {
        Restaurants::create($request->all());
        return response()->json('save successfully', 200);
    }
}