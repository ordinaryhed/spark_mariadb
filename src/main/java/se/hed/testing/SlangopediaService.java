package se.hed.testing;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.*;
import java.util.List;

public class SlangopediaService {
    private static final String DRIVER = "org.mariadb.jdbc.Driver";
    private static final String CONNECTION_URL = "jdbc:mariadb://localhost:3306/test?user=root&password=";

    private static Connection getConnection() throws SQLException {

        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(CONNECTION_URL);
        }
        catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void addWord(Word word) {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = getConnection();
            ResultSetHandler<Word> h = new BeanHandler<Word>(Word.class);
            String INSERT = "INSERT INTO WORD (word_name, word_desc, word_exam, user_alias, user_email, user_city) VALUES (?,?,?,?,?,?)";
            new QueryRunner().insert(conn, INSERT,h, word.word_name, word.word_desc, word.word_exam, word.user_alias, word.user_email, word.user_city);

        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            try { if (stmt != null) { conn.close();} } catch (SQLException se) { }
            try { if (conn != null) { conn.close();} } catch (SQLException se) { se.printStackTrace(); }
        }
    }

    public static Word getWord(int id) {

        Connection conn = null;
        Statement stmt = null;

        Word word = null;
        try {
            conn = getConnection();
            ResultSetHandler<Word> h = new BeanHandler<Word>(Word.class);
            word = new QueryRunner().query(conn, "SELECT * FROM WORD where word_id=?",h, id);

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

        return word;
    }

    public static List<Word> getWords(String word) {

        Connection conn = null;
        Statement stmt = null;
        String error = "";
        Exception ex = null;
        List<Word> words = null;
        try {
            conn = getConnection();
            ResultSetHandler<List<Word>> h = new BeanListHandler<Word>(Word.class);
            words = new QueryRunner().query(conn, "SELECT * FROM WORD where word_name=?",h, word);

        } catch (SQLException se) {
            //Handle errors for JDBC
            error = se.getMessage();
            ex = se;
        } catch (Exception e) {
            //Handle errors for Class.forName
            error = e.getMessage();
            ex = e;
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
                error = se.getMessage();
                ex = se;
            }//end finally try
        }//end try

        if (error.length()>0) {
            throw new RuntimeException(error, ex);
        }
        return words;
    }

}


