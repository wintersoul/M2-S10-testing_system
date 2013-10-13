CREATE TABLE IF NOT EXISTS Users(

 id_user INTEGER NOT NULL AUTO_INCREMENT,
 login CHAR (30) NOT NULL,
 passwords CHAR (30) NOT NULL,
 registration_date DATE NOT NULL,
 UNIQUE (login),
 PRIMARY KEY (id_user)
 )ENGINE=INNODB;

 

CREATE TABLE IF NOT EXISTS Categories(
 
 id_category INTEGER NOT NULL AUTO_INCREMENT,
 categoty CHAR (50) NOT NULL,
 PRIMARY KEY (id_category)
)ENGINE=INNODB;



CREATE TABLE IF NOT EXISTS Themes(

 id_theme INTEGER NOT NULL,
 id_category INTEGER NOT NULL,
 theme CHAR (50) NOT NULL,
 PRIMARY KEY (id_theme),
 FOREIGN KEY (id_category) REFERENCES Categories(id_category)
)ENGINE=INNODB;

  

CREATE TABLE IF NOT EXISTS Test(

 id_test INTEGER NOT NULL AUTO_INCREMENT,
 id_user INTEGER NOT NULL,
 id_category INTEGER NOT NULL,
 id_theme INTEGER NOT NULL,
 test_name CHAR (50) NOT NULL,
 PRIMARY KEY (id_test),
 FOREIGN KEY (id_user) REFERENCES Users(id_user),
 FOREIGN KEY (id_category) REFERENCES Categories(id_category),
 FOREIGN KEY (id_theme) REFERENCES Themes(id_theme)
)ENGINE=INNODB;

  

CREATE TABLE IF NOT EXISTS Questions(

 id_question INTEGER NOT NULL AUTO_INCREMENT,
 id_category INTEGER NOT NULL,
 id_theme INTEGER NOT NULL,
 id_test INTEGER NOT NULL,
 question CHAR (100) NOT NULL,
 PRIMARY KEY (id_question),
 FOREIGN KEY (id_category) REFERENCES Categories(id_category),
 FOREIGN KEY (id_theme) REFERENCES Themes(id_theme),
 FOREIGN KEY (id_test) REFERENCES Test(id_test)
)ENGINE=INNODB;



CREATE TABLE IF NOT EXISTS Answer(

 id_answer INTEGER NOT NULL AUTO_INCREMENT,
 id_question INTEGER NOT NULL,
 answer CHAR (50) NOT NULL,
 correct BOOL NOT NULL,
 PRIMARY KEY (id_answer),
 FOREIGN KEY (id_question) REFERENCES Questions(id_question)
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS ProceccingTest(

 id_user INTEGER NOT NULL,
 id_test INTEGER NOT NULL,
 date_of_proceccing DATE NOT NULL,
 timer TIME NOT NULL,
 rating INTEGER,
 PRIMARY KEY (id_user, id_test, date_of_proceccing),
 FOREIGN KEY (id_user) REFERENCES Users(id_user),
 FOREIGN KEY (id_test) REFERENCES Test(id_test)
)ENGINE=INNODB;



