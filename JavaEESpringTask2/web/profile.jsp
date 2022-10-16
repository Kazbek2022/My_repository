<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DB.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>

<body>
<%
    ArrayList<Languages> languages = DBManager.getLanguages();
    ArrayList<Publications> publications = DBManager.getPublics();

    ArrayList<News> allNews = new ArrayList<>();   // alternative to create new getAllNews method from SQL
    for (Languages l : languages) {
        ArrayList<News> news = new ArrayList<>();
        news = DBManager.getNewsByLang(l.getId());
        allNews.addAll(news);
    }
%>

<%@include file="navbarForAdminPanel.jsp"%>
<div class="container col-12" style="min-height: 600px">
    <div class="row">
        <div class="col-2 mt-1">
            <div class="container">
                <div class="row mb-2">
                    <div class="col-12">
                        <a href="/profile" class="link-dark text-decoration-none fs-6 fw-bold">
                            <%=LanguageChange.getTranslation(langId,"adminPanel")%>
                        </a>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-12">
                        <a href="/profile?languages" class="link-dark text-decoration-none fs-6 fw-bold">
                            <%=LanguageChange.getTranslation(langId,"languages")%>
                        </a>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-12">
                        <a href="/profile?publications" class="link-dark text-decoration-none fs-6 fw-bold">
                            <%=LanguageChange.getTranslation(langId,"publications")%>
                        </a>
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col-12">
                        <a href="/profile?news" class="link-dark text-decoration-none fs-6 fw-bold">
                            <%=LanguageChange.getTranslation(langId,"news")%>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-10">
            <div class="container">
                <%
                    if (request.getParameter("changeError") != null) {
                %>
                CHANGE ERROR!
                <%
                    }
                    String reqLangs = request.getParameter("languages");
                    String reqPublics = request.getParameter("publications");
                    String reqNews = request.getParameter("news");

                    if (reqLangs != null || reqPublics != null || reqNews != null) {
                %>
                <%@include file="addNewModal.jsp"%>
                <div class="row mb-2 fs-5 fw-bold text-success mb-2 align-middle">
                    <div class="col-9 opacity-50">
                        <%
                            if (reqLangs != null) out.print(LanguageChange.getTranslation(langId, "languages"));
                                else if (reqPublics != null)
                                    out.print(LanguageChange.getTranslation(langId, "publications"));
                                    else if (reqNews != null) out.print(LanguageChange.getTranslation(langId, "news"));
                        %>
                    </div>
                    <div class="col-3 text-end">
                        <button type="button" class="btn btn-success fw-bold btn-sm" data-bs-toggle="modal"
                                data-bs-target="#addNewModal">Add New</button>
                    </div>
                </div>
                <%
                    }
                    if (reqLangs != null || request.getParameter("langsChanged") != null) {
                %>
                <div class="row">
                    <div class="col-12">
                        <table class="table table-striped table-sm align-middle text-center">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Code</th>
                                <th scope="col">Operations</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (languages != null) {
                                    for (Languages l: languages) {
                            %>
                            <tr>
                                <td><%=l.getId()%></td>
                                <td><%=l.getName()%></td>
                                <td><%=l.getCode()%></td>
                                <td>
                                    <button type="button" class="btn btn-success btn-sm"
                                            data-bs-toggle="modal" data-bs-target="#editLangsModal<%=l.getId()%>">Edit
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm"
                                            data-bs-toggle="modal" data-bs-target="#deleteLangsModal<%=l.getId()%>">Delete
                                    </button>
                                </td>
                            </tr>
                            <%@include file="languagesEditDelModals.jsp"%>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%
                    }
                    if (reqPublics != null || request.getParameter("publicsChanged") != null) {
                %>
                <div class="row">
                    <div class="col-12">
                        <table class="table table-striped table-sm align-middle text-center">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Rating</th>
                                    <th scope="col">Operations</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (publications != null) {
                                        for (Publications p: publications) {
                                %>
                                <tr>
                                    <td><%=p.getId()%></td>
                                    <td><%=p.getName()%></td>
                                    <td><%=p.getDescription()%></td>
                                    <td><%=p.getRating()%></td>
                                    <td style="min-width: 150px">
                                        <button type="button" class="btn btn-success btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#editPublicsModal<%=p.getId()%>">Edit
                                        </button>
                                        <button type="button" class="btn btn-danger btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#deletePublicsModal<%=p.getId()%>">Delete
                                        </button>
                                    </td>
                                </tr>
                                <%@include file="publicsEditDelModals.jsp"%>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%
                    }
                    if (reqNews != null || request.getParameter("newsChanged") != null) {
                %>
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-striped align-middle text-center">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Title</th>
                                <th scope="col">Post_date</th>
                                <th scope="col">Language</th>
                                <th scope="col">Publication</th>
                                <th scope="col">Details</th>
                                <th scope="col">Operations</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (allNews != null) {
                                    for (News n: allNews) {
                            %>
                            <tr>
                                <td><%=n.getId()%></td>
                                <td><%=n.getTitle()%></td>
                                <td>
                                    <%
                                        String time_date = new SimpleDateFormat("dd/MM/yyyy, HH:mm")
                                                .format(n.getPost_date());
                                        out.print(time_date);
                                    %>
                                </td>
                                <td><%=n.getLanguage().getName()%></td>
                                <td><%=n.getPublication().getName()%></td>
                                <td>
                                    <button type="button" class="btn btn-success btn-sm"
                                            data-bs-toggle="modal" data-bs-target="#detailsModal<%=n.getId()%>">Details
                                    </button>
                                </td>
                                <td style="min-width: 150px">
                                    <button type="button" class="btn btn-success btn-sm"
                                            data-bs-toggle="modal" data-bs-target="#editNewsModal<%=n.getId()%>">Edit
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm"
                                            data-bs-toggle="modal" data-bs-target="#deleteNewsModal<%=n.getId()%>">Delete
                                    </button>
                                </td>
                            </tr>
                            <%@include file="newsDetEditDelModals.jsp"%>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>