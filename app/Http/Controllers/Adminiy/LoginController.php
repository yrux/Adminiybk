<?php

namespace App\Http\Controllers\Adminiy;

use App\Http\Controllers\Controller;
use App\Http\Requests\AdminiyLoginRequest;
use Auth;
use App\Model\Adminiy;
use Hash;
use App\Rules\PasswordMatch;
use Illuminate\Support\MessageBag;

class LoginController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest');
        View()->share('v',config('app.vadminiy'));
    }
    public function index()
    {
        if(Auth::guard('adminiy')->check()){
            return redirect()->route('adminiy.panel')->with('notify_message','You are already logged in as Admin');
        }
        return view('adminiy.login.form')->with('title','Login Adminiy');
    }
    public function performLogin(AdminiyLoginRequest $request, MessageBag $message_bag){
        if(Auth::guard('adminiy')->check()){
            return redirect()->route('adminiy.panel')->with('notify_message','You are already logged in as Admin');
        }
        $validator = $request->validated();
        $user = Adminiy::where('email',$request->email)->first();
        if (!Hash::check($request->password, $user->password)) {
            $message_bag->add('password', 'Invalid Password');
            return redirect()->route('adminiy.login')->withInput($request->input())->withErrors($message_bag);
        }
        $remember=0;
        if(isset($request->remember)){
            $remember=1;
        }
        if(Auth::guard('adminiy')->attempt(['email'=> $request->email, 'password'=> $request->password], $remember)){
            return redirect()->route('adminiy.panel')->with('notify_message','Welcome to Adminiy '.config('app.vadminiy'));
        } else {
            return redirect()->route('adminiy.login')->withInput($request->input());
        }
    }
    public function logout(){
        Auth::guard('adminiy')->logout();
        return redirect()->route('adminiy.login');
    }
}
