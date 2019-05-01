<?php
Route::get('/', 'IndexController@index')->name('home');
Route::get('/contact-us', 'IndexController@contactus')->name('contactus');
Route::post('/contact-us-submit', 'IndexController@contactusSubmit')->name('contactusSubmit');

Auth::routes();
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
	/*create listing start*/
	Route::get('/listing/{jsfile}', 'DNE\ListingController@ylisting')->name('adminiy.ylisting');
	/*create listing end*/
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
	Route::post('/delete/ylisting/{table}/{id?}', 'DNE\CoreDeletesController@ylistingDelete')->name('adminiy.delete.ylisting');
	Route::post('/delete/ylisting/image', 'DNE\CoreDeletesController@imageDelete')->name('adminiy.imageDelete');
	/*DELETING CORE END*/
	/*FRONT END EDITOR*/
	Route::post('/statusAjaxUpdateCustom', 'DNE\FrontEndEditorController@statusAjaxUpdateCustom');
	Route::post('/statusAjaxUpdate', 'DNE\FrontEndEditorController@statusAjaxUpdate');
	Route::post('/updateFlagOnKey', 'DNE\FrontEndEditorController@updateFlagOnKey');
	/*FRONT END EDITOR End*/
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
	Route::get('update-panel','DNE\PanelUpdateController@updatePanel')->name('adminiy.updatePanel');
	Route::get('update-core-Json','DNE\PanelUpdateController@updateCoreJson')->name('adminiy.updateCoreJson');
	Route::get('check-git-version','DNE\PanelUpdateController@checkGitV')->name('adminiy.checkGitV');
	/*Adminiy Panel Updater End*/
});

Route::group(['middleware' => ['customer'],'prefix'=>'customer','namespace'=>'Customer'], function () {
	Route::get('/',function(){
		return redirect('/customer/panel');
	});
	Route::get('/panel', 'IndexController@index')->name('customer.panel');
	Route::get('/logout', 'IndexController@logout')->name('customer.logout');
});