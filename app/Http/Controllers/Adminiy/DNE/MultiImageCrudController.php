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
        $data=imagetable::where('type',2)->whereIn('table_name',$req->tables)->whereIn('ref_id',$req->ids);
        foreach($data)
    }
}
