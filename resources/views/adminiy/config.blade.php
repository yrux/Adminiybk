@extends('adminiy.layout.main')
@section('content')
<?php 
$data = Helper::returnDataSet('m_flag',"is_config = 1");
?>
@if($data)
<form  enctype="multipart/form-data" class="row" method="POST"  action="{{route('adminiy.configSave')}}" >
{!! csrf_field() !!}
@foreach($data as $items)
<div class="col-md-12">
<div class="form-group">
<label class="" for="form-field-6">
@if($items->flag_show_text=="")
{{$items->flag_type}}
@else
{{$items->flag_show_text}}
@endif
</label>
<input type="text" class="form-control" value="{{$items->flag_value==$items->flag_additionalText?$items->flag_value:$items->flag_additionalText}}" name="{{$items->flag_type}}" />
<i class="form-group__bar"></i>
</div>
</div>
@endforeach
<div class="col-md-12">
<div class="form-group">
<input type="submit" class="btn btn-outline-success float-right" value="Rectify Config" />
</div>
</div>
</form>
@endif
@endsection
@section('css')
	<style>
	</style>
@endsection
@section('js')
		
@endsection