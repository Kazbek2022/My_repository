<%@ page import="java.util.Optional" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  int langId = 1; //this code in jsp to avoid repeat in Home and Detail Servlet for pass langId
  Cookie [] cookies = request.getCookies();
  if(cookies != null) {
    Optional<Cookie> opt = Arrays.stream(cookies).filter(c -> c.getName().equals("language_id")).findFirst();
    if (opt.isPresent())
      langId = Integer.parseInt(opt.get().getValue());
  }
  Users currentUser = (Users) session.getAttribute("currentUser");

%>
<nav class="navbar navbar-expand-lg bg-0">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Переключатель навигации">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto my-auto mb-lg-0">
        <%
          ArrayList<Languages> languages = DBManager.getLanguages();
          for(Languages l: languages) {
        %>
        <li class="nav-item">
            <a class="nav-link" href="/langChange?language_id=<%=l.getId()%>"><%=l.getCode()%></a>
        </li>
        <%
          }
        %>
      </ul>
      <span class="navbar-text mx-auto my-auto fw-bold">
        <%=LanguageChange.getTranslation(langId,"navbar_text")%>
      </span>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <%
          if(currentUser != null) {
        %>
        <li class="nav-item">
          <a class="nav-link" href="/profile"><%=currentUser.getFull_name()%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/login?logout"><%=LanguageChange.getTranslation(langId,"navbar_signOut")%></a>
        </li>
        <%
          } else {
        %>
        <li class="nav-item">
          <a class="nav-link" href="/login"><%=LanguageChange.getTranslation(langId,"navbar_sign")%></a>
        </li>
        <%
          }
        %>
      </ul>
    </div>
  </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 opacity-75">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto my-auto mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active"  href="/homepage">
            <strong><%=LanguageChange.getTranslation(langId,"navbar_allnews")%></strong>
          </a>
        </li>
        <%
          ArrayList<Publications> publics = DBManager.getPublics();
          for (Publications p:publics)
            {
          %>
          <li class="nav-item">
            <a class="nav-link active"  href="/homepage?publicId=<%=p.getId()%>"><strong><%=p.getName()%></strong></a>
          </li>
          <%
            }
          %>
      </ul>
    </div>
  </div>
</nav>
