<?php 
$theme = Helper::returnFlag(499);
?>
<script type="text/javascript">
function is_active(_node){
    var column = _node[0];
	var value = _node[2];
	var table = _node[3]._table;
	var _uniqueCol=_node[3]._uniqueCol;
	var _ref = _node[1][_uniqueCol];
	if(value){
		if(value=='1'){
			return '<div class="toggle-switch toggle-switch--{{$theme}}"><input type="checkbox" data-refcol="'+_uniqueCol+'" data-refid="'+_ref+'" data-table="'+table+'" data-column="'+column+'" class="toggle-switch__checkbox" data-toggle="tooltip" title="Yes" checked=""><i class="toggle-switch__helper"></i></div>';
		}
	}
	return '<div class="toggle-switch toggle-switch--{{$theme}}"><input type="checkbox" data-refcol="'+_uniqueCol+'" data-refid="'+_ref+'"  data-table="'+table+'" data-column="'+column+'" class="toggle-switch__checkbox"  data-toggle="tooltip" title="No" ><i class="toggle-switch__helper"></i></div>';
}
function setDropdownValue(_node){
	_val = '';
	_node[3].colnames.forEach(j=>{
		if(j.column==_node[0]){
			if(j.typeData[_node[2]]){
				_val=j.typeData[_node[2]];
			}
		}
	})
	return _val;
}
function setMultiselectValue(_node){
	try {
		_val = '';
		_node[3].colnames.forEach(j=>{
			if(j.column==_node[0]){
				_node[2].split(',').forEach(qq=>{
					if(j.typeData[qq]){
						_val+=j.typeData[qq]+', ';
					}
				});
			}
		})
		return _val;
	} catch(ex){
		console.log(ex);
	}
}
function returnisActive(){
	return {
	    1:'Active',
	    0:'Not Active',
	};
}
function buildImageCol(table_name){
	return '<input type="file" />'
}
var shakeTable = ()=>{
	//document.getElementsByClassName('ytable')[0].classList.value = 'table table-dark mb-0 ytable animated';
	setTimeout(()=>{
	//document.getElementsByClassName('ytable')[0].classList.value = 'table table-dark mb-0 ytable animated shake';
	},100);
}
function ytableCrudCB(res){
	if(res){
		if(res.status){
			$('#ytable-FastCRUD').modal('hide');
			notify('3',res.data);
			ytabled.resetyTableBuffer(ytabled.pageLimit,ytabled.page).then(q=>{
				shakeTable();
				return q;
			}).then(q=>{
				var evt = new CustomEvent('fastCrudSuccess', {detail:res});
    			window.dispatchEvent(evt);
			});
		} else {
			notify('0','Some error occured');
		}
	}
}
var ytableCrudCBFail = (res)=>{
	$('.is-invalid').next().next('.invalid-tooltip').html('');
	$('.is-invalid').removeClass('is-invalid');
	var evt = new CustomEvent('fastCrudFailed', {detail:res});
    window.dispatchEvent(evt);
	if(res){
		if(isJSON(res)){
			res = JSON.parse(res);
			if(res.errors){
				for(j in res.errors){
					$('[name="'+j+'"]').addClass('is-invalid');
					if($('[name="'+j+'"]').next('.invalid-tooltip').length>0){
						/*for select input errors*/
						$('[name="'+j+'"]').next('.invalid-tooltip').html('').html(res.errors[j].join('</br>'));
					} else {
						/*for normal input errors*/
						$('[name="'+j+'"]').next().next('.invalid-tooltip').html('').html(res.errors[j].join('</br>'));
					}
					//console.log(res.errors[j].join('</br>'));
					//console.log(j,res.errors[j]);
				}
			}
		}
	}
}
var getimage = async (imagesdata,tablename,type=1)=>{
	if(imagesdata){
		if(imagesdata.status){
			if(imagesdata.data[tablename]){
				if(type==1){
					return imagesdata.data[tablename][0]
				}else{
					return imagesdata.data[tablename];
				}
			}
		}
	}
	return false;
}
var currentFormMode = '';
async function fastCRUDForm(ytableObj,_selectedData=undefined,viewmode='create/edit'){
	currentFormMode=viewmode;
	if(currentFormMode=='view'){
		document.getElementById('ytable-fastCrudRectify').setAttribute('disabled','true');
		document.getElementById('ytable-fastCrudRectify').style.display='none';
		document.getElementById('ytable-FastCRUDFormSubmit').setAttribute('disabled','true');
	} else {
		document.getElementById('ytable-fastCrudRectify').removeAttribute('disabled');
		document.getElementById('ytable-fastCrudRectify').style.display='block';
		document.getElementById('ytable-FastCRUDFormSubmit').removeAttribute('disabled');
	}
	var formLength = ytableObj.colnames.length;
	var i=0;
	var formColumns = ytableObj.colnames;
	document.getElementById('ytable-FastCRUDFields').innerHTML='';
	var imagetablearray = {};
	for(var j=0;j<formLength;j++){
		var val = '';
		if(_selectedData){
			val = _selectedData[formColumns[j].column];
			if(formColumns[j].alias){
				val = _selectedData[formColumns[j].alias];
			}
		}
		if(formColumns[j].type=='image'){
			if(parseInt(val)>=0){
				imagetablearray[formColumns[j]._table]={type:1,value:val};
			}
		}
		else if(formColumns[j].type=='multiimage'){
			if(parseInt(val)>=0){
				imagetablearray[formColumns[j]._table]={type:2,value:val};
			}
		}
	}
	var imagesdata = await ajaxifyN({imagetablearray:imagetablearray},'POST','{{route('adminiy.multiimages.fetch')}}').then(function(e){
		return e;
	});
	for(i=0;i<formLength;i++){
		var val = '';
		if(_selectedData){
			val = _selectedData[formColumns[i].column];
			if(formColumns[i].alias){
				val = _selectedData[formColumns[i].alias];
			}
		}
		if(formColumns[i].type=='text'||formColumns[i].type=='hidden'||formColumns[i].type=='number'||formColumns[i].type=='email'||formColumns[i].type=='password'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createinput(formColumns[i],val);
		} else if(formColumns[i].type=='checkbox'){
			if(!val){
				val='0';
			}
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createCheckbox(formColumns[i],val);
		} 
		else if(formColumns[i].type=='color'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createcolor(formColumns[i],val);
		}
		else if(formColumns[i].type=='dropdown'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createDropDown(formColumns[i],val);
		}
		else if(formColumns[i].type=='select2'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createSelect2(formColumns[i],val);
		}
		else if(formColumns[i].type=='multiselect'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createMultiselect(formColumns[i],val);
		}
		else if(formColumns[i].type=='tag'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createTaginput(formColumns[i],val);
		}
		else if(formColumns[i].type=='textarea'||formColumns[i].type=='wyswig'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createTextArea(formColumns[i],val);
		}
		else if(formColumns[i].type=='image'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=await createImageArea(formColumns[i],val,imagesdata);
		}
		else if(formColumns[i].type=='video'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createVideoArea(formColumns[i],val);
		}
		else if(formColumns[i].type=='date'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createDate(formColumns[i],val);
		}
		else if(formColumns[i].type=='time'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createTime(formColumns[i],val);
		}
		else if(formColumns[i].type=='multiimage'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=await createMultiImage(formColumns[i],imagesdata);
		}
		else if(formColumns[i].type=='slug'){
			var _newControl =formColumns[i];
			_newControl.type='text';
			document.getElementById('ytable-FastCRUDFields').innerHTML+=createslug(_newControl,val);
			var _event_change = formColumns[i];
			_event_change.type='text';
			setTimeout(function(_event_change){
				document.querySelector('[name="'+_event_change.slugof+'"]').addEventListener('keyup',function(){
					generateSlug(_event_change.column,this);
				});
			},200,_event_change);
			formColumns[i].type='slug';
		}else if(formColumns[i].type=='callback'){
			document.getElementById('ytable-FastCRUDFields').innerHTML+=window[formColumns[i].typeData](formColumns[i],val);
		}
	}
	autosize(document.getElementsByClassName('textarea-autosize'));
	$('[data-toggle="tooltip"]').tooltip();
	turnOnImagedelete();
	initializeCkeditor();
	$(".form-group--float").each(function() {
        0 == !$(this).find(".form-control").val().length && $(this).find(".form-control").addClass("form-control--active")
    });
    $("#ytable-FastCRUDForm").on("blur", ".form-group--float .form-control", function() {
        0 == $(this).val().length ? $(this).removeClass("form-control--active") : $(this).addClass("form-control--active")
    });
    $("#ytable-FastCRUDForm").find(".form-control").change(function() {
        0 == !$(this).val().length && $(this).find(".form-control").addClass("form-control--active")
    });
    $(".date-picker").flatpickr({enableTime:!1,nextArrow:'<i class="zmdi zmdi-long-arrow-right" />',prevArrow:'<i class="zmdi zmdi-long-arrow-left" />',inline: true});
    $(".time-picker").flatpickr({
	    enableTime: true,
	    noCalendar: true,
	    dateFormat: "H:i",
	    inline: true,
	});
	$("select.select2").each(function(){
		var a = $(this).parent();
		$(this).select2({
			dropdownAutoWidth: !0,
			width: "100%",
			dropdownParent: a
		})
	})
	$("select.select2-tag").each(function(){
		var a = $(this).parent();
		$(this).select2({
			dropdownAutoWidth: !0,
			width: "100%",
			dropdownParent: a,
			tags:true,
		})
	})
	$(".color-picker").each(function() {
		var a = $(this).data("horizontal") || !1;
		$(this).colorpicker({
			horizontal: a
		})
	}); 
	$("body").on("change", ".color-picker", function() {
            $(this).next(".color-picker__preview").css("backgroundColor", $(this).val())
	});
	var evt = new CustomEvent('fastCrudFromRendered', {detail:_selectedData});
    window.dispatchEvent(evt);
}
var createinput = ({type,name,column,_default},value='')=>{
	if(type!='hidden'){
		if(value==''){
			if(_default){
				value=_default;
			}
		}
		return '<div class="form-group form-group--float">\
	        <input type="'+type+'" step="any" autocomplete="password" name="'+column+'" value="'+value+'" class="form-control">\
	        <label>'+name+'</label>\
	        <div class="invalid-tooltip"></div>\
	        <i class="form-group__bar"></i>\
	    </div>';
	}
	if(value==''){
		value=0;
		if(_default){
			value=_default;
		}
	}
	return '<input type="'+type+'" name="'+column+'" class="form-control" value="'+value+'" />';
}
var createcolor = ({type,name,column,_default},value='')=>{
	if(type!='hidden'){
		if(value==''){
			if(_default){
				value=_default;
			}
		}
		return '<div class="input-group">\
			<div class="input-group-prepend">\
				<span class="input-group-text"><i class="zmdi zmdi-palette"></i> '+name+'</span>\
			</div>\
			<input type="text" class="form-control color-picker"  autocomplete="password" name="'+column+'" value="'+value+'"">\
			<i class="color-picker__preview" style="background-color: #03A9F4"></i>\
			<div class="invalid-tooltip"></div>\
			<i class="form-group__bar"></i>\
		</div>';
	}
}
var createslug = ({type,name,column,slugof,_default},value='')=>{
	if(type!='hidden'){
		if(value==''){
			if(_default){
				value=_default;
			}
		}
		return '<div class="form-group form-group--float">\
	        <input  type="'+type+'" autocomplete="password" name="'+column+'" value="'+value+'" class="form-control">\
	        <label>'+name+'</label>\
	        <div class="invalid-tooltip"></div>\
	        <i class="form-group__bar"></i>\
	    </div>';
	}
}
var createDate = ({type,name,column,_default},value='')=>{
	if(type!='hidden'){
		if(value==''){
			if(_default){
				value=_default;
			}
		}
		return '<div class="form-group"><div class="w-50">\
	        <label>'+name+'</label>\
	        <input style="display:none;" type="'+type+'" autocomplete="password" name="'+column+'" value="'+value+'" class="form-control date-picker">\
	        <div class="invalid-tooltip"></div>\
	        <i class="form-group__bar"></i>\
	    </div></div>';
	}
}
var createTime = ({type,name,column,_default},value='')=>{
	if(type!='hidden'){
		if(value==''){
			if(_default){
				value=_default;
			}
		}
		return '<div class="form-group"><div class="w-50">\
	        <label>'+name+'</label>\
	        <input type="'+type+'" style="display:none;" autocomplete="password" name="'+column+'" value="'+value+'" class="form-control time-picker">\
	        <div class="invalid-tooltip"></div>\
	        <i class="form-group__bar"></i>\
	    </div></div>';
	}
}
var createCheckbox = ({name,column,_default},value='0')=>{
	if(value=='0'){
		if(_default){
			value=_default;
		}
	}
	var _checkedOrNot = value=='0'?'':'checked="true"';
	return '<div class="form-group">\
        <div class="checkbox">\
            <input type="checkbox" name="'+column+'" '+_checkedOrNot+' id="'+column+'" />\
            <label class="checkbox__label" for="'+column+'">\
                '+name+'\
            </label>\
        </div>\
    </div>';
}
var createDropDown = ({name,column,typeData},value='')=>{
	var _keys = Object.keys(typeData);
	var _opt='';
	if(value==''){
		_opt = '<option value="" selected="">Please Select '+name+'</option>';
	} else {
		_opt = '<option value="" >Please Select '+name+'</option>';
	}
	_keys.sort().forEach(q=>{
		var _selectedOrNot = q==value?' selected=""':'';
		_opt+='<option '+_selectedOrNot+' value="'+q+'">'+typeData[q]+'</option>';
	});
	return '<div class="form-group">\
	<div class="select">\
	<!--<label>'+name+'</label>-->\
	<select class="form-control" name="'+column+'">\
		'+_opt+'\
	</select>\
	<div class="invalid-tooltip"></div>\
	<i class="form-group__bar"></i>\
	</div>\
	</div>';
}
var createSelect2 = ({name,column,typeData},value='')=>{
	var _opt='';
	if(value==''){
		_opt = '<option value="" selected="">Please Select</option>';
	} else {
		_opt = '<option value="" >Please Select</option>';
	}
	for(y in typeData){
		var _selectedOrNot = y==value?' selected=""':'';
		_opt+='<option '+_selectedOrNot+' value="'+y+'">'+typeData[y]+'</option>';
	}
	return '<div class="form-group">\
	<div class="select select2-parent">\
	<label>'+name+'</label>\
	<select class="form-control select2" name="'+column+'">\
		'+_opt+'\
	</select>\
	<div class="invalid-tooltip"></div>\
	<i class="form-group__bar"></i>\
	</div>\
	</div>';
}
var createMultiselect = ({name,column,typeData},value='')=>{
	var _opt='';
	if(value==''){
		//_opt = '<option value="" selected="">Please Select</option>';
	} else {
		//_opt = '<option value="" >Please Select</option>';
	}
	for(y in typeData){
		if(value){
			var _selectedOrNot='';
			value.split(',').forEach(e=>{
				if(y==e){
					_selectedOrNot = y==e?' selected=""':'';
				}
			});
			_opt+='<option '+_selectedOrNot+' value="'+y+'">'+typeData[y]+'</option>';
		} else {
			var _selectedOrNot = y==value?' selected=""':'';
			_opt+='<option '+_selectedOrNot+' value="'+y+'">'+typeData[y]+'</option>';
		}
	}
	return '<div class="form-group">\
	<div class="select select2-parent">\
	<label>'+name+'</label>\
	<select class="form-control select2" name="'+column+'[]" multiple>\
		'+_opt+'\
	</select>\
	<div class="invalid-tooltip"></div>\
	<i class="form-group__bar"></i>\
	</div>\
	</div>';
}
var createTaginput = ({name,column},value='')=>{
	var _opt='';
	if(value){
		var _broke = value.split(',');
		for(var jj=0;jj<_broke.length;jj++){
			_selectedOrNot = ' selected=""';
			_opt+='<option '+_selectedOrNot+' value="'+_broke[jj]+'">'+_broke[jj]+'</option>';
		}
	}
	return '<div class="form-group">\
	<div class="select select2-parent">\
	<label>'+name+'</label>\
	<select class="form-control select2-tag" name="'+column+'[]" multiple>\
		'+_opt+'\
	</select>\
	<div class="invalid-tooltip"></div>\
	<i class="form-group__bar"></i>\
	</div>\
	</div>';
}
var createTextArea = ({name,column,type,_default},value='')=>{
	var _dynamicClass = '';
	if(value==''){
		if(_default){
			value=_default;
		}
	}
	if(type=='wyswig'){
		_dynamicClass='fastCRUD_wyswig';
	}
	return '<div class="form-group">\
		<textarea name="'+column+'" id="fastCRUD_'+column+'" autocomplete="password" class="form-control textarea-autosize '+_dynamicClass+'" placeholder="'+name+'">'+value+'</textarea>\
		<div class="invalid-tooltip"></div>\
		<i class="form-group__bar"></i>\
	</div>';
}
var createMultiImage = async ({name,column,_table},imagesdata)=>{
	/*value variable is of no use now as we have added promises and feteched all images at once*/
	var image = await getimage(imagesdata,_table,2);
	var imagerender = '';
	if(image){
		image.forEach(function(e){
			imagerender+=`<div class="col-md-2 d-inline-block no-padding-left dynaremove"><a data-toggle="tooltip" title="Remove Image" class="remove-fastcrud-image"></a><img src="${img_url(e.img_path)}" FC-src="${e.img_path}" class="img-responsive" /></div>`
		})
	}
	var _src='';
	var _hasImage=false;
	column = _table+'_multiimage';
	if(image){
		
	}
	if(currentFormMode=='view'){
		_hasImage=false;
	}
	return '<div class="form-group"><label for="'+column+'">\
        '+name+'\
    </label><div class="col-md-6 no-padding-left">\
	<input onchange="showPreviewmultiple(this)" id="'+column+'" name="'+column+'[]" multiple type="file" />\
	</div></div><div class="form-group"><div class="col-md-12 no-padding-left" id="'+column+'_multipreview">'+imagerender+'</div></div>';
}
var createImageArea = async ({name,column,_table},value,imagesdata)=>{
	/*value variable is of no use now as we have added promises and feteched all images at once*/
	var image = await getimage(imagesdata,_table,1);
	var _src='';
	var _hasImage=false;
	column = _table+'_image';
	if(image){
		if(image.img_path){
			_hasImage=true;
			value=image.img_path;
			_src = img_url(image.img_path);
		}
	}else{
		value=null;
		_src='http://www.placehold.it/200x150/EFEFEF/AAAAAA?text=no+image';
	}
	if(currentFormMode=='view'){
		_hasImage=false;
	}
	return '<div class="form-group"><label for="'+column+'">\
        '+name+'\
    </label><div class="col-md-4 no-padding-left">\
	'+(_hasImage?'<a data-toggle="tooltip" title="Remove Image" class="remove-fastcrud-image"></a>':'')+'\
	<img class="img-responsive" id="'+column+'_preview" FC-src="'+value+'" src="'+_src+'" />\
	</div></div><div class="form-group"><div class="col-md-6 no-padding-left">\
	<input onchange="showPreview(this)" id="'+column+'" name="'+column+'" type="file" />\
	</div></div>';
}
var createVideoArea = ({name,column,typeData},value)=>{
	var _src='';
	var _hasImage=false;
	var _videoLink ='';
	if(value!=''){
		_hasImage=true;
		_src = img_url(value);
		_videoLink='<a href="'+_src+'" target="_blank" data-toggle="tooltip" title="Preview/Download File" class="btn btn-dark btn--icon-text"><i class="zmdi zmdi-eye"></i> File</a>'
	}
	return '<div class="form-group"><label for="'+column+'">\
        '+name+'\
    </label><div class="col-md-4 no-padding-left">\
	'+_videoLink+'\
	<input id="'+column+'" name="'+column+'" type="file" />\
	</div></div>';
}
var bindyTableDelete = ()=>{
    var deletedNodes = document.querySelectorAll('[data-deleteytable]');
      for(let del=0;del<deletedNodes.length;del++){
        var _idd = deletedNodes[del].getAttribute('id')
        document.getElementById(_idd).addEventListener('click',function(){
          var id = this.getAttribute('data-record')
          var table = this.getAttribute('data-table');
          var _col = this.getAttribute('data-col');
          var _mainNode = this;
          swal({
              title: "Are you sure?",
              text: "Once deleted, you will not be able to recover this record",
              icon: "warning",
              button: {
                text: "Delete Record",
                closeModal: false,
              },
              dangerMode: true,
            }).then((delRecord)=>{
                if(delRecord){
                	_mainNode.parentElement.parentElement.classList='animated fadeOutRight';
                    return ajaxify('col='+_col,'POST',base_url('adminiy/delete/ylisting/'+table+'/'+id));
                }
            })
            .then((willDelete) => {
              if (willDelete) {
                if(willDelete.status){
                    swal("Poof! Your record has been deleted!", {
                      icon: "success",
                      timer:1000,
                    });
                    ytabled.resetyTableBuffer(ytabled.pageLimit).then(q=>{
                        shakeTable();
                    });
                }
              }
            });
        },true)
      }
}
var bindyTableFastEdit = ()=>{
	var feditNodes = document.querySelectorAll('[data-fasteditytable]');
	for(let editN=0;editN<feditNodes.length;editN++){
		var _idd = feditNodes[editN].getAttribute('id');
		document.getElementById(_idd).addEventListener('click',function(){
			var id = this.getAttribute('data-record')
          	var table = this.getAttribute('data-table');
          	ytabled.currentData.forEach(d=>{
				if(d[ytabled.uniqueCol]==id){
					$('#ytable-FastCRUD').modal('toggle');
					document.getElementById('unique_column').value=ytabled.uniqueCol;
        			document.getElementById('ytable_table').value='{{$listingData->table_name}}';
          			fastCRUDForm(ytabled,d);
				}
			})
		});
	}
}
var bindyTableFastView = ()=>{
	var feditNodes = document.querySelectorAll('[data-fastviewytable]');
	for(let editN=0;editN<feditNodes.length;editN++){
		var _idd = feditNodes[editN].getAttribute('id');
		document.getElementById(_idd).addEventListener('click',function(){
			var id = this.getAttribute('data-record')
          	var table = this.getAttribute('data-table');
          	ytabled.currentData.forEach(d=>{
				if(d[ytabled.uniqueCol]==id){
					$('#ytable-FastCRUD').modal('toggle');
					document.getElementById('unique_column').value=ytabled.uniqueCol;
        			document.getElementById('ytable_table').value='{{$listingData->table_name}}';
          			fastCRUDForm(ytabled,d,'view');
				}
			})
		});
	}
}
var turnOnImagedelete = ()=>{
	var _imgNodes = document.getElementsByClassName('remove-fastcrud-image');
	for(let delImg = 0;delImg<_imgNodes.length;delImg++){
		_imgNodes[delImg].addEventListener('click',function(){
			var _elem = this;
			var _src = _elem.nextElementSibling.getAttribute('FC-src');
			swal({
              title: "Are you sure?",
              text: "Once deleted, you will not be able to recover this Image",
              icon: "warning",
              button: {
                text: "Delete Image",
                closeModal: false,
              },
              dangerMode: true,
            }).then((delRecord)=>{
                if(delRecord){
                    return ajaxify('src='+_src,'POST',base_url('adminiy/delete/ylisting/image'));
                }
            }).then(deleted=>{
            	if(deleted.status){
            		swal.close();
            		@if($listingData->table_name=='imagetable')
            		location.reload();
            		@else
					$('#ytable-FastCRUD').modal('hide');
					notify(1,'Image Deleted');
            		@endif
            		
            	}
            })
		});
	}
}
function turnOnDblClickCopyyTable(){
	//document.querySelectorAll('[data-ytablerowid]')[0].addEventListener
	document.querySelectorAll('[data-ytablerowid]').forEach(q=>{
		var _childs = q.children;
		var _i=0;
		var _childLength = _childs.length;
		for(_i;_i<_childLength;_i++){
			_childs[_i].addEventListener('dblclick',function(e){
				CopyText(this.innerHTML);
			})
		}
	});
	setting_checkbox_grid();
}
function turnOnMultiImage(){
	var table_to_get = [];
	var ids_to_get = [];
	ytabled.colnames.forEach(function(e){
		if(e.type=='multiimage'){
			if(e.attributes){
				table_to_get.push(e.attributes.table_name);
	        } else {
				table_to_get.push(ytabled.table);
			}
		}
	});
	var ids_visible_indexes = document.querySelectorAll('[data-ytablerowid]');
	for(var i=0;i<ids_visible_indexes.length;i++){
		ids_to_get.push(ids_visible_indexes[i].getAttribute('data-ytablerowid'));
	}
	if(ids_to_get.length>0){
		ajaxifyN({tables:table_to_get,ids:ids_to_get},'POST','{{route('adminiy.multiimages.fetch')}}');
	}
	//console.log(table_to_get,ids_to_get);
}
function setting_checkbox_grid(){
    $('.toggle-switch__checkbox').click(function(){
        var param = {
            table : $(this).data('table'),
            column:$(this).data('column'),
            refcol:$(this).data('refcol'),
            uid:$(this).data('refid'),
        }
	    if($(this).prop('checked')){
	        /*on true*/
	        param.val=$(this).prop('checked');
	    } else {
	        param.val=$(this).prop('checked');
	        /*on false*/
	    }
	    ajaxifyN(param,'POST',base_url('adminiy/update-checkbox')).then(function(e){
	        //ytabled.resetyTable();
	    });
    })
}
var generateSlug = (inputname,obj)=>{
	let _val = $(obj).val();
    _val = _val.replace(/([^a-zA-Z0-9\-_\s]+)/gi, "");
    _val = _val.replace(/\s+/g, '-');
    $('input[name="'+inputname+'"]').val(_val.toLowerCase());
}
var initializeCkeditor = ()=>{
	CKEDITOR.config.removePlugins='easyimage';
	var _wyswigs = document.getElementsByClassName('fastCRUD_wyswig');
	var roxyFileman = '{{asset('admin/vendors/ckeditor/fileman/index.html')}}';
	for(var i =0;i<_wyswigs.length;i++){
		var _wyswigid = _wyswigs[i].getAttribute('id');
		CKEDITOR.replace(_wyswigid,
			{
				filebrowserBrowseUrl:roxyFileman,
				filebrowserImageBrowseUrl:roxyFileman+'?type=image',
				removeDialogTabs: 'link:upload;image:upload'
			}
		); 
	}
}
async function getFlagDropdown(flag,obj){
	return ajaxifyN('flag_type='+flag,'POST',base_url('adminiy/getFlag')).then(q=>{
		return q;
	})
}
async function getAjaxTable(table,key,value,_where=''){
	return ajaxifyN({table:table,key:key,value:value,where:_where},'POST',base_url('adminiy/getDropdown')).then(q=>{
		return q;
	})
}
async function getOwnDropdown(_uri,method,_param){
	return ajaxifyN(_param,method,base_url(_uri)).then(q=>{
		return q;
	})
}
</script>