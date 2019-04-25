<?php
namespace App\Http\Controllers\Adminiy;
use App\Http\Controllers\Controller;
use Auth;
use View;
use File;
use DB;
use Schema;
use Storage;
use App\Model\ytables;
use App\Model\imagetable;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Validator;
use Artisan;
use Helper;
class IndexController extends Controller
{
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function panel()
    {
        $recentSignups = Helper::fireQuery("SELECT left(name,1) as _fc,users.*,imagetable.img_path from users left join imagetable on imagetable.table_name='users' and imagetable.type='1' and imagetable.ref_id = users.id order by users.id desc ".Helper::getPaginator(20));
        return view('adminiy.panel')->with(compact('recentSignups'));
    }
    public function sendmail()
    {
        return view('adminiy.fullwidgets.sendmail')->with('title','Send Email');
    }
}
