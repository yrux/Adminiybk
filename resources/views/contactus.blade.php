@extends('layouts.main')
@section('content')
<form method="POST" action="{{route('contactusSubmit')}}">
@csrf
<div class="form-group">
  <div class="row">
    <div class="col-md-6 col-sm-6 col-xs-12">
      {{Helper::errorField('inquiries_name',$errors)}}
      <input placeholder="First Name" name="inquiries_name" value="{{old('inquiries_name')}}" type="text" class="form-control">
    </div>
    <div class="col-md-6 col-sm-6 col-xs-12">
      {{Helper::errorField('inquiries_lname',$errors)}}
      <input placeholder="Last Name" name="inquiries_lname" value="{{old('inquiries_lname')}}" type="text" class="form-control">
    </div>
  </div>
</div>
<div class="form-group">
  <div class="row">
    <div class="col-md-6 col-sm-6 col-xs-12">
      {{Helper::errorField('inquiries_email',$errors)}}
      <input placeholder="Email"  name="inquiries_email" value="{{old('inquiries_email')}}" type="text" class="form-control">
    </div>
    <div class="col-md-6 col-sm-6 col-xs-12">
      {{Helper::errorField('inquiries_phone',$errors)}}
      <input placeholder="Phone Number" name="inquiries_phone" value="{{old('inquiries_phone')}}" type="text" class="form-control">
    </div>
  </div>
</div>
<div class="form-group">
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <textarea placeholder="Comment" name="extra_content" class="form-control">{{old('extra_content')}}</textarea>
    </div>
  </div>
</div>
<div class="form-group">
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="contact_btn">
        <input type="submit" class="form-control" value="Submit">
      </div>
    </div>
  </div>
</div>
</form>
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