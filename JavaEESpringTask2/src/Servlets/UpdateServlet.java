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
import java.sql.Timestamp;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        if (request.getParameter("news_id") != null) {
            int news_id = Integer.parseInt(request.getParameter("news_id"));
            String title = request.getParameter("title");
            String short_content = request.getParameter("short_content");
            String content = request.getParameter("content");
            Timestamp post_date = Timestamp.valueOf(request.getParameter("post_date"));
            String picture_url = request.getParameter("picture_url");
            int newsPublicId = Integer.parseInt(request.getParameter("publication"));
            int newsLangId = Integer.parseInt(request.getParameter("language"));

            Languages lang = DBManager.getLanguage(newsLangId);
            Publications publicat = DBManager.getPublic(newsPublicId);
            News news = DBManager.getNewsById(news_id);

            if (news != null && lang != null && publicat != null) {
                news.setTitle(title);
                news.setShort_content(short_content);
                news.setContent(content);
                news.setPost_date(post_date);
                news.setPicture_url(picture_url);
                news.setLanguage(lang);
                news.setPublication(publicat);
                DBManager.updateNews(news);
                response.sendRedirect("/profile?newsChanged");
            } else
                response.sendRedirect("/profile?changeError");
        } else
            if (request.getParameter("public_id") != null) {
                int public_id = Integer.parseInt(request.getParameter("public_id"));
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                double rating = Double.parseDouble(request.getParameter("rating"));
                Publications publicat = DBManager.getPublic(public_id);
                if (publicat != null) {
                    publicat.setName(name);
                    publicat.setDescription(description);
                    publicat.setRating(rating);
                    DBManager.updatePublic(publicat);
                    response.sendRedirect("/profile?publicsChanged");
                } else
                    response.sendRedirect("/profile?changeError");
            } else
                if (request.getParameter("lang_id") != null) {
                    int lang_id = Integer.parseInt(request.getParameter("lang_id"));
                    String name = request.getParameter("name");
                    String code = request.getParameter("code");
                    Languages lang = DBManager.getLanguage(lang_id);
                    if (lang != null) {
                        lang.setName(name);
                        lang.setCode(code);
                        DBManager.updateLang(lang);
                        response.sendRedirect("/profile?langsChanged");
                    } else
                        response.sendRedirect("/profile?changeError");
                } else
                    response.sendRedirect("/profile");
    }
}
