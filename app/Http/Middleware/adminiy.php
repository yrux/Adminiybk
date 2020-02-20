<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class adminiy
{
    public function handle($request, Closure $next)
    {
        if(is_adminiy()){
            return $next($request);
        } else {
            return redirect()->route('adminiy.login')->with('notify_error','You need to login before accessing Admin Dashboard');
        }
    }
    public function terminate($request, $response){
    	
    }
}
