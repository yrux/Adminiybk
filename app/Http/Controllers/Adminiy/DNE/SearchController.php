<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use Auth;
use View;
use App\Model\imagetable;
use App\Model\m_flag;

class SearchController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function index()
    {
    	$imagetable = imagetable::where('is_active_img','1');
    	if(!empty($_GET['q'])){
    		$imagetable = $imagetable->where('table_name',$_GET['q']);
    	}
    	$count=$imagetable->count();
    	$data = $imagetable->get();
        return view('adminiy.search.index')->with('title','Image Search')->with(compact('data','count'));
    }
}
