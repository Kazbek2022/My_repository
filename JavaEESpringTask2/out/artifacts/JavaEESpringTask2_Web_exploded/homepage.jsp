<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.News" %>
<%@ page import="DB.Languages" %>
<%@ page import="DB.LanguageChange" %>
<%@ page import="DB.Publications" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>

<body>
<%@include file="navbar.jsp"%>
<%
    ArrayList<News> news = DBManager.getNewsByLang(langId); //this code in jsp to avoid repeat in Home and Detail Servlet for pass langId
    if (request.getParameter("publicId") != null) {
    int publicId = Integer.parseInt(request.getParameter("publicId"));
    news = DBManager.getNewsByPublic(publicId,langId);
    }
%>
<div class="container" style="min-height: 600px">
    <%
        News newsById = (News) request.getAttribute("newsById"); //check for review: details or homepage
        if (newsById == null) {
    %>
    <div class="row">
        <div class="col-12">
            <div class="alert alert-secondary" role="alert">
                <h1><%=LanguageChange.getTranslation(langId,"body_text1")%></h1>
                <%=LanguageChange.getTranslation(langId,"body_text2")%>
            </div>
        </div>
    </div>
    <div class="row">
        <%
//            ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
            if(news != null)
            {
            for(News n: news)
                {
        %>
        <div class="col-6">
            <div class="card mb-3" style= "height : 40rem;">
                <img src="<%=n.getPicture_url()%>" class="card-img-top" style= "height : 20rem;">
                <div class="card-body">
                    <h6 class="card-title fw-bold text-success"><%=n.getPublication().getName()%></h6>
                    <h5 class="card-title"><%=n.getTitle()%></h5>
                    <h6 class="card-subtitle mb-2 text-muted">
                        <%
                            String time_date = new SimpleDateFormat("dd/MM/yyyy, HH:mm").format(n.getPost_date());
                            out.print(time_date);
                        %>
                    </h6>
                    <p class="card-text"><%=n.getShort_content()%></p>
                </div>
                <div class="card-body">
                    <a href="/details?news_id=<%=n.getId()%>" class="card-link fw-bold">Details</a>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
    <%
        }else{                                                 //check for review: details or homepage
    %>
    <div class="row">
        <div class="col-9">
            <div class="card mb-3 border-0" style= "height : auto;">
                <h4 class="card-title fw-bold"><%=newsById.getTitle()%></h4>
                <h6 class="card-subtitle mb-3 text-muted border-bottom">
                    <%
                        String time_date = new SimpleDateFormat("dd/MM/yyyy, HH:mm").format(newsById.getPost_date());
                        out.print(time_date);
                    %>
                    <%=newsById.getPublication().getName()%></h6>
                <img src="<%=newsById.getPicture_url()%>" class="card-img-top" style= "height : 30rem;">
                <div class="card-body">
                    <h5 class="card-title fw-bold"><%=newsById.getShort_content()%></h5>
                    <p class="card-text"><%=newsById.getContent()%></p>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="alert alert-secondary" role="alert" style="height: auto">
                <h5><i>About <%=newsById.getPublication().getName()%></i></h5>
                <%=newsById.getPublication().getDescription()%><br><br>
                <h6>Rating <%=newsById.getPublication().getRating()%></h6>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>
<%@include file="footer.jsp"%>
</body>
</html>