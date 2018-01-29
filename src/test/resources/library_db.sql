drop table if exists books;

CREATE TABLE books (
  book_id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(45) NOT NULL,
  description varchar(45) NOT NULL,
  price decimal(10,0) NOT NULL,
  total_quantity int(11) NOT NULL,
  available_quantity int(11) NOT NULL,
  create_timestamp timestamp NULL DEFAULT NULL,
  PRIMARY KEY (book_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

