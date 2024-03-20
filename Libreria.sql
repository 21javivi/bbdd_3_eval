DROP SCHEMA IF EXISTS libreria;
CREATE SCHEMA IF  NOT EXISTS libreria;
USE libreria;

CREATE TABLE IF NOT EXISTS autor(
  aut_id varchar(6) NOT NULL,
  aut_name varchar(30) NOT NULL UNIQUE,
  country enum ('UK','Canada', 'India', 'Germany', 'USA', 'Brazil', 'Australia') NOT NULL,
  home_city varchar(20),
  PRIMARY KEY(aut_id)  
)Engine= InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS publicacion(
  pub_id varchar(4) NOT NULL UNIQUE,
  pub_name varchar(35) NOT NULL UNIQUE,
  pub_city enum ('New York','Mumbai','Adelaide','London','Houstan','Cambridge','New Delhi'),
  country enum('UK','Canada', 'India', 'Germany', 'USA', 'Brazil', 'Australia') NOT NULL,
  country_office varchar(15) NOT NULL,
  no_of_branch int(2) UNSIGNED NOT NULL,
  estd date NOT NULL,
  PRIMARY KEY(pub_id)
)Engine = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS libro(
  book_id varchar(5) NOT NULL UNIQUE,
  book_name varchar(50) NOT NULL,
  isbn_no int(10) NOT NULL UNIQUE,
  cate_id varchar(5) NOT NULL,
  aut_id varchar(6) NOT NULL,
  pub_id varchar(4) NOT NULL,
  dt_of_pub date NOT NULL,
  pub_lang enum ('English', 'Hindi', 'German','French', ''),
  no_page int(4) UNSIGNED NOT NULL,
  book_price DECIMAL(5,2),
  PRIMARY KEY(book_id),
  CONSTRAINT fk_autor FOREIGN KEY(aut_id) REFERENCES autor(aut_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_publicacion FOREIGN KEY(pub_id) REFERENCES publicacion(pub_id)  ON UPDATE CASCADE
)Engine= InnoDB DEFAULT CHARSET =utf8mb4;

CREATE TABLE IF NOT EXISTS categoria(
	cate_id VARCHAR(5) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(cate_id)
);

ALTER TABLE libro ADD CONSTRAINT fk_categoria FOREIGN KEY(cate_id) REFERENCES categoria(cate_id) ON DELETE NO ACTION ON UPDATE CASCADE;


-- RESTRICCIONES
ALTER TABLE libro ADD CONSTRAINT fk_precio CHECK(book_price>0);
ALTER TABLE libro ADD CONSTRAINT fk_nPaginas CHECK (no_page BETWEEN 30 AND 1000);
ALTER TABLE libro ADD CONSTRAINT fk_fechaPub CHECK (dt_of_pub BETWEEN '2000-01-01' AND '2010-12-31');