DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;

CREATE TABLE book
(
	book_id int PRIMARY KEY,
	title text NOT NULL,
	isbn text NOT NULL
);

CREATE TABLE author
(
	author_id int PRIMARY KEY,
	full_name text NOT NULL,
	rating real
);

CREATE TABLE book_author
(
	book_id int REFERENCES book(book_id),
	author_id int REFERENCES author(author_id),
	
	CONSTRAINT book_author_pkey PRIMARY KEY (book_id, author_id) -- composite key
	
);

INSERT INTO book
VALUES
(1, 'Book #1', '123456'),
(2, 'Book #2', '789123'),
(3, 'Book #3', '789456'),
(4, 'Book #4', '123554');


INSERT INTO author
VALUES
(1, 'Bob', 4.5),
(2, 'Alice', 4.0),
(3, 'John', 4.7);

INSERT INTO book_author
VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3);




