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

DROP PROCEDURE IF EXISTS calculate_library_value;

CREATE PROCEDURE `calculate_library_value`(out totalValue decimal)
BEGIN

	-- Total Value of Library books
	select sum(price * total_quantity) into totalValue from books;
	
	/*
		Also get all the books.
	*/

	BEGIN 
		select * from books order by title;
	END;

END;