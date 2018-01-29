drop table if exists books;

drop table if exists transactions;

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


CREATE TABLE transactions (
  transaction_id int(11) NOT NULL AUTO_INCREMENT,
  book_id int(11) NOT NULL,
  checkout_time timestamp NOT NULL,
  checkin_time timestamp NULL,
  PRIMARY KEY (transaction_id),
  FOREIGN KEY (book_id) references books(book_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
