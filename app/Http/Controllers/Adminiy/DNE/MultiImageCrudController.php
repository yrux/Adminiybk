<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;
use Schema;
use App\Model\imagetable;
use Illuminate\Support\Collection;

class MultiImageCrudController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function get(Request $req){
    	$tables = [];
    	$ids = [];
    	if($req->imagetablearray){
	    	foreach($req->imagetablearray as $arrk=>$arr){
	    		array_push($tables, $arrk);
	    		array_push($ids, $arr['value']);
	    	}
    	}
        $data=imagetable::whereIn('type',[1,2])->whereIn('table_name',$tables)->whereIn('ref_id',$ids)->get();
        $this->echoSuccess(\collect($data)->groupBy('table_name'));
        //foreach($data)
    }
	public function getone($table,$id,Request $req){
		$data=imagetable::where('type',2)->where('table_name',$req->table)->where('ref_id',$req->id)->get();
		$this->echoSuccess($data);
	}
}
