<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use Auth;
use DB;
use Request;

class ytableCheckboxController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function update(Request $request)
    {
        $_POST['val'] = $_POST['val']=='true'?'1':'0';
    	DB::table($_POST['table'])->where($_POST['refcol'],$_POST['uid'])->update([$_POST['column']=>$_POST['val']]);
    	$this->echoSuccess('updated');
    }
}