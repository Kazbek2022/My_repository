<%@ page import="db.Users" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<div class="container mb-3 col-9">
    <%@include file="navbar.jsp"%>
</div>

<%
    Users user = (Users) request.getAttribute("user");
%>

<div class="container col-9">
    <div class="row">
        <div class="col-12">
            <p class="text-center"><strong>Hello <%=user.getFullName()%></strong></p>
            <p class="text-center">This is your profile page</p>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>

