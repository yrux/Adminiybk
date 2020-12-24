function _uri(base_url){
  return (appender='')=>{
  if(appender==''){
    return base_url;
    }
    return base_url+'/'+appender;
  }
}
var _webbase = document.getElementById('web_base_url')?document.getElementById('web_base_url'):document.getElementById('base_url');
var base_url = _uri(_webbase.value);
var img_url = _uri(base_url(''));
var dimg_url = _uri(base_url('images'));
var yruxifyA  = new XMLHttpRequest();
/*
Usage
  console.log(base_url(),
  img_url(),
  dimg_url());
*/
function ajaxify(d,m,u){
  if(typeof d !='string'){
    d = $.param(d);
  }
  return new Promise(function(resolve, reject) {
    //yruxifyA = new XMLHttpRequest();
    yruxifyA.onreadystatechange = function() {
      if (this.status == 200&&this.readyState==4){
        if(!isJSON(yruxifyA.responseText)){
          throw 'Result is not in JSON format';
        } else {
          resolve(JSON.parse(yruxifyA.responseText));
        }
      } else if(this.status==404){
        reject(Error('Error occured'));
      }
    };
    yruxifyA.onload = function () {
        
    };
    yruxifyA.open(m, u, true);
    yruxifyA.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
    yruxifyA.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    try {
      yruxifyA.send(d)
    }catch(ex){
      reject(Error('Error occured'));
    }
  });
}
function ajaxifyN(d,m,u){
  if(typeof d !='string'){
    d = $.param(d);
  }
  return new Promise(function(resolve, reject) {
    var xhhtp = new XMLHttpRequest();
    xhhtp.onreadystatechange = function() {
      if (this.status == 200&&this.readyState==4){
        if(!isJSON(xhhtp.responseText)){
          throw 'Result is not in JSON format';
        } else {
          resolve(JSON.parse(xhhtp.responseText));
        }
      } else if(this.status==404){
        reject(Error('Error occured'));
      }
    };
    xhhtp.onload = function () {
        
    };
    xhhtp.open(m, u, true);
    xhhtp.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
    xhhtp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    try {
      xhhtp.send(d)
    }catch(ex){
      reject(Error('Error occured'));
    }
  });
}
function isJSON(json) {
  try {
    var obj = JSON.parse(json)
    if (obj && typeof obj === 'object' && obj !== null) {
      return true
    }
  } catch (err) {}
  return false
}
function recallajax(){
    $(document).on('submit', '#CrudForm,.CrudForm', function() {
      var _thisForm = $(this);
      if(!$(this).data('nosubmit')){
        var submitBtn = $("input[type=submit]",$(this));
        submitBtn.hide();
        var parentDiv = submitBtn.parent();
        if(!$('#loaderBtn').length>0){
          parentDiv.append('<button id="loaderBtn" class="btn btn-success pull-right"><i class="fa fa-circle-o-notch fa-spin"></i></button>');
        }
      }
      var validationAllowed = true;
      var seconds = new Date().getTime() / 1000;
      var formData = new FormData($(this)[0]);
      if (typeof validateCrudForm == 'function') {
        validationAllowed = validateCrudForm();
        }else{}
      if(!validationAllowed){
        notify('0','Validation Error');
        return false;
      }
      //if (typeof beforeSubmit == 'function') {beforeSubmit();}else{}
      $.ajax({
      type    : $(this).attr('method'),
      data    : formData,
      async: true,
      contentType: false,
      processData: false,
      url     : $(this).attr('action'),
      beforeSend: function (request) {
      if (typeof beforeSubmit == 'function') {beforeSubmit();}else{}
      return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
      },
      success: function (result) {
        if(!_thisForm.data('nosubmit')){
          submitBtn.show();
        }
        $('#loaderBtn').remove();
        if(!_thisForm.attr('data-noinfo')){
          notify('2',result);
        //$('#CrudForm')[0].reset();
          $("html, body").animate({ scrollTop: 0 }, "slow");
         }
         seconds = new Date().getTime() / 1000;
         if (_thisForm.attr('data-customcallback')){
           var _func = _thisForm.attr('data-customcallback');
          if ( eval("typeof "+_func+" === 'function'") ){
            eval(_func + '(' + result + ')');
          }
         } else {
          if (typeof afterSubmit == 'function') {afterSubmit();}else{}
          if (typeof afterSubmitResult == 'function') {afterSubmitResult(result);}else{}
         }
      },
      error:function (error) {
        if(!_thisForm.attr('data-noinfo')){
          notify('0','Some Error Occured');
        }
        if(!_thisForm.data('nosubmit')){
          submitBtn.show();
        }
        if (_thisForm.attr('data-customcallbackFail')){
           var _func = _thisForm.attr('data-customcallbackFail');
          if ( eval("typeof "+_func+" === 'function'") ){
            window[_func](error.responseText)
            //eval(_func + '(' + error + ')');
          }
         } else {
          if (typeof afterSubmitFail == 'function') {afterSubmitFail();}else{}
          if (typeof afterSubmitResultFail == 'function') {afterSubmitResultFail(error.responseText);}else{}
         }
        $('#loaderBtn').remove();       
        //$("html, body").animate({ scrollTop: 0 }, "slow");
         seconds = new Date().getTime() / 1000;
      }
      });
      return false;
  });
}
function childFormSubmitAsync(ArrayofArrays,method,url,func,btnObj)
{
  var returnResult;
  $.ajax({
      type    : method,
      data    : {ArrayofArrays:ArrayofArrays},
      async:true,
      url     : url,
      beforeSend: function (request) {
      return request.setRequestHeader('X-CSRF-Token', $("meta[name='csrf-token']").attr('content'));
      },
      success: function (result) {
        func(result,btnObj);
      },
      error:function (error) {
        try { showError('msg','Some Error Occured'); } catch(ex) { }
        func(error.responseText,btnObj);
      }
      });
}

var showPreview = (input,imgId='')=>{
  if(imgId==''){
    imgId = $(input).attr('name')+'_preview';
  }
  if (input.files && input.files[0]) {
  var reader = new FileReader();
  reader.onload = function (e) {
    $('#'+imgId).attr('src', e.target.result);
    $('#'+imgId).show();
  }
  reader.readAsDataURL(input.files[0]);
    return input.files[0].name;
  }
  else
  {
    $('#'+imgId).attr('src', '');
    $('#'+imgId).hide();
  }
}
var showPreviewmultiple = (input,divId='')=>{
  if(divId==''){
    divId = $(input).attr('id')+'_multipreview';
  }
  var placeToInsertImagePreview = $('#'+divId)
  $('#'+divId).find('.runtimemultiadded').remove();
  if (input.files) {
      var filesAmount = input.files.length;
      for (i = 0; i < filesAmount; i++) {
          var reader = new FileReader();
          reader.onload = function(event) {
              $(placeToInsertImagePreview).append(`<div class="col-md-2 d-inline-block no-padding-left runtimemultiadded"><img src="${event.target.result}" class="img-responsive" /></div>`)
              //$($.parseHTML('<img>')).attr('class','img-responsive runtimemultiadded').attr('src', event.target.result).appendTo(placeToInsertImagePreview);
          }
          reader.readAsDataURL(input.files[i]);
      }
  }
}
var CopyText = (text)=>{
  var _fk = document.createElement('input');
  var _body = document.querySelector('body');
  _fk.value = text;
  _body.appendChild(_fk);
  _fk.select();
  document.execCommand("copy");
  notify('2','Text Copied');
  _fk.remove();
}
function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}
var ReloadPage = ()=>{
  location.reload();
}
(function() {
    recallajax();
})();