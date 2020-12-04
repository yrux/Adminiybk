<?php
namespace App\Http\Controllers;
use Helper;
use View;
use Illuminate\Support\Str;
use App\Http\Requests\yTableinquiryRequest;
use App\Http\Requests\yTablecareerRequest;
use App\Model\inquiry;
use App\Model\m_flag;

class IndexController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest');
        $favicon=Helper::OneColData('imagetable','img_path',"table_name='favicon' and ref_id=0 and is_active_img='1'");
        View()->share('favicon',$favicon);
        View()->share('config',$this->getConfig());
    }
    public function index()
    {
        // $m_flag = m_flag::find(1965);
        // dd($m_flag->m_flag_main,$m_flag->m_flag_thumb);
        // $banners = Helper::fireQuery("select banner_management.*
        //     ,img_1.img_path as img_1_img
        //     ,img_2.img_path as img_2_img from banner_management 
        //     left join imagetable as img_1 on img_1.ref_id = banner_management.id and img_1.type=1 and img_1.table_name='banner_management'
        //     left join imagetable as img_2 on img_2.ref_id = banner_management.id and img_2.type=1 and img_2.table_name='banner_management_thumb'
        //     where banner_management.is_active=1 and banner_management.is_deleted=0");
        // $deals = Helper::getImageWithData('products','id','',"is_active=1 and is_deleted=0 and product_type='deals'",0,'order by id asc');
        return view('welcome')->with('title',Helper::returnFlag(123))
        ->with('homeMenu',true);
        //->with(compact('banners','deals'))
    }
    public function contactus()
    {
        return view('contactus')->with('title','Contact us')->with('contactmenu',true);
    }
    public function contactusSubmit(yTableinquiryRequest $request){
        $validator = $request->validated();
        $inquiry = new inquiry;
        $inquiry->inquiries_name = $request->inquiries_name;
        $inquiry->inquiries_lname = $request->inquiries_lname;
        $inquiry->inquiries_email = $request->inquiries_email;
        $inquiry->inquiries_phone = $request->inquiries_phone;
        $inquiry->extra_content = $request->extra_content;
        $inquiry->save();
        $this->echoSuccess("Inquiry Saved");
    }
}
