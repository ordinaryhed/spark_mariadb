package se.hed.testing;

import java.sql.*;

public class ExampleAction {
    public static String getDbData(String id) {
        Connection conn = null;
        Statement stmt = null;
        String name = "N/A";
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test?user=root&password=");
            stmt = conn.createStatement();
            String sql = "SELECT name FROM mytable WHERE id = " + id + ";";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                name = rs.getString("name");
            }
            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    conn.close();
                }
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        return name;
    }//end main
}