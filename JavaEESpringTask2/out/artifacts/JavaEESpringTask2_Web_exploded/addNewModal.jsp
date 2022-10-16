  <%--                                Modal Add New News--%>
<div class="modal fade" id="addNewsModal" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add News</h5>
      </div>
      <form action="/add" method="post">
        <div class="modal-body">
          <div class="row mt-3">
            <div class = "col-12">
              <label>Title:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" name="title">
            </div>
            <div class = "col-12">
              <label>Picture URL:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" name="picture_url">
            </div>
            <div class = "col-12">
              <label>Language:</label>
            </div>
            <div class = "col-12 mb-2">
              <select class="form-select" name="language_id">
                <%
                  if (languages != null) {
                    for (Languages l:languages) {

                %>
                <option value="<%=l.getId()%>">
                  <%=l.getName()%>
                </option>
                <%
                    }
                  }
                %>
              </select>
            </div>
            <div class = "col-12 mb-2">
              <select class="form-select" name="publication_id">
                <%
                  if (publications != null) {
                    for (Publications p:publications) {
                %>
                <option value="<%=p.getId()%>">
                  <%=p.getName()%>
                </option>
                <%
                    }
                  }
                %>
              </select>
            </div>
            <div class = "col-12">
              <label>Short Content:</label>
            </div>
            <div class = "col-12 mb-2">
              <textarea rows="3" cols="50" class="form-control" name="short_content"></textarea>
            </div>
            <div class = "col-12">
              <label>Content:</label>
            </div>
            <div class = "col-12 mb-2">
              <textarea rows="10" cols="50" class="form-control" name="content"></textarea>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">Add news</button>
          <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--                                Modal Add New Public--%>
<div class="modal fade" id="addPablicModal" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add new Public</h5>
      </div>
      <form action="/add" method="post">
        <div class="modal-body">
          <div class="row mt-3">
            <div class = "col-12">
              <label>Name:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" name="public_name">
            </div>
            <div class = "col-12">
              <label>Description:</label>
            </div>
            <div class = "col-12 mb-2">
              <textarea rows="3" cols="50" class="form-control" name="description"></textarea>
            </div>
            <div class = "col-12">
              <label>Rating:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" name="rating">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">Add public</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--                                Modal Add New Lang--%>
<div class="modal fade" id="addLangModal" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Language</h5>
      </div>
      <form action="/add" method="post">
        <div class="modal-body">
          <div class="row mt-3">
            <div class = "col-12">
              <label>Name:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" name="lang_name">
            </div>
            <div class = "col-12">
              <label>Code:</label>
            </div>
            <div class = "col-12 mb-2">
              <input type="text" class="form-control" name="code" id="formText">
              <label for="formText" class="form-label"><i>Max 3 simbols</i></label>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">Add Language</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--                                Modal Add New Button--%>
<div class="modal fade" id="addNewModal" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add New</h5>
      </div>
      <div class="modal-body">
        <div class="row mt-3">
          <div class = "col-6">
            <label>Add new News:</label>
          </div>
          <div class = "col-6">
            <button class="btn btn-primary" data-bs-target="#addNewsModal" data-bs-toggle="modal">Add</button>
          </div>
        </div>
        <div class="row mt-3">
          <div class = "col-6">
            <label>Add new Publication:</label>
          </div>
          <div class = "col-6">
            <button class="btn btn-primary" data-bs-target="#addPablicModal" data-bs-toggle="modal">Add</button>
          </div>
        </div>
        <div class="row mt-3 mb-3">
          <div class = "col-6">
            <label>Add new Language:</label>
          </div>
          <div class = "col-6">
            <button class="btn btn-primary" data-bs-target="#addLangModal" data-bs-toggle="modal">Add</button>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>