package se.hed.testing;

import com.google.gson.Gson;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import static org.junit.Assert.*;


public class The_TestTest {

    public void test() {
         The_Test a = new The_Test();
         assertEquals(42,a.get());
    }


    @Test
    public void test2() {
        SlangopediaService s = new SlangopediaService();
        List<Word> w = s.getWords("word2");
        assertTrue(w != null);
        assertEquals(1,w.size());
        assertEquals("word2",w.iterator().next().word_name);
    }

    @Test
    public void test3() {
        SlangopediaService s = new SlangopediaService();
        List<Word> w = s.getWords("word3");
        assertTrue(w != null);
        assertEquals(2,w.size());
        assertEquals("word3",w.iterator().next().word_name);
    }


    @Test
    public void test4() {
        SlangopediaService s = new SlangopediaService();
        List<Word> ws = s.getWords("word3");
        Gson gs = new Gson();
        System.out.println(gs.toJson(ws));
        assertTrue(gs.toJson(ws).contains("word"));
    }


    @Test
    public void t3() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test?user=root&password=");
            QueryRunner run = new QueryRunner();
            ResultSetHandler<Word> h = new BeanHandler<Word>(Word.class);
            Word word = run.query(conn, "SELECT * FROM WORD where word_id=?", h, 2);
            assertTrue(word != null);
            System.out.println("name:" + word.word_name);
            assertEquals("word2", word.word_name);
        }
        catch (Exception e) {
            fail();
        }
    }

}