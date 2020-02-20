<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use DB;
use Artisan;
use Illuminate\Http\Request;
class CommandExecutionController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function index(){
        return view('adminiy.commandexecute')->with('commandMenu',true)->with('title','Artisan Console');
    }
    public function execute(Request $req){
        $arr = [];
        if($req->commandkey){
            foreach($req->commandkey as $popk=>$propv){
                $arr[$propv]=$req->commandval[$popk];
            }
        }
        Artisan::call($req->command,$arr);
        return back()->with('artisan_output',Artisan::output());
    }
}
