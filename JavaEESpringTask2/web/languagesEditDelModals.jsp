<%--                                Modal Edit Lang--%>
<div class="modal fade" id="editLangsModal<%=l.getId()%>" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Language Edit</h5>
      </div>
      <form action="/update" method="post">
        <input type="hidden" name="lang_id" value="<%=l.getId()%>">
        <div class="modal-body">
          <div class="row mt-3">
            <div class = "col-12">
              <label>Name:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" value="<%=l.getName()%>" name="name">
            </div>
            <div class = "col-12">
              <label>Code:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" value="<%=l.getCode()%>" name="code">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">Edit Language</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--                                Modal Delete Lang--%>
<div class="modal fade" id="deleteLangsModal<%=l.getId()%>" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Language</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="/delete" method="post">
        <input type="hidden" name="lang_id" value="<%=l.getId()%>">
        <div class="modal-body">
          <div class="row mt-3">
            <div class="col-12 alert alert-danger" role="alert">ARE YOU SURE?</div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-danger">Delete</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
