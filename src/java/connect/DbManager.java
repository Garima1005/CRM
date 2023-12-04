package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbManager {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public DbManager() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb?characterEncoding=utf-8", "root", "password");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean insertUpdateDelete(String query) {
        try {
            ps = con.prepareStatement(query);
            int n=ps.executeUpdate();
            if(n>0){
                return true;
            }
            return false;
        } catch (SQLException e) {
            return false;
        }
    }

    public ResultSet select(String query) {
        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}
