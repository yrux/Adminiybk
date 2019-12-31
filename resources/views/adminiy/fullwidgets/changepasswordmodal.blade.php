<div class="modal fade" id="modal-changepassword" tabindex="-1">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title pull-left">Change Password</h5>
			</div>
			<div class="modal-body">
				<form class="row" method="POST" action="{{route('adminiy.changepassword')}}">
					@csrf
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" name="change_password" class="form-control" placeholder="New Password">
							<i class="form-group__bar"></i>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="password" name="change_confirm_password" class="form-control" placeholder="Confirm Password">
							<i class="form-group__bar"></i>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="submit" class="btn btn-success" value="Confirm">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>