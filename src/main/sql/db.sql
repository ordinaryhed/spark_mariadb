
CREATE TABLE WORD (
   word_id INT NOT NULL AUTO_INCREMENT,
   word_name VARCHAR(100) NOT NULL,
   word_desc VARCHAR(100) NOT NULL,
   word_exam VARCHAR(100) NOT NULL,
   user_alias VARCHAR(50),
   user_email VARCHAR(50),
   user_city VARCHAR(50),
   word_created timestamp,
   PRIMARY KEY ( word_id )
);


INSERT INTO WORD(word_name, word_desc, word_exam, user_alias, user_email, user_city)
VALUES
('word3', 'word desc3...', 'word example3...', 'alias3', 'email@email.com3', 'user city3'),
('word4', 'word desc4...', 'word example4...', 'alias4', 'email@email.com4', 'user city4')
;