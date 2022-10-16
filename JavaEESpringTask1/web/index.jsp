<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Items" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
    <div class="container mb-3 col-9">
        <%@include file="navbar.jsp"%>
    </div>
    <p class="text-center"><strong>Welcome to BITLAB SHOP</strong></p>
    <p class="text-center">Electronic devices with high quality and service</p>

    <div class="container col-9">
        <div class="row">
        <%
            ArrayList<Items> items = (ArrayList<Items>) request.getAttribute("items");
            if(items != null) {
                for(Items i : items) {
        %>
            <div class = "col-3 mb-3">
                <div class="card text-bg-light text-center h-100">
                     <div class="card-header fw-bold"><%=i.getName()%></div>
                     <div class="card-body">
                         <h5 class="card-title text-success fw-bold"><%=i.getPrice()%></h5>
                         <p class="card-text">
                            <%=i.getDescription()%>
                        </p>
                         <a href="/" class="btn btn-success btn-sm w-100">Buy Now</a>
                    </div>
                </div>
            </div>

        <%
                }
            }
        %>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
