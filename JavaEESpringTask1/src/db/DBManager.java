package db;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {

    private static Connection connection;
    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bootcamp.lesonEE",
                    "postgres", "postgres");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Items> getItems(){
        ArrayList<Items> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM table_products");
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()) {
                Items item = new Items();
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                items.add(item);
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
    public static Users getUser(String email, String password) {
        Users user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM table_users");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                user = new Users();
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));

                if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
                    break;
                } else user = null;
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static Users getUser(int id){
        Users user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT full_name FROM table_users WHERE id = ?");
            statement.setInt(1,id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()) {
                user = new Users();
                user.setFullName(resultSet.getString("full_name"));
            }
            statement.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
