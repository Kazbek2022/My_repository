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

@WebServlet(value = "/add")
public class addServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("title") != null) {      //check what object to add
            String title = request.getParameter("title");
            String picture_url = request.getParameter("picture_url");
            int language_id = Integer.parseInt(request.getParameter("language_id"));
            Languages news_lang = DBManager.getLanguage(language_id);
            int publication_id = Integer.parseInt(request.getParameter("publication_id"));
            Publications news_public = DBManager.getPublic(publication_id);
            String short_content = request.getParameter("short_content");
            String content = request.getParameter("content");

            News news = new News();  //I'm do not check object for Null because one of his param.(title) is not Null?!
            news.setTitle(title);
            news.setPicture_url(picture_url);
            news.setLanguage(news_lang);
            news.setPublication(news_public);
            news.setShort_content(short_content);
            news.setContent(content);
            DBManager.addNews(news);
            response.sendRedirect("/profile?newsChanged");
        } else
            if (request.getParameter("public_name") != null) {
                String public_name = request.getParameter("public_name");
                String description = request.getParameter("description");
                double rating = Double.parseDouble(request.getParameter("rating"));

                Publications publicat = new Publications();
                publicat.setName(public_name);
                publicat.setDescription(description);
                publicat.setRating(rating);
                DBManager.addPublic(publicat);
                response.sendRedirect("/profile?publicsChanged");
            } else
                if (request.getParameter("lang_name") != null) {
                    String lang_name = request.getParameter("lang_name");
                    String code = request.getParameter("code");
                    Languages lang = new Languages();
                    lang.setName(lang_name);
                    lang.setCode(code);
                    DBManager.addLang(lang);
                    response.sendRedirect("/profile?langsChanged");
                }
                else
                    response.sendRedirect("/profile?changeError");
    }
}
