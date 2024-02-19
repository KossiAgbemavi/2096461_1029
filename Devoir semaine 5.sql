-- base de donnees a utiliser a demander au prof--
DROP DATABASE library;
    CREATE DATABASE library2;
    USE library2;



CREATE TABLE Authors (
  au_id TINYINT NOT NULL AUTO_INCREMENT,
  au_lname VARCHAR(50) NOT NULL,
  au_fname VARCHAR(50) NOT NULL,
  phone VARCHAR(20) UNIQUE NOT NULL CHECK (phone REGEXP '^\\+([0-9]{10,15})$'),
  address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL CHECK (email REGEXP '^.+@.+\\..+$'),
  PRIMARY KEY (au_id)
);

CREATE TABLE Publishers (
  pub_id TINYINT NOT NULL AUTO_INCREMENT,
  pub_name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  PRIMARY KEY (pub_id)
);

CREATE TABLE Employees (
  emp_id TINYINT NOT NULL AUTO_INCREMENT,
  emp_name VARCHAR(50) NOT NULL,
  salary SMALLINT NOT NULL,
  job_id TINYINT NOT NULL,
  pub_id TINYINT,
  fname VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL CHECK (email REGEXP '^.+@.+\\..+$'),
  PRIMARY KEY (emp_id),
  FOREIGN KEY (job_id) REFERENCES Jobs (job_id),
  FOREIGN KEY (pub_id) REFERENCES Publishers (pub_id)
);

CREATE TABLE Jobs (
  job_id TINYINT NOT NULL AUTO_INCREMENT,
  job_desc VARCHAR(50) NOT NULL,
  min_lvl ENUM('Stagiaire', 'Junior', 'Intermediaire', 'Senior') NOT NULL,
  max_lvl ENUM('Stagiaire', 'Junior', 'Intermediaire', 'Senior') NOT NULL,
  PRIMARY KEY (job_id)
);

CREATE TABLE Redactions (
  au_id TINYINT NOT NULL,
  title_id TINYINT NOT NULL,
  au_ord TINYINT NOT NULL,
  royalty FLOAT NOT NULL,
  PRIMARY KEY (au_id, title_id),
  FOREIGN KEY (au_id) REFERENCES Authors (au_id),
  FOREIGN KEY (title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Titles (
  title_id TINYINT NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  type ENUM('Roman', 'Politique', 'Science', 'Histoire') NOT NULL,
  pub_id SMALLINT NOT NULL,
  price FLOAT NOT NULL,
  advance FLOAT NOT NULL,
  notes VARCHAR(255) NOT NULL,
  pub_date DATE NOT NULL,
  PRIMARY KEY (title_id),
  FOREIGN KEY (pub_id) REFERENCES Publishers (pub_id)
);

CREATE TABLE Sales (
  store_id TINYINT NOT NULL,
  ord_num TINYINT NOT NULL,
  title_id SMALLINT NOT NULL,
  ord_date DATETIME NOT NULL,
  qty INT NOT NULL,
  PRIMARY KEY (store_id, ord_num),
  FOREIGN KEY (title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Stores (
  stor_id TINYINT NOT NULL AUTO_INCREMENT,
  stor_name VARCHAR(50) NOT NULL,
  stor_address VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  PRIMARY KEY (stor_id)
);
