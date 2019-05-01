<?php
namespace App\Http\Controllers\Customer;
use App\Http\Controllers\Controller;
use Helper;
use View;
use Auth;
class IndexController extends Controller
{
    public function __construct()
    {
        $this->middleware('customer');
        $favicon=Helper::OneColData('imagetable','img_path',"table_name='favicon' and ref_id=0 and is_active_img='1'");
        View()->share('favicon',$favicon);
        View()->share('config',$this->getConfig());
    }
    public function index(){
        $user = Auth::user();
        return view('customer.panel')->with('title',$user->name.' Dashboard')->with(compact('user'));
    }
    public function logout(){
        Auth::logout();
        return redirect()->route('home')->with('notify_success','Logged out successfully');
    }
}
