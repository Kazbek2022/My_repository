package Servlets;

import DB.DBManager;
import DB.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int news_id = Integer.parseInt(request.getParameter("news_id"));
        News newsById = DBManager.getNewsById(news_id);
        request.setAttribute("newsById", newsById);
        request.getRequestDispatcher("/homepage.jsp").forward(request,response);
    }
}
