<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use Auth;
use View;
use App\Model\imagetable;
use App\Model\m_flag;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Helpers\ImageUtil;

class FrontEndEditorController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function statusAjaxUpdateCustom(){
        if(count($_POST)>0){
            $updaters = '';
            $status = $_POST['ArrayofArrays'][4];
            if(is_array($_POST['ArrayofArrays'][0])){
                foreach($_POST['ArrayofArrays'][0] as $key=> $val){
                    $updaters.= $val ." = '".$status[$key]."',";
                }
                $updaters = rtrim($updaters,",");
            } else {
                $updaters.=$_POST['ArrayofArrays'][0]." = '".$status."'";
            }
            $query = "UPDATE ".$_POST['ArrayofArrays'][2]." set ".$updaters." where ".$_POST['ArrayofArrays'][2].".".$_POST['ArrayofArrays'][3]." = '".$_POST['ArrayofArrays'][1]."'";
            DB::UPDATE($query);
        }
    }
    public function statusAjaxUpdate(){
        if(count($_POST)>0){
            $status = $_POST['ArrayofArrays'][4]=='1'?0:'';
            $status = $_POST['ArrayofArrays'][4]=='0'?1:'';
            if($status==''){
                $status = 0;
            } else {
                $status = 1;
            }
            $query = "UPDATE ".$_POST['ArrayofArrays'][2]." set ".$_POST['ArrayofArrays'][0]." = '".$status."' where ".$_POST['ArrayofArrays'][2].".".$_POST['ArrayofArrays'][3]." = '".$_POST['ArrayofArrays'][1]."'";
            DB::UPDATE($query);
        }
    }
    public function updateFlagOnKey(){
        if(is_adminiy()){
            if(count($_POST)>0){
                $key = $_POST['ArrayofArrays'][0];
                $content = '';
                $attr = '';
                if(is_array($_POST['ArrayofArrays'][1])){
                    $content = $_POST['ArrayofArrays'][1][0];
                    $attr = $_POST['ArrayofArrays'][1][1];
                } else {
                    $content = htmlspecialchars($_POST['ArrayofArrays'][1],ENT_QUOTES);
                }
                DB::DELETE("DELETE FROM m_flag where flag_type = '".$key."'");
                DB::INSERT("INSERT INTO m_flag (flag_type,flag_value,flag_additionalText,flag_show_text,is_active,is_featured) values('".$key."','".$key."','$content','$attr','1','1')");
                echo 'success';
            }
        }
    }
    public function imageUpload(Request $request){
        $data = explode("|",$_POST['id']);
        if(!empty($_FILES)){
            if(!empty($_FILES['file'])){
                $_FILES['file']['img_href'] = $_POST['href'];
            }
        }
        if($request->has('file')){
            if(count($data)>3){
                //$imageSavefooter = $this->imageUpload($_FILES,'file',$data[2],$data[1],1,true,$data[3],$data[4],1,true);
                $imageSavefooter='';
            } else {
                $imagetable=imagetable::where('table_name',$data[0])->first();
                if($imagetable){
                    $imageid=$imagetable->id;
                    try {
                        $imagetable=imagetable::where('table_name',$data[0])->delete();
                        app("App\Http\Controllers\Adminiy\DNE\CoreDeletesController")->deleteResizedImage($imageid);
                    }catch(\Exception $ex){
                    }
                }
                $imagetable = new imagetable;
                $imagetable->table_name=$data[0];
                $imagetable->ref_id=0;
                $imagetable->type=1;
                $imagetable->is_active_img=1;
                $path = $request->file('file')->store('Uploads/imagetable/'.md5(Str::random(20)), 'public');
                    $imagetable->img_path = $path;
                    $imagetable->save();
                $imageSavefooter=$imagetable->id;
            }
            echo ImageUtil::gethref($imageSavefooter,$data[1],$data[2]);
        }
    }
}
