<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\View;
use App\Model\m_flag;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function __construct()
    {
        
    }
    public static function getConfig(){
        $config = m_flag::where('is_config',1)->get();
        $data = array();
        foreach($config as $con){
            $data[$con->flag_type] = $con->flag_value;
        }
        return $data;
    }
    public function echoSuccess($msg,$isJson=false){
        echo json_encode(array("status"=>1,"data"=>$msg));
        return;
    }
    public function echoResponse($data,$status=1){
        echo json_encode(array("status"=>$status,"data"=>$data));
    }
    public function echoErrors($errors,$isJson=true){
        if(is_array($errors)){
            if(!$isJson){
                foreach($errors as $values){
                    echo $values;
                    echo '</br>';
                }
            }else{
                $value = '';
                foreach($errors as $values){
                    $value.=$values.'</br>';
                }
                echo json_encode(array("status"=>0,"data"=>$value));
                return;
            }
        } else {
            echo json_encode(array("status"=>0,"data"=>$errors));
            return;
        }
    }
}
