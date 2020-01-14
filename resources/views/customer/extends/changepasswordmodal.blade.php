<div id="customermodulechangepass" class="modal fade custom-modal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Change Password</h4>
      </div>
      <div class="modal-body">
    <form action="{{route('customer.changepassword')}}" method="POST">
    @csrf
      <div class="form-group">
        <label for="email">Password:</label>
        <input type="text" class="form-control" id="email" name="change_password">
      </div>
      <div class="form-group">
        <label for="pwd">Confirm Password:</label>
        <input type="text" class="form-control" id="pwd" name="change_confirm_password">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>