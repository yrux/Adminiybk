@extends('adminiy.layout.main')
@section('content')
<form class="row" method="POST" action="{{route('adminiy.artisan.execute')}}">
@csrf
<div class="col-md-12">
<h3 class="card-body__title">{{$title}}</h3>

<div class="form-group form-group--float">
    <input required="" name="command" type="text" class="form-control">
    <label>Command</label>
    <i class="form-group__bar"></i>
</div>
<table class="table">
	<thead>
	<tr>
		<th>Command Parameter</th>
		<th>Command Parameter Value</th>
		<th>Action</th>
	</tr>
	</thead>
	<tbody id="commandparams">
	</tbody>
</table>
<button type="button" onclick="addrow();" class="btn btn-success m-1">Add Row</button>
</div>
<div class="col-md-12">
	<button type="submit" class="btn btn-info btn-block">Run Command</button>
</div>
</form>
@if(!empty(session('artisan_output')))
    @php
        $data = session('artisan_output');
        print '<div class="col-md-12" style="background: black;color: white;margin-top: 10px;">'.nl2br($data).'</div>';
    @endphp
@endif
@endsection
@section('css')
<style>
</style>
@endsection
@section('js')
<script type="text/javascript">
var addrow = ()=>{
	$('#commandparams').append(`<tr>
			<td><input required="" placeholder="Key" type="text" class="form-control" name="commandkey[]" /></td>
			<td><input required="" placeholder="Value" type="text" class="form-control" name="commandval[]" /></td>
			<td><a href="javascript:void(0)" onclick="removerow(this)">Remove</a></td>
		</tr>`);
};
var removerow = (obj)=>{
	$(obj).parent().parent().remove();
}
</script>
@endsection