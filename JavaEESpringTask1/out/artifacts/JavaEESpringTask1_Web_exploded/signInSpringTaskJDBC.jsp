<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
<div class="container mb-3 col-9">
    <%@include file="navbar.jsp"%>
</div>

<div class="container col-9">
    <%
        if(request.getParameter("error") != null){

    %>
    <div class="row">
        <div class="col-12">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect <strong>email</strong> or <strong>password</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
    </div>
    <%
        }
    %>

    <div class="row">
        <div class="col-12">
            <form action="/signInSpringTaskJDBC" method="post">
            <div class="card text-bg-light text-left mb-3">
                <div class="card-header">Login Page</div>
                <div class="card-body">
                    <div class="row g-3 align-items-center mb-2">
                        <div class="col-3">
                            <label for="email" class="form-label">Email</label>
                        </div>
                        <div class="col-9">
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center mb-2">
                        <div class="col-3">
                            <label for="inputPassword6" class="col-form-label">Password</label>
                        </div>
                        <div class="col-9">
                            <input type="password" id="inputPassword6" class="form-control" name="password">
                        </div>
                    </div>
                    <button class="btn btn-success">Login</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>

