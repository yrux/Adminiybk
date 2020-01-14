<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;
use Schema;
use App\Model\imagetable;

class MultiImageController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function index(Request $request){
        $message = 'Data Saved';
        $request2 = app('\App\Http\Requests\yTable'.$request->ytable_table.'Request');
        $strOrModel = !empty($request->modelName)?$request->modelName:$request->ytable_table;
        $model_name = 'App\Model\\'.$strOrModel;
        if(!empty($request->input($request->unique_column))){
            $model_name_test = $model_name::find($request->input($request->unique_column));
            try {
                app("App\Http\Controllers\Adminiy\DNE\CoreDeletesController")->deleteResizedImage($model_name_test->id);
            } catch(\Exception $ex){
                //dd($ex);
            }
            $message = 'Data Updated';
        } else {
            $model_name_test = new $model_name;
        }
        $table = $request->ytable_table;
        $anyImage = array();
        $inputs = $request->except(['modelName','ytable_table','unique_column']);
        $statusInputs = array('is_active','is_deleted','is_featured');
        foreach($inputs as $inputK=>$inputV){
            if(!in_array($inputK, $statusInputs)){
                if(Str::endsWith($inputK,'_image')){
                    array_push($anyImage,$inputK);
                } else {
                    $model_name_test->$inputK = $inputV;
                }
            } else {
                $model_name_test->$inputK = $inputV=='on'?'1':'0';
            }
        }
        $schema_cols = Schema::getColumnListing($request->ytable_table);
        foreach($statusInputs as $statusInput){
            if (!$request->has($statusInput)){
                foreach($schema_cols as $schema_col){
                    if($schema_col==$statusInput){
                        $model_name_test->$statusInput = 0;
                    }
                }
            }
        }
        if($model_name_test->save()){
            if(count($anyImage)>0){
                foreach($anyImage as $anyImageV){
                    $custom_file_name = time().'-'.$request->file($anyImageV)->getClientOriginalName();
                    $path = $request->file($anyImageV)->storeAs('Uploads/'.$table.'/'.md5(Str::random(20)),$custom_file_name,'public');
                    $model_name_test->img_path = $path;
                    $model_name_test->save();
                }
            }
            echo json_encode(array('status'=>'1','data'=>$message));
        }
    }
}
