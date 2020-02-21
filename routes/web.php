<?php
Route::get('/', 'IndexController@index')->name('home');
Route::get('/contact-us', 'IndexController@contactus')->name('contactus');
Route::post('/contact-us-submit', 'IndexController@contactusSubmit')->name('contactusSubmit');

Auth::routes();
Route::get('/backoffice', function(){
	return redirect('adminiy');
})->name('adminiy.backoffice');
Route::get('/adminoffice', function(){
	return redirect('adminiy');
})->name('adminiy.adminoffice');
Route::get('/admin', function(){
	return redirect('adminiy');
})->name('adminiy.admin');
Route::group(['middleware' => ['guest'],'prefix'=>'adminiy','namespace'=>'Adminiy'], function () {
	Route::get('/login', 'LoginController@index')->name('adminiy.login');
	Route::post('/performLogin', 'LoginController@performLogin')->name('adminiy.performLogin')->middleware('throttle:4,1');
});
Route::group(['middleware' => ['adminiy'],'prefix'=>'adminiy','namespace'=>'Adminiy'], function () {

	/*DO NOT EDIT*/
	Route::get('/',function(){
		return redirect('/adminiy/panel');
	});
	Route::get('/panel', 'IndexController@panel')->name('adminiy.panel');
	/*change password admin*/
	Route::post('/change-password',function(){
		if($_POST['change_password']==$_POST['change_confirm_password']){
			$adminiy=App\Model\Adminiy::find(adminiy()->id);
			$adminiy->password = Hash::make($_POST['change_password']);
			$adminiy->save();
			return back()->with('notify_success','Password Updated');
		}
		return back()->with('notify_error','Password does not match');
	})->name('adminiy.changepassword');
	/*change password admin end*/
	/*create listing start*/
	Route::get('/listing/{jsfile}', 'DNE\ListingController@ylisting')->name('adminiy.ylisting');
	/*create listing end*/
	/*Fetching Multiple Images on screen*/
	Route::post('/multiimages-get', 'DNE\MultiImageCrudController@get')->name('adminiy.multiimages.fetch');
	Route::get('/multiimages-get-one/{table}/{id}', 'DNE\MultiImageCrudController@getone')->name('adminiy.multiimages.fetchone');
	/*Fetching Multiple Images on screen end*/
	/*fetching list data start*/
	Route::post('/ytable', 'DNE\ListingController@ytable')->name('ytable');
	/*fetching list data end*/
	Route::get('/send-mail', 'IndexController@sendmail')->name('adminiy.sendmail');
	/*Fast Crud*/
	Route::post('/fastCRUD', 'DNE\fastCRUDController@index')->name('adminiy.fastCRUD');
	/*Fast Crud End*/
	/*CONFIG CORE*/
	Route::get('/config', 'DNE\ConfigController@config')->name('adminiy.config');
	Route::post('/config', 'DNE\ConfigController@configSave')->name('adminiy.configSave');
	/*CONFIG CORE END*/
	/*DELETING CORE*/
	Route::post('/delete/ylisting/image', 'DNE\CoreDeletesController@imageDelete')->name('adminiy.imageDelete');
	Route::post('/delete/ylisting/{table}/{id?}', 'DNE\CoreDeletesController@ylistingDelete')->name('adminiy.delete.ylisting');
	/*DELETING CORE END*/
	/*FRONT END EDITOR*/
	Route::post('/statusAjaxUpdateCustom', 'DNE\FrontEndEditorController@statusAjaxUpdateCustom');
	Route::post('/statusAjaxUpdate', 'DNE\FrontEndEditorController@statusAjaxUpdate');
	Route::post('/updateFlagOnKey', 'DNE\FrontEndEditorController@updateFlagOnKey');
	/*FRONT END EDITOR End*/
	/*FRONT END IMAGE Upload*/
	Route::post('/imageUpload', 'DNE\FrontEndEditorController@imageUpload');
	/*FRONT END IMAGE Upload END*/
	/*ytable checkbox toggle*/
	Route::post('/update-checkbox', 'DNE\ytableCheckboxController@update')->name('adminiy.ytable.checkbox');
	/*ytable checkbox toggle end*/
	/*Get Any Flag against type*/
	Route::post('/getFlag', function(){
		$data = \collect(App\Model\m_flag::select('id','flag_value')->where('flag_type',$_POST['flag_type'])->where('is_active',1)->where('is_deleted',0)->get());
		$keyed = $data->mapWithKeys(function ($item) {
    		return [$item['id'] => $item['flag_value']];
		});
		return $keyed;
	});
	Route::post('/getDropdown', function(){
		$table = $_POST['table'];
		$key = $_POST['key'];
		$value = $_POST['value'];
		$where = $_POST['where'];
		$model_name = 'App\Model\\'.$table;
		$fetching = $model_name::select($key,$value)->where('is_active',1)->where('is_deleted',0);
		if(!empty($where)){
			$fetching = $fetching->whereRaw($where);
		}
		$data = \collect($fetching->get());
		$array = array();
		foreach($data as $dd){
			$array[$dd->$key] = $dd->$value;
		}
		return $array;
	});
	/*Get Any Flag against type end*/
	Route::get('/search', 'DNE\SearchController@index')->name('adminiy.mainsearch');
	Route::get('/logout', 'LoginController@logout')->name('adminiy.logout');
	/*Adminiy Panel Updater*/
	Route::post('update-panel','DNE\PanelUpdateController@updatePanel')->name('adminiy.updatePanel');
	Route::get('update-core-Json','DNE\PanelUpdateController@updateCoreJson')->name('adminiy.updateCoreJson');
	Route::get('check-git-version','DNE\PanelUpdateController@checkGitV')->name('adminiy.checkGitV');
	/*Adminiy Panel Updater End*/
	/*Artisan Console*/
	Route::get('artisan-console','DNE\CommandExecutionController@index')->name('adminiy.artisan.index');
	Route::post('artisan-execute','DNE\CommandExecutionController@execute')->name('adminiy.artisan.execute');
	/*Artisan Console End*/
	/*Database Administrator*/
	Route::get('database','DNE\DBController@index')->name('adminiy.db.index');
	Route::post('database-firequery','DNE\DBController@firequery')->name('adminiy.db.firequery');
	/*Database Administrator*/
});

Route::group(['middleware' => ['customer'],'prefix'=>'customer','namespace'=>'Customer'], function () {
	Route::get('/',function(){
		return redirect('/customer/panel');
	});
	/*change password customer*/
	Route::post('/change-password',function(){
		if(!empty($_POST['change_password'])&&!empty($_POST['change_confirm_password'])){
			if($_POST['change_password']==$_POST['change_confirm_password']){
				$adminiy=App\Model\User::find(Auth::user()->id);
				$adminiy->password = Hash::make($_POST['change_password']);
				$adminiy->save();
				return back()->with('notify_success','Password Updated');
			}
			return back()->with('notify_error','Password does not match');
		}
		return back()->with('notify_error','Password and confirm password can not be empty');
	})->name('customer.changepassword');
	/*change password customer end*/
	Route::get('/panel', 'IndexController@index')->name('customer.panel');
	Route::get('/logout', 'IndexController@logout')->name('customer.logout');
});