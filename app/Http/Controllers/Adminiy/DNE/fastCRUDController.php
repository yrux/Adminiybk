<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Storage;
use Schema;
use App\Model\imagetable;
use App\Model\Image;

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
        $multiImage = array();
        $inputs = $request->except(['modelName','ytable_table','unique_column']);
        $statusInputs = array('is_active','is_deleted','is_featured');
        /*before save*/
        try{
            $inputs = app("App\Http\Controllers\Adminiy\FCCallbackControllers\\".$table."Controller")->beforeInsert($inputs);
        }catch(\Exception $ex){
            
        }
        /*before save end*/
        foreach($inputs as $inputK=>$inputV){
            if(!in_array($inputK, $statusInputs)){
                if(Str::endsWith($inputK,'_image')){
                    array_push($anyImage,$inputK);
                } else if(Str::endsWith($inputK,'_multiimage')){
                    array_push($multiImage,$inputK);
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
            $unique_column = $request->unique_column;
            if(count($anyImage)>0){
                foreach($anyImage as $anyImageV){
                    $imageTable_add = Str::replaceLast('_image', '', $anyImageV);
                    $imagetable = imagetable::where('table_name',$imageTable_add)->where('type',1)->where('ref_id',$model_name_test->$unique_column)->first();
                    if(!$imagetable){
                        $imagetable = new imagetable;
                    } else {
                        try {
                            app("App\Http\Controllers\Adminiy\DNE\CoreDeletesController")->deleteResizedImage($imagetable->id);
                        }catch(\Exception $ex){
                            //dd($ex);
                        }
                        $directories = explode('/', $imagetable->img_path);
                        //echo $directories[(count($directories)-2)];
                        Storage::disk('public')->delete($imagetable->img_path);
                        Storage::disk('public')->deleteDirectory($directories[(count($directories)-2)]);
                    }
                    $imagetable->table_name = $imageTable_add;
                    $imagetable->ref_id = $model_name_test->$unique_column;
                    $imagetable->type = 1;
                    $custom_file_name = time().'-'.$request->file($anyImageV)->getClientOriginalName();
                    $path = $request->file($anyImageV)->storeAs('Uploads/'.$table.'/'.md5(Str::random(20)),$custom_file_name,'public');
                    $imagetable->img_path = $path;
                    $imagetable->save();
                    // dump($model_name_test->$imageTable_add());
                    //echo $model_name_test->$imageTable_add()->delete();
                    Image::where('imageable_id',$model_name_test->$unique_column)->where('imageable_type',get_class($model_name_test))->where('table_name',$imageTable_add)->delete();
                    $img = new Image;
                    $img->create([
                        'url'=>$path,
                        'imageable_id'=>$model_name_test->$unique_column,
                        'imageable_type'=>get_class($model_name_test),
                        'table_name'=>$imageTable_add
                    ]);
                }
            }
            /*for multiimage*/
            if(count($multiImage)>0){
                foreach($multiImage as $multiImageV){
                    $imageTable_add = Str::replaceLast('_multiimage', '', $multiImageV);
                    foreach($request->file($multiImageV) as $image){
                        $imagetable = new imagetable;
                        $imagetable->table_name = $imageTable_add;
                        $imagetable->type=2;
                        $imagetable->ref_id = $model_name_test->$unique_column;
                        $custom_file_name = time().'-'.$image->getClientOriginalName();
                        $path = $image->storeAs('Uploads/'.$table.'/'.md5(Str::random(20)),$custom_file_name,'public');
                        $imagetable->img_path = $path;
                        $imagetable->save();
                        // $model_name_test->image()->delete();
                        // $model_name_test->image()->firstOrCreate([
                        //     'url'=>$path,
                        //     'imageable_id'=>$model_name_test->$unique_column,
                        //     'imageable_type'=>get_class($model_name_test),
                        // ]);
                    }
                }
            }
            /*for multiimage end*/
            /*after save*/
            try{
                app("App\Http\Controllers\Adminiy\FCCallbackControllers\\".$table."Controller")->afterInsert($model_name_test);
            }catch(\Exception $ex){
                //dd($ex);
            }
            /*after save end*/
            echo json_encode(array('status'=>'1','data'=>$message));
        }
    }
}