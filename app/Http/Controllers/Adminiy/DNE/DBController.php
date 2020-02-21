<?php

namespace App\Http\Controllers\Adminiy\DNE;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use DB;

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
    public function firequery(Request $req){
        $result=[];
        if(Str::startsWith(strtolower($req->querybox),"select")){
            /*for select statement*/
            $result=DB::SELECT($req->querybox." limit ".$req->default_limit_start.",".$req->default_limit_end);
        }else if(Str::startsWith(strtolower($req->querybox),"update")){
            /*for update statement*/
            $result=DB::Update($req->querybox);
        }else if(Str::startsWith(strtolower($req->querybox),"delete")){
            /*for delete statement*/
            $result=DB::Delete($req->querybox);
        }else if(Str::startsWith(strtolower($req->querybox),"drop")){
            /*for drop statement*/
            $result=DB::Statement($req->querybox);
        }else if(Str::startsWith(strtolower($req->querybox),"insert")){
            /*for insert statement*/
            $result=DB::Insert($req->querybox);
        }else{
            $result=DB::Statement($req->querybox);
            /*other statemetns*/
        }
        return redirect()->back()->with('query_response',$result);
    }
}
