package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/authenticationTrueSpringTaskJDBC")
public class AuthenticationTrueServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        Users user = DBManager.getUser(id);
        request.setAttribute("user",user);

        request.getRequestDispatcher("/authenticationTrueSpringTaskJDBC.jsp").
                forward(request,response);
    }
}
