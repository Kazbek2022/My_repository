package DB;

import java.security.PrivilegedAction;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;
    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
                    "postgres", "postgres");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<News> getNewsByLang(int langID) {
        ArrayList<News> news = new ArrayList<>();
        News eachNew = null;

        try {
            PreparedStatement statement = connection.
                    prepareStatement("SELECT tn.id, tn.title, tn.short_content, tn.content, tn.post_date, tn.picture_url, " +
                    "       tn.language_id,  tl.name AS l_name, tl.code, " +
                    "       tn.publication_id, tp.name AS p_name, tp.description, tp.rating " +
                    "FROM t_news tn " +
                    "INNER JOIN t_languages tl on tn.language_id = tl.id " +
                    "INNER JOIN t_publications tp on tn.publication_id = tp.id " +
                            "WHERE tn.language_id = ? ORDER BY tn.post_date DESC");
            statement.setInt(1,langID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                eachNew = new News();
                eachNew.setId(resultSet.getInt("id"));
                eachNew.setTitle(resultSet.getString("title"));
                eachNew.setPost_date(resultSet.getTimestamp("post_date"));
                eachNew.setShort_content(resultSet.getString("short_content"));
                eachNew.setContent(resultSet.getString("content"));
                eachNew.setPicture_url(resultSet.getString("picture_url"));

                Languages language = new Languages();
                language.setId(resultSet.getInt("language_id"));
                language.setCode(resultSet.getString("l_name"));
                language.setName(resultSet.getString("code"));
                eachNew.setLanguage(language);

                Publications publication = new Publications();
                publication.setId(resultSet.getInt("publication_id"));
                publication.setName(resultSet.getString("p_name"));
                publication.setDescription(resultSet.getString("description"));
                publication.setRating(resultSet.getDouble("rating"));
                eachNew.setPublication(publication);

                news.add(eachNew);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    public static ArrayList<News> getNewsByPublic(int publicId, int langID) {
        ArrayList<News> news = new ArrayList<>();
        News eachNew = null;

        try {
            PreparedStatement statement = connection.
                    prepareStatement("SELECT tn.id, tn.title, tn.short_content, tn.content, tn.post_date, tn.picture_url, " +
                            "       tn.language_id,  tl.name AS l_name, tl.code, " +
                            "       tn.publication_id, tp.name AS p_name, tp.description, tp.rating " +
                            "FROM t_news tn " +
                            "INNER JOIN t_languages tl on tn.language_id = tl.id " +
                            "INNER JOIN t_publications tp on tn.publication_id = tp.id " +
                            "WHERE tn.publication_id = ? AND tn.language_id = ? ORDER BY tn.post_date DESC");
            statement.setInt(1,publicId);
            statement.setInt(2,langID);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                eachNew = new News();
                eachNew.setId(resultSet.getInt("id"));
                eachNew.setTitle(resultSet.getString("title"));
                eachNew.setPost_date(resultSet.getTimestamp("post_date"));
                eachNew.setShort_content(resultSet.getString("short_content"));
                eachNew.setContent(resultSet.getString("content"));
                eachNew.setPicture_url(resultSet.getString("picture_url"));

                Languages language = new Languages();
                language.setId(resultSet.getInt("language_id"));
                language.setCode(resultSet.getString("l_name"));
                language.setName(resultSet.getString("code"));
                eachNew.setLanguage(language);

                Publications publication = new Publications();
                publication.setId(resultSet.getInt("publication_id"));
                publication.setName(resultSet.getString("p_name"));
                publication.setDescription(resultSet.getString("description"));
                publication.setRating(resultSet.getDouble("rating"));
                eachNew.setPublication(publication);

                news.add(eachNew);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    public static News getNewsById(int newsId) {
        ArrayList<News> news = new ArrayList<>();
        News eachNew = null;

        try {
            PreparedStatement statement = connection.
                    prepareStatement("SELECT tn.id, tn.title, tn.short_content, tn.content, tn.post_date, tn.picture_url, " +
                            "       tn.language_id,  tl.name AS l_name, tl.code, " +
                            "       tn.publication_id, tp.name AS p_name, tp.description, tp.rating " +
                            "FROM t_news tn " +
                            "INNER JOIN t_languages tl on tn.language_id = tl.id " +
                            "INNER JOIN t_publications tp on tn.publication_id = tp.id " +
                            "WHERE tn.id = ? ORDER BY tn.post_date DESC");
            statement.setInt(1,newsId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                eachNew = new News();
                eachNew.setId(resultSet.getInt("id"));
                eachNew.setTitle(resultSet.getString("title"));
                eachNew.setPost_date(resultSet.getTimestamp("post_date"));
                eachNew.setShort_content(resultSet.getString("short_content"));
                eachNew.setContent(resultSet.getString("content"));
                eachNew.setPicture_url(resultSet.getString("picture_url"));

                Languages language = new Languages();
                language.setId(resultSet.getInt("language_id"));
                language.setCode(resultSet.getString("l_name"));
                language.setName(resultSet.getString("code"));
                eachNew.setLanguage(language);

                Publications publication = new Publications();
                publication.setId(resultSet.getInt("publication_id"));
                publication.setName(resultSet.getString("p_name"));
                publication.setDescription(resultSet.getString("description"));
                publication.setRating(resultSet.getDouble("rating"));
                eachNew.setPublication(publication);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return eachNew;
    }

    public static ArrayList<Languages> getLanguages(){
        ArrayList<Languages> languages = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM t_languages");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Languages language = new Languages();
                language.setId(resultSet.getInt("id"));
                language.setName(resultSet.getString("name"));
                language.setCode(resultSet.getString("code"));
                languages.add(language);
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return languages;
    }

    public static ArrayList<Publications> getPublics() {
        ArrayList<Publications> publics = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM t_publications");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Publications publicat = new Publications();
                publicat.setId(resultSet.getInt("id"));
                publicat.setName(resultSet.getString("name"));
                publicat.setDescription(resultSet.getString("description"));
                publicat.setRating(resultSet.getDouble("rating"));
                publics.add(publicat);
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return publics;
    }

    public static Users getUser(String email) {
        Users user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM t_users WHERE email=?");
            statement.setString(1,email);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()) {
                user = new Users();
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFull_name(resultSet.getString("full_name"));
                user.setRole_id(resultSet.getInt("role_id"));
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static Languages getLanguage(int id){
        Languages lang = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM t_languages WHERE id = ?");
            statement.setInt(1,id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                lang = new Languages();
                lang.setId(resultSet.getInt("id"));
                lang.setName(resultSet.getString("name"));
                lang.setCode(resultSet.getString("code"));
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return lang;
    }

    public static Publications getPublic(int id) {
        Publications publicat = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM t_publications WHERE id = ?");
            statement.setInt(1,id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                publicat = new Publications();
                publicat.setId(resultSet.getInt("id"));
                publicat.setName(resultSet.getString("name"));
                publicat.setDescription(resultSet.getString("description"));
                publicat.setRating(resultSet.getDouble("rating"));
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return publicat;
    }

    public static void updateNews(News news) {
        try {
            PreparedStatement statement = connection.prepareStatement
                    ("UPDATE t_news SET title = ?, short_content = ?, content = ?, post_date = ?, picture_url = ?, " +
                            "language_id = ?, publication_id = ? WHERE id = ?");
            statement.setString(1,news.getTitle());
            statement.setString(2,news.getShort_content());
            statement.setString(3, news.getContent());
            statement.setTimestamp(4,news.getPost_date());
            statement.setString(5,news.getPicture_url());
            statement.setInt(6,news.getLanguage().getId());
            statement.setInt(7,news.getPublication().getId());
            statement.setInt(8,news.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updatePublic(Publications publicat) {
        try {
            PreparedStatement statement = connection.prepareStatement
                    ("UPDATE t_publications SET name = ?, description = ?, rating = ? WHERE id = ?");
            statement.setString(1,publicat.getName());
            statement.setString(2,publicat.getDescription());
            statement.setDouble(3,publicat.getRating());
            statement.setInt(4,publicat.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updateLang(Languages lang) {
        try {
            PreparedStatement statement = connection.prepareStatement
                    ("UPDATE t_languages SET name = ?, code = ? WHERE id = ?");
            statement.setString(1,lang.getName());
            statement.setString(2,lang.getCode());
            statement.setInt(3,lang.getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteNews(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM t_news WHERE id = ?");
            statement.setInt(1,id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deletePublic(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM t_publications WHERE id = ?");
            statement.setInt(1,id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteLanguage(int id) {
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM t_languages WHERE id = ?");
            statement.setInt(1,id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addNews(News news) {
        try {
            PreparedStatement statement = connection.prepareStatement
                    ("INSERT INTO t_news (title,short_content,content,picture_url,language_id,publication_id) " +
                            "VALUES (?,?,?,?,?,?)");
            statement.setString(1,news.getTitle());
            statement.setString(2,news.getShort_content());
            statement.setString(3, news.getContent());
            statement.setString(4,news.getPicture_url());
            statement.setInt(5,news.getLanguage().getId());
            statement.setInt(6,news.getPublication().getId());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addPublic(Publications publicat) {
        try {
            PreparedStatement statement = connection.prepareStatement
                    ("INSERT INTO t_publications (name,description,rating) VALUES (?,?,?)");
            statement.setString(1,publicat.getName());
            statement.setString(2,publicat.getDescription());
            statement.setDouble(3,publicat.getRating());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addLang(Languages lang) {
        try {
            PreparedStatement statement = connection.prepareStatement
                    ("INSERT INTO t_languages (name,code) VALUES (?,?)");
            statement.setString(1,lang.getName());
            statement.setString(2,lang.getCode());
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
