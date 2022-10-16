package Servlets;

import DB.DBManager;
import DB.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("logout") != null) {                 // this if use instead individual LogoutServlet
            request.getSession().removeAttribute("currentUser");
            response.sendRedirect("/login");
        } else
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Users user = DBManager.getUser(email);
        if (user != null && user.getPassword().equals(password)) {
            request.getSession().setAttribute("currentUser",user);
            response.sendRedirect("/profile");
        } else response.sendRedirect("/login?error");

    }
}
