<?php

namespace App\Http\Controllers\Adminiy\DNE;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DBController extends Controller
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function index()
    {
    	//dd(config('database.connections.mysql'));
    	$username=config('database.connections.mysql.username');
    	$password=config('database.connections.mysql.password');
    	$database=config('database.connections.mysql.database');
    	$port=config('database.connections.mysql.port');
    	$host=config('database.connections.mysql.host');
    	$charset=config('database.connections.mysql.charset');
    	return view('adminiy.db.index')->with('title','Database Administrator')->with(compact('username','password','database','port','host','charset'));
    }
}
