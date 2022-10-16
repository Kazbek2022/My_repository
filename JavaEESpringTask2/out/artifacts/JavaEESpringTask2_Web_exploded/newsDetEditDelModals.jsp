<%--Modal news details--%>
<div class="modal fade" id="detailsModal<%=n.getId()%>" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">News Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mt-3">
                    <div class = "col-12">
                        <label>Short Content:</label>
                    </div>
                    <div class = "col-12 mt-2">
                            <textarea rows="3" cols="50" class="form-control"
                                      readonly><%=n.getShort_content()%>
                            </textarea>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class = "col-12">
                        <label>Content:</label>
                    </div>
                    <div class = "col-12 mt-2">
                        <textarea rows="10" cols="50" class="form-control"
                                  readonly><%=n.getContent()%>
                        </textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%--                        Modal Edit News--%>
<div class="modal fade" id="EditNewsModal<%=n.getId()%>" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">News Edit</h5>
            </div>
            <form action="/update" method="post">
                <input type="hidden" name="news_id" value="<%=n.getId()%>">
                <div class="modal-body">
                    <div class="row mt-3">
                        <div class = "col-12">
                            <label>Title:</label>
                        </div>
                        <div class = "col-12 mb-2">
                            <input type="text" class="form-control" value="<%=n.getTitle()%>" name="title">
                        </div>
                        <div class = "col-12">
                            <label>Post date:</label>
                        </div>
                        <div class = "col-12 mb-2">
                            <input type="text" class="form-control" value="<%=n.getPost_date()%>" name="post_date">
                        </div>
                        <div class = "col-12">
                            <label>Picture URL:</label>
                        </div>
                        <div class = "col-12 mb-2">
                            <input type="text" class="form-control" value="<%=n.getPicture_url()%>" name="picture_url">
                        </div>
                        <div class = "col-12">
                            <label>Language:</label>
                        </div>
                        <div class = "col-12 mb-2">
                            <select class="form-select" name="language">
                                <%
                                    if (languages != null) {
                                        for (Languages l:languages) {

                                %>
                                <option value="<%=l.getId()%>"<%if (l.getId()==n.getLanguage().getId())
                                {out.print("selected");}%>>
                                    <%=l.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class = "col-12 mb-2">
                            <select class="form-select" name="publication">
                                <%
                                    if (publications != null) {
                                        for (Publications p:publications) {
                                %>
                                <option value="<%=p.getId()%>" <%if (p.getId()==n.getPublication().getId())
                                {out.print("selected");}%>>
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
                            <textarea rows="3" cols="50" class="form-control"
                                      name="short_content"><%=n.getShort_content()%>
                            </textarea>
                        </div>
                        <div class = "col-12">
                            <label>Content:</label>
                        </div>
                        <div class = "col-12 mb-2">
                            <textarea rows="10" cols="50" class="form-control"
                                      name="content"><%=n.getContent()%>
                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary">Edit news</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--                        Modal Delete News--%>
<div class="modal fade" id="deleteNewsModal<%=n.getId()%>" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">News Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/delete" method="post">
                <input type="hidden" name="news_id" value="<%=n.getId()%>">
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
