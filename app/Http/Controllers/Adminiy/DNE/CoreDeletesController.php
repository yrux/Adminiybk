<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use App\Model\imagetable;
use Illuminate\Http\Request;
use Storage;
use DB;

class CoreDeletesController extends IndexController
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function ylistingDelete($table,$id){
        $col = isset($_POST['col'])?$_POST['col']:'id';
        /*before delete*/
        try{
            app("App\Http\Controllers\Adminiy\FCCallbackControllers\\".$table."Controller")->beforeDelete($table,$id,$col);
        }catch(\Exception $ex){
            //dd($ex);
        }
        /*before delete end*/
        DB::DELETE("DELETE from {$table} where {$col} = {$id}");
        /*after delete*/
        try{
            app("App\Http\Controllers\Adminiy\FCCallbackControllers\\".$table."Controller")->afterDelete($table,$id,$col);
        }catch(\Exception $ex){
            //dd($ex);
        }
        /*after delete end*/
        $table_name_length = strlen($table);
        $images = imagetable::where('ref_id',$id)->whereRaw("LEFT(table_name,{$table_name_length})='".$table."'")->get();
        if($images){
            foreach($images as $image){
                Storage::disk('public')->deleteDirectory(dirname($image->img_path));
            }
            imagetable::where('ref_id',$id)->whereRaw("LEFT(table_name,{$table_name_length})='".$table."'")->delete();
        }
        echo json_encode(array('status'=>'1','data'=>'Row Deleted'));
    }
    public function imageDelete(Request $request){
        if($request->has('src')){
            $imagetable = imagetable::where('img_path',$request->src)->first();
            if($imagetable){
                if($imagetable->delete()){
                    Storage::disk('public')->deleteDirectory(dirname($request->src));
                    echo json_encode(array('status'=>'1','data'=>'Image Deleted'));
                    return;
                }
            }
        }
        echo json_encode(array('status'=>'0','data'=>'Unable to delete Image'));
    }
    public function deleteResizedImage($id){
        return Storage::disk('public')->deleteDirectory('Uploads/resized/'.$id);
    }
}
