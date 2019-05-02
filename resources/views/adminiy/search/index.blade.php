@extends('adminiy.layout.main')
@section('content-header')
<div class="toolbar">
<div class="toolbar__label"><span class="hidden-xs-down">Total</span> {{$count}} Photos</div>

<div class="actions">
<i class="actions__item zmdi zmdi-search" data-ma-action="toolbar-search-open"></i>
<!-- <a href="#" class="actions__item zmdi zmdi-time"></a>
<div class="dropdown actions__item">
    <i class="zmdi zmdi-sort" data-toggle="dropdown" aria-expanded="false"></i>

    <div class="dropdown-menu dropdown-menu-right" x-placement="top-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-105px, -116px, 0px);">
        <a href="#" class="dropdown-item">Last Modified</a>
        <a href="#" class="dropdown-item">Name</a>
        <a href="#" class="dropdown-item">Size</a>
    </div>
</div> 
<a href="#" class="actions__item zmdi zmdi-help-outline"></a>-->
</div>
<div class="toolbar__search" style="display: none;">
<form style="width: 100%;height: 100%;" method="GET" action="{{route('adminiy.mainsearch')}}">
<input type="text" value="{{isset($_GET['q'])?$_GET['q']:''}}" placeholder="Search..." name="q">
<i class="toolbar__search__close zmdi zmdi-long-arrow-left" data-ma-action="toolbar-search-close"></i>
</form>
</div>
</div>
<div class="row lightbox photos">
@if($data)
    @foreach($data as $dat)
        <a href="{{asset($dat->img_path)}}" class="col-md-2 col-4">
            <div class="lightbox__item photos__item">
                <img src="{{asset($dat->img_path)}}" alt="">
            </div>
        </a>
    @endforeach
@endif
</div>
@endsection
@section('content')

@section('js')
<script src="{{asset('admin/vendors/lightgallery/js/lightgallery-all.min.js')}}"></script>
<script type="text/javascript">
(function() {
   
})();
</script>
@endsection
@section('hcss')
<link rel="stylesheet" href="{{asset('admin/vendors/lightgallery/css/lightgallery.min.css')}}">
@endsection
@section('css')
<style type="text/css">

</style>
@endsection