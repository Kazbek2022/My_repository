<%@ page import="java.util.Optional" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="DB.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.LanguageChange" %>
<%@ page import="DB.Languages" %>
<%@ page import="DB.Publications" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%@include file="head.jsp"%>
</head>

<body>

<%@include file="navbar.jsp"%>
<div class="container" style="min-height: 600px">
    <div class="row">
        <div class="col-6 mx-auto">
           <%
               if(request.getParameter("error") != null){
           %>
            <div class="alert alert-danger" role="alert">
                <%=LanguageChange.getTranslation(langId,"login_error")%>
            </div>
            <%
                }
            %>
            <form action="/login" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label"><%=LanguageChange.getTranslation(langId,"mail")%></label>
                    <input type="email" class="form-control" id="exampleInputEmail1" name="email">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label"><%=LanguageChange.getTranslation(langId,"password")%></label>
                    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                </div>
                <button class="btn btn-success"><%=LanguageChange.getTranslation(langId,"button")%></button>
            </form>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>