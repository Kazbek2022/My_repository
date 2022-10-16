package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/langChange")
public class LanguageChangeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idString = request.getParameter("language_id");
        if(idString != null) {
            Cookie cookie = new Cookie("language_id",idString);
            cookie.setMaxAge(3600*24*7);
            response.addCookie(cookie);
        }

        response.sendRedirect("/homepage");
    }
}
