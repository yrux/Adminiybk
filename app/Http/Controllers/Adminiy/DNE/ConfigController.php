<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use DB;

class ConfigController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function config(){
        return view('adminiy.config')->with('configMenu',true)->with('title','Additional Settings');
    }
    public function configSave(){
        $errorsUpload = 0;
        if(isset($_POST)){
            foreach($_POST as $key=>$value){
                if($key=='_token'){
                    continue;
                }
                DB::UPDATE("UPDATE m_flag set flag_value = '".$value."',flag_additionalText = '".$value."' where flag_type = '".$key."'");
                $errorsUpload=1;
            }
        }
        return redirect()->route('adminiy.config')->with('notify_message',$errorsUpload == 1 ? 'Updated Successfully' : 'Failed to Update Settings. Please Try Again!');
    }
}
