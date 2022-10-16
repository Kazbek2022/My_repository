<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  int langId = 1;
  Cookie [] cookies = request.getCookies();
  if(cookies != null) {
    Optional<Cookie> opt = Arrays.stream(cookies).filter(c -> c.getName().equals("language_id")).findFirst();
    if (opt.isPresent())
      langId = Integer.parseInt(opt.get().getValue());
  }

  Users currentUser = (Users) session.getAttribute("currentUser");
%>
<div class="container">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 opacity-75">
  <div class="container">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Переключатель навигации">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <span class="navbar-text me-auto my-auto fw-bold">
        <%=LanguageChange.getTranslation(langId,"navbar_text")%>
      </span>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/homepage"><%=currentUser.getFull_name()+"/"+LanguageChange.getTranslation(langId,"return")%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/login?logout"><%=LanguageChange.getTranslation(langId,"navbar_signOut")%></a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</div>

