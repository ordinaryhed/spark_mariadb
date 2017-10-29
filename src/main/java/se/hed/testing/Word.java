package se.hed.testing;

import java.util.Date;

public class Word {
    int word_id;
    String word_name;
    String word_desc;
    String word_exam;
    //        List<String> wordTags;
    String user_alias;
    String user_email;
    String user_city;
    Date word_created;


    public String getWord_name() {
        return word_name;
    }

    public void setWord_name(String word_name) {
        this.word_name = word_name;
    }


    public int getWord_id() {
        return word_id;
    }

    public void setWord_id(int word_id) {
        this.word_id = word_id;
    }

    public String getWord_desc() {
        return word_desc;
    }

    public void setWord_desc(String word_desc) {
        this.word_desc = word_desc;
    }

    public String getWord_exam() {
        return word_exam;
    }

    public void setWord_exam(String word_exam) {
        this.word_exam = word_exam;
    }

    public String getUser_alias() {
        return user_alias;
    }

    public void setUser_alias(String user_alias) {
        this.user_alias = user_alias;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_city() {
        return user_city;
    }

    public void setUser_city(String user_city) {
        this.user_city = user_city;
    }

    public Date getWord_created() {
        return word_created;
    }

    public void setWord_created(Date word_created) {
        this.word_created = word_created;
    }
}
