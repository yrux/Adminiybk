@extends('adminiy.layout.main')
@section('content')
<div class="card-demo card-redirect column size-1of2">
<div class="card bg-blue card--inverse">
<div class="card-body">
<h4 class="card-title">Logo Management <kbd>117x110</kbd></h4>
<div class="actions">
<a href="{{url('/adminiy/listing/imagetable-listing#table_name=logo&ref_id=0&type=1')}}" class="actions__item zmdi zmdi-image-o zmdi-hc-fw"></a>
</div>
</div>
</div>
</div>

<div class="card-demo card-redirect column size-1of2">
<div class="card bg-green card--inverse">
<div class="card-body">
<h4 class="card-title">Favicon Management <kbd>32x32</kbd></h4>
<div class="actions">
    <a href="{{url('/adminiy/listing/imagetable-listing#table_name=favicon&ref_id=0&type=1')}}" class="actions__item zmdi zmdi-image-o zmdi-hc-fw"></a>
</div>
</div>
</div>
</div>
<div class="card-demo card-redirect column size-1of2">
<div class="card bg-blue card--inverse">
<div class="card-body">
<h4 class="card-title">Contact Banner <kbd>625x373</kbd></h4>
<div class="actions">
    <a href="{{url('/adminiy/listing/imagetable-listing#table_name=contactbanner&ref_id=0&type=1')}}" class="actions__item zmdi zmdi-image-o zmdi-hc-fw"></a>
</div>
</div>
</div>
</div>

<div class="card-demo card-redirect column size-1of2">
<div class="card bg-green card--inverse">
<div class="card-body">
<h4 class="card-title">Page Banner <kbd>569x387</kbd></h4>
<div class="actions">
    <a href="{{url('/adminiy/listing/imagetable-listing#table_name=pagebanner&ref_id=0&type=1')}}" class="actions__item zmdi zmdi-image-o zmdi-hc-fw"></a>
</div>
</div>
</div>
</div>

<div class="card-demo card-redirect column size-1of2">
<div class="card bg-green card--inverse">
<div class="card-body">
<h4 class="card-title">Contact Inquiries</h4>
<div class="actions">
	<a href="{{url('/adminiy/listing/inquiry-listing#type=1')}}" class="actions__item zmdi zmdi-pin-help zmdi-hc-fw"></a>
</div>
</div>
</div>
</div>

<div class="column size-1of2"><div class="card card--inverse widget-signups">
<div class="card-body">
<h4 class="card-title">Most Recent Signups <small>Recent 20</small></h4>
<div class="actions actions--inverse">
<div class="actions__item">
    <i data-toggle="dropdown" class="zmdi zmdi-more-vert" aria-expanded="false"></i>
    <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(32px, 26px, 0px);">
        <a href="#" class="dropdown-item">List</a>
    </div>
</div>
</div>
<div class="widget-signups__list">
@if($recentSignups)
    @foreach($recentSignups as $recentSignup)
        <a data-toggle="tooltip" title="" href="#" data-original-title="{{$recentSignup->name}}">
            @if($recentSignup->img_path)
            <img class="avatar-img" src="{{asset($recentSignup->img_path)}}" alt="">
            @else
            <div class="avatar-char">{{$recentSignup->_fc}}</div>
            @endif
        </a>
    @endforeach
@endif
</div>
</div>
</div>
</div>
@endsection
@section('hcss')
<link rel="stylesheet" href="{{asset('admin/demo/css/demo.css')}}">
@endsection
@section('css')
<style>
.card-redirect .card-title {
	margin-bottom: 0px;
}
.actions:not(.actions--inverse) .actions__item {
    color: white;
}
.actions:not(.actions--inverse) .actions__item:hover {
    color: white;
}
.card-demo.card-redirect {
	max-width: unset;
	margin: unset;
}
</style>
@endsection