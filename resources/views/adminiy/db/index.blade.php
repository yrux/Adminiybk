@extends('adminiy.layout.main')
@section('content')
<form class="row" method="POST" action="{{route('adminiy.db.firequery')}}">
@csrf
	<div class="col-md-12">
		<div class="form-group">
			<button type="button" class="btn btn-success" onclick="selectcmd()">Select</button>
			<button type="button" class="btn btn-success" onclick="updatecmd()">Update</button>
			<button type="button" class="btn btn-success" onclick="insertcmd()">Insert</button>
			<button type="button" class="btn btn-success" onclick="deletecmd()">Delete</button>
			<button type="button" class="btn btn-success" onclick="dropcmd()">Drop</button>
		</div>
	</div>
	<div class="col-md-12">
	    <div class="form-group">
	        <textarea class="form-control textarea-autosize" id="querybox" name="querybox" rows="5" placeholder="Query"></textarea>
	        <i class="form-group__bar"></i>
	    </div>
	</div>
	<div class="col-md-6">
		<div class="input-group input-group-sm">
		<div class="input-group-prepend">
		    <span class="input-group-text">Limit Start</span>
		</div>
		<input type="number" name="default_limit_start" min="0" value="0" class="form-control">
		<i class="form-group__bar"></i>
		</div>
	</div>
	<div class="col-md-6">
		<div class="input-group input-group-sm">
		<div class="input-group-prepend">
		    <span class="input-group-text">Limit End</span>
		</div>
		<input type="number" name="default_limit_end" min="0" value="1000" class="form-control">
		<i class="form-group__bar"></i>
		</div>
	</div>
	<button class="btn btn-info btn-block">Go</button>
	@if(!empty(session('query_response')))
	<div class="col-md-12">
		<div class="form-group">
		    @php
		        $data = session('query_response');
		        dump($data);
		    @endphp
		</div>
	</div>
	@endif
</form>
@endsection
@section('css')
<style>
</style>
@endsection
@section('js')
<script type="text/javascript">
var selectcmd = ()=>{
	$('#querybox').val("Select * from `tablename` where 1=1");
}
var updatecmd = ()=>{
	$('#querybox').val("Update `tablename` set `col1`='value',`col2`='value' where 1=1");
}
var insertcmd = ()=>{
	$('#querybox').val("INSERT INTO `tablename` (`column1`, `column2`, `column3`) VALUES ('value1', 'value2', 'value3')");
}
var deletecmd = ()=>{
	$('#querybox').val("Delete from `tablename` where 1=1");
}
var dropcmd = ()=>{
	$('#querybox').val("DROP TABLE `tablename`");
}
</script>
@endsection