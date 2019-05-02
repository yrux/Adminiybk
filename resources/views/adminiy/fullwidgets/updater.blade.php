<script type="text/javascript">
async function _adminiyFetchandUpdateFile(_file){
	return ajaxify('file='+_file,'POST','{{route('adminiy.updatePanel')}}').catch(e=>{
		console.log(e);
	});
}
async function _adminiyUpgradeCheck(){
	$(".page-loader").fadeIn();
	ajaxify('','GET','{{route('adminiy.checkGitV')}}').then(q=>{ 
		return q.version;
	}).then(version=>{
		ajaxify('','GET','{{asset('admin/core-files.json')}}').then(j=>{
			var _type = 'error';
			var _title = 'Version Difference Found';
			var _msg = 'Do you want update core adminiy files?';
			if(version==j.version){
				_type='success';
				_title = 'No Version Difference Found';
				_msg = 'Do you still want update core adminiy files?';
			}
			$(".page-loader").fadeOut()
			var updatedFiles;
			swal({
				title:_title,
				text:_msg, 
				icon:_type,
				buttons: [true,"Yes"],
				closeModal: false,
			}).then(j=>{
				if(j){
					$('.adminiy-upgradeProgress').show();
					return ajaxify('','GET','{{route('adminiy.updateCoreJson')}}');
				}
			}).then(updateCoreJson=>{
				if(updateCoreJson.status){
					return ajaxify('','GET','{{asset('admin/core-files.json')}}');
				}
			}).then(allFiles=>{
				if(allFiles.files){
					loolUpdatedFiles(allFiles.files);
				}
				//return ajaxify('','GET','{{route('adminiy.updatePanel')}}');
			});
	 	});
	});
}
async function loolUpdatedFiles(_files){
	var perFilePercent = 100/_files.length;
	updatedFiles = _files;
	for(let q=0;q<_files.length;q++){
		var _file = _files[q];
		$('.adminiy-upgrade-status').html('').html('Fetching : '+_file);
		$('.adminiy-upgrade-bar').attr('style','width:'+(q+1)*perFilePercent+'%');
		await _adminiyFetchandUpdateFile(_file);
	}
	ajaxify('','GET','{{asset('admin/core-files.json')}}').then(q=>{
		notify('0',"Panel updated to "+q.version)
	});
	/*_files.forEach(async function(_file,_index){
		$('.adminiy-upgrade-status').html('').html('Fetching : '+_file);
		$('.adminiy-upgrade-bar').attr('style','width:'+(_index+1)*perFilePercent+'%');
		console.log('before')
		await _adminiyFetchandUpdateFile(_file);
		console.log('after')
	})*/
}
</script>