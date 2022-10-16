<%--                                Modal Edit Publics--%>
<div class="modal fade" id="editPublicsModal<%=p.getId()%>" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Public Edit</h5>
      </div>
      <form action="/update" method="post">
        <input type="hidden" name="public_id" value="<%=p.getId()%>">
        <div class="modal-body">
          <div class="row mt-3">
            <div class = "col-12">
              <label>Name:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" value="<%=p.getName()%>" name="name">
            </div>
            <div class = "col-12">
              <label>Description:</label>
            </div>
            <div class = "col-12 mb-2">
                <textarea rows="3" cols="50" class="form-control" name="description"><%=p.getDescription()%></textarea>
            </div>
            <div class = "col-12">
              <label>Rating:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" value="<%=p.getRating()%>" name="rating">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">Edit public</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--                                Modal Delete Public--%>
<div class="modal fade" id="deletePublicsModal<%=p.getId()%>" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Public Delete</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form action="/delete" method="post">
        <input type="hidden" name="public_id" value="<%=p.getId()%>">
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
