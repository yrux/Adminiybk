<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;
use Schema;
use App\Model\imagetable;

class fastCRUDController extends IndexController
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
            $message = 'Data Updated';
        } else {
            $model_name_test = new $model_name;
        }
        $table = $request->ytable_table;
        if($table=='imagetable'){
            app('App\Http\Controllers\Adminiy\DNE\MultiImageController')->index($request);
            return;
        }
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
                    $imageTable_add = Str::replaceLast('_image', '', $anyImageV);
                    $unique_column = $request->unique_column;
                    $imagetable = imagetable::where('table_name',$imageTable_add)->where('type',1)->where('ref_id',$model_name_test->$unique_column)->first();
                    if(!$imagetable){
                        $imagetable = new imagetable;
                    } else {
                        $directories = explode('/', $imagetable->img_path);
                        //echo $directories[(count($directories)-2)];
                        Storage::disk('public')->delete($imagetable->img_path);
                        Storage::disk('public')->deleteDirectory($directories[(count($directories)-2)]);
                    }
                    $imagetable->table_name = $imageTable_add;
                    $imagetable->ref_id = $model_name_test->$unique_column;
                    $imagetable->type = 1;
                    $path = $request->file($anyImageV)->store('Uploads/'.$table.'/'.md5(Str::random(20)), 'public');
                    $imagetable->img_path = $path;
                    $imagetable->save();
                }
            }
            echo json_encode(array('status'=>'1','data'=>$message));
        }
    }
}