@extends('layouts.main')
@section('content')
<div class="container-fluid text-center">    
  <h1>Welcome {{$user->name}}</h1>
  <div class="row content">
    @include('customer.sidebar')
    <div class="col-sm-9"> 
      <p>Page here</p>
    </div>
  </div>
</div>
@endsection
@section('css')
<style type="text/css">
	/*in page css here*/
</style>
@endsection
@section('js')
<script type="text/javascript">
(()=>{
  /*in page css here*/
})()
</script>
@endsection