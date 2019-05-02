@extends('adminiy.layout.main')
@section('content-header')

@endsection
@section('content')
<div class="ytable-iconoverlay"></div>
@if($listingData->page_heading!="")
    <h4 class="card-title"><span>{{$listingData->page_heading}}</span>
    @if($listingData->fast_crud=='1')
        <button class="btn btn-danger btn--action zmdi zmdi-plus ytable-addrecord" data-placement="left" title="Add New Record" data-toggle="tooltip"></button>
    @endif
    </h4>
@endif
<button data-toggle="tooltip" data-placement="left" title="Sort Records" class="btn btn-info btn--action ytable-sortrecord"><i class="zmdi zmdi-sort-asc zmdi-hc-fw"></i></button>
@if($listingData->page_message!="")
<h6 class="card-subtitle"><?php print $listingData->page_message; ?></h6>
@endif
<div class="widget-search widget-search--inverse bg-table-dark">
    <i class="zmdi zmdi-search"></i>
    <input type="text" class="widget-search__input" id="ytableSearch" placeholder="Search...">
    <div class="ytable-limit">
        <label id="ytable-limit-place">Limit (10)</label>
        <div id="input-slider-ytable"></div>
    </div>
</div>
<table class="table table-dark mb-0 ytable">
   
</table>
<nav class="ytablepaginate">
<ul class="pagination justify-content-center" id="ytablepaginateli">
    
</ul>
</nav>
@if($listingData->fast_crud=='1')
<div class="modal fade" id="ytable-FastCRUD" tabindex="-1" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title pull-left">{{$FastCrudHeading}}</h5>
            </div>
            <div class="modal-body">
                <form  enctype="multipart/form-data" class="row CrudForm" data-customcallbackFail="ytableCrudCBFail" data-nosubmit="true" method="POST" data-noinfo="true" data-customcallback="ytableCrudCB" action="{{route('adminiy.fastCRUD')}}" id="ytable-FastCRUDForm">
                    <div class="col-md-12" id="ytable-FastCRUDFields">
                        
                    </div>
                <input type="hidden" id="ytable_table" name="ytable_table" value="{{$listingData->table_name}}" />
                <input type="hidden" id="unique_column" name="unique_column" value="id" />
                <input type="hidden" id="modelName" name="modelName" value="{{$listingData->model_name}}" />
                <input type="submit" style="display:none;" id="ytable-FastCRUDFormSubmit" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-success" onclick="$('#ytable-FastCRUDFormSubmit').click();" id="ytable-fastCrudRectify">Rectify Record</button>
                <button type="button" class="btn btn-link" data-ytablereset="true" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
@endif
@endsection
<!--Sorting Modal-->
<div class="modal fade" id="ytable-sortModal" tabindex="-1" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title pull-left">Sort Ytable</h5>
            </div>
            <div class="modal-body" id="ytable-sortModal-body">
                <div class="row">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn active">
                            <input type="radio" name="options" id="option1" autocomplete="off" checked=""> Active
                        </label>
                        <label class="btn">
                            <input type="radio" name="options" id="option2" autocomplete="off"> Radio
                        </label>
                        <label class="btn">
                            <input type="radio" name="options" id="option3" autocomplete="off"> Radio
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!--Sorting Modal-->
@section('js')
@include('adminiy.fullwidgets.adminiyHelper')
<script src="{{asset('js/plugin/ytable.js')}}"></script>
<script src="{{asset($listingData->js_file)}}"></script>
<script src="{{asset('admin/vendors/autosize/autosize.min.js')}}"></script>
<script src="{{asset('admin/vendors/nouislider/nouislider.min.js')}}"></script>
<script src="{{asset('admin/vendors/flatpickr/flatpickr.min.js')}}"></script>
<script src="{{asset('admin/vendors/ckeditor/ckeditor/ckeditor.js')}}" type="text/javascript"></script>
<script type="text/javascript">
var _defaultLimit = window.localStorage.getItem('ytable-default-limit')?window.localStorage.getItem('ytable-default-limit'):10;
var sorted=false;
(function() {
    @if($listingData->fast_crud=='1')
        enableFastCrud();
        var b = document.getElementById("input-slider-ytable");
        noUiSlider.create(b, {
            start: [_defaultLimit],
            step: 5,

            connect: "lower",
            range: {
                min: 10,
                max: 100
            }
        });
        b.noUiSlider.on("update", function(a, b) {
            ytabled.resetyTable(a[b].replace('.00',''));
            window.localStorage.setItem('ytable-default-limit',a[b].replace('.00',''))
            document.getElementById('ytable-limit-place').innerHTML = 'Limit ('+a[b].replace('.00','')+')';
        })
    @endif
    //$('body').addClass('ytableBlur');
    document.getElementsByClassName('ytable-sortrecord')[0].addEventListener('click',function(){
        ytabled.allClause['order by'];
        $('#ytable-sortModal').modal('toggle');
        var _filterdColumns = ytabled.colnames.filter(q=>{
            if(!q.hiddenInList){
                return q;
            }
        });
        var _html = '';
        _filterdColumns.forEach(d=>{
            _html+='<label class="btn '+(!sorted?'active':'')+'"><input type="radio" data-sortcol="'+d.column+'" name="'+d.column+'_sort" id="'+d.column+'_sort_id" autocomplete="off"> '+d.name+'</label>';
            sorted=true;
        });
        document.getElementById('ytable-sortModal-body').innerHTML='<div class="btn-group btn-group-toggle" data-toggle="buttons">'+_html+'</div>';
    })
   /*just like document ready*/
   $('.ytable-addrecord').hover(function(){
        // $('body').addClass('ytableBlur');
   },function(){
    // $('body').removeClass('ytableBlur');
   })
})();
</script>
@endsection
@section('hcss')
<link rel="stylesheet" href="{{asset('admin/vendors/nouislider/nouislider.min.css')}}">
<link rel="stylesheet" href="{{asset('admin/vendors/flatpickr/flatpickr.min.css')}}">
@endsection
@section('css')
<style type="text/css">
.ytablepaginate {
    background: #313a44;
    padding-top: 15px;
    padding-bottom: 3px;
    border-top: 1px solid;
}
.widget-search {
    border-radius: 2px;
    margin-bottom: 0px;
    position: relative;
}
.bg-table-dark {
    background-color: #313a44!important;
    border-bottom: 1px solid gray;
}
.ytable-marktedDeleted {
    background: #32c7875e;
    color: white;
}
.widget-search__input{
    width:70%;
}
.ytable-limit{
    width: 24%;
    float: right;
    margin-right: 22px;
    text-align: center;
}
.ytable-limit label {
    text-align: center;
    margin: 0 auto;
    padding-top: 5px;
}
.ytable-limit #input-slider-ytable {
    margin-top: 7px;
}
#input-slider-ytable .noUi-connect {
    background: #2196F3;
}
#input-slider-ytable.noUi-horizontal .noUi-handle, #input-slider-ytable.noUi-vertical .noUi-handle {
    background-color: #2196F3;
}
.ytableBody .btn--icon {
    width: 2rem;
    height: 2rem;
    font-size: 14px;
    margin-right: 4px;
    color:white;
}
.img-responsive {
    width: 100%;
    height: auto;
}
.no-padding-left{
    padding-left: 0px;
}
.remove-fastcrud-image:hover{
 background: #fd03032e;
}
.remove-fastcrud-image {
    position: absolute;
    top: 0;
    bottom: 0;
    width: 95%;
    height: 100%; 
}
.remove-fastcrud-image:hover + img {
    /*filter: blur(8px);
    -webkit-filter: blur(8px);*/
}
.ytable-sortrecord {
    right: 90px;
}
#ytable-sortModal-body .btn-group, .btn-group-vertical{
display: block;
}
.flatpickr-calendar{
width:334px;
}
.ytable-rowimg {
    max-width: 150px;
    max-height: 150px;
}
.table-dark td{
    vertical-align: inherit;
}
</style>
@endsection