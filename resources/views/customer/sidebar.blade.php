<div class="col-sm-3 sidenav">
 <div class="list-group">
  <a href="#" class="list-group-item active">Account information</a>
  <a href="#customermodulechangepass" data-toggle="modal" class="list-group-item">Change Password</a>
  <a href="{{route('customer.logout')}}" class="list-group-item">Logout</a>
</div>
</div>
@include('customer.extends.changepasswordmodal')