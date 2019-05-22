<?php
namespace App\Http\Controllers\Adminiy\FCCallbackControllers;
use App\Http\Controllers\Controller;
use Helper;
use App\Model\m_flag;
use DB;
use Illuminate\Support\Str;
class m_flagController extends Controller
{
    public function __construct()
    {
        $favicon=Helper::OneColData('imagetable','img_path',"table_name='favicon' and ref_id=0 and is_active_img='1'");
        View()->share('v',config('app.vadminiy'));
        View()->share('favicon',$favicon);
    }
    public function beforeInsert($inputs){
    	$inputs['flag_value']=Str::title($inputs['flag_value']);
		/*$staff_role = implode(',',$inputs['staff_role']);
		unset($inputs['staff_role']);
		$inputs['staff_role']=$staff_role;
		return $inputs;*/
		return $inputs;
    }
	public function afterInsert($model){
		$m_flag=m_flag::find($model->id);
		$m_flag->user_id=0;
		$m_flag->save();
		/*DB::DELETE("DELETE FROM staff_set_roles where staff_id=".$model->id);
		$staff_roles = explode(',',$model->staff_role);
		foreach($staff_roles as $staff_role){
			$stafF_set_roles = new staff_set_roles;
			$stafF_set_roles->role_id = $staff_role;
			$stafF_set_roles->staff_id = $model->id;
			$stafF_set_roles->save();
		}*/
	}
	public function beforeDelete($table,$id,$col){
		/*before deleting record*/
	}
	public function afterDelete($table,$id,$col){
		/*after deleting record*/
	}
}
