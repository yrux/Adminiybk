<div id="adminuploadImage" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Upload Image Ajax</h4>
      </div>
      <div class="modal-body" id="adminuploadImageBody">
        <input type="file" id="adminuploadAjax" name="adminuploadAjax" />
        <input type="hidden" id="adminuploadAjaxInput" />
        <div class="col-md-12" id="msgIndicator">
<div class="alert alert-info">
<strong>Info!</strong> Indicates a neutral informative change or action.
</div>
        </div>
        <div class="col-md-12">
          <label class="control-label col-md-4">Width</label>
          <div class="col-md-8"><input type="number" step="any" min="0" id="imageinlinewidth" /></div>
        </div>
        <div class="col-md-12">
          <label class="control-label col-md-4">Height</label>
          <div class="col-md-8"><input type="number" step="any" min="0" id="imageinlineheight" /></div>
        </div>
        <div class="col-md-12" id="img_href_admin" style="display:none;">
          <label class="control-label col-md-4">Apply href link</label>
          <div class="col-md-8">
            <input type="text"  id="imagehref" class="form-control" />
          </div>
        </div>
        <div class="col-md-12">
          <label class="control-label col-md-4">Applied Css</label>
          <div class="col-md-8" id="img_css_admin">
            
          </div>
        </div>
        <input type="button" id="normal_admin_ajax_image_upload" class="btn btn-success" value="Upload" onclick="UploadFile('adminuploadAjax',$('#adminuploadAjaxInput').val()+'|'+$('#imageinlinewidth').val()+'|'+$('#imageinlineheight').val())" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div id="anchorModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Anchor Management</h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
            <label class="control-label col-md-4">Anchor Link</label>
            <div class="col-md-8">
              <input type="text" class="form-control" id="anchor_link_admin_ajax" />
            </div>
          </div>
          <div class="col-md-12">
            <label class="control-label col-md-4">Anchor Name</label>
            <div class="col-md-8">
              <input type="text" class="form-control" id="anchor_name_admin_ajax" />
            </div>
          </div>
          <div class="col-md-12" style="margin-top:10px;">
            <div class="col-md-12">
              <input type="hidden" class="form-control" id="anchor_key_admin_ajax" />
              <button class="btn btn-success pull-right" onclick="updatingAnchor()">Update</button>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div id="yruxcontentEditor" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">Advance Content Editor</h1>
      </div>
      <div class="modal-body">
          <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                          <p>Write your content however you want</p>
                            <div class="panel-body">
                                <fieldset>
                                    <div class="form-group">
                                      <input type="hidden" id="yruxcontentEditorkey" />
                                        <textarea id="yruxcontentEditorta"></textarea>
                                    </div>
                                    <input onclick="updateContet($('#yruxcontentEditorkey').val(),CKEDITOR.instances['yruxcontentEditorta'].getData());" class="btn btn-lg btn-primary btn-block" value="Update Content" type="submit" id="normalEditor">
                  <input onclick="updatePageContent($('#yruxcontentEditorkey').val(),CKEDITOR.instances['yruxcontentEditorta'].getData(),this)" data-table="" data-col="" class="btn btn-lg btn-primary btn-block" value="Update Content" type="submit" id="tableEditor">
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
      </div>  
      </div>
  </div>
  </div>
</div>