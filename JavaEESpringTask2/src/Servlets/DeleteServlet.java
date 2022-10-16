package Servlets;

import DB.DBManager;
import DB.Languages;
import DB.News;
import DB.Publications;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("news_id") != null) {
            int news_id = Integer.parseInt(request.getParameter("news_id"));
            News news = DBManager.getNewsById(news_id);
            if (news != null) {
                DBManager.deleteNews(news_id);
                response.sendRedirect("/profile?newsChanged");
            } else
                response.sendRedirect("/profile?changeError");
        } else
            if (request.getParameter("public_id") != null) {
                int public_id = Integer.parseInt(request.getParameter("public_id"));
                Publications publicat = DBManager.getPublic(public_id);
                if (publicat != null) {
                    DBManager.deletePublic(public_id);
                    response.sendRedirect("/profile?publicsChanged");
                } else
                    response.sendRedirect("/profile?changeError");
            } else
                if (request.getParameter("lang_id") != null) {
                    int lang_id = Integer.parseInt(request.getParameter("lang_id"));
                    Languages lang = DBManager.getLanguage(lang_id);
                    if (lang != null) {
                        DBManager.deleteLanguage(lang_id);
                        response.sendRedirect("/profile?langsChanged");
                    } else
                        response.sendRedirect("/profile?changeError");
                } else
                    response.sendRedirect("/profile");
    }
}
