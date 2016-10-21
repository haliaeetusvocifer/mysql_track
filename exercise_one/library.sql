

  CREATE DATABASE library;

  USE library;

  CREATE TABLE titles (
      title VARCHAR(100) NOT NULL, 
      author VARCHAR(100) NOT NULL, 
      publisher VARCHAR(100) NOT NULL
    );

  CREATE TABLE branch (
      bCode VARCHAR(10) NOT NULL,
      librarian VARCHAR(100) NOT NULL,
      address VARCHAR(100) NOT NULL
    );

  CREATE TABLE holdings (
      branch VARCHAR(10) NOT NULL,
      title VARCHAR(100) NOT NULL,
      copies INT UNSIGNED
    );

  INSERT INTO titles (title,author, publisher) VALUES
    ('Susannah', 'Ann Brown', 'Macmillan'),
    ('How to Fish', 'Amy Fly', 'Stop Press'),
    ('A History of Dublin', 'David Little', 'Wiley'),
    ('Computers', 'Blaise Pascal', 'Applewoods'),
    ('The Wife', 'Ann Brown', 'Macmillan');


  INSERT INTO branch (bcode,librarian, address) VALUES
    ('B1', 'John Smith', '2 Anglessa Rd'),
    ('B2', 'Mary Jones', '34 Pearse St'),
    ('B3', 'Francis Owens', 'Grange X');


  INSERT INTO holdings (branch, title, copies) VALUES
    ('B1', 'Susannah', 3),
    ('B1', 'How to Fish', 2),
    ('B1', 'A History of Dublin', 1),
    ('B2', 'How to Fish', 4),
    ('B2', 'Computers', 4),
    ('B2', 'The Wife', 3),
    ('B3', 'A History of Dublin', 1),
    ('B3', 'Computers', 4),
    ('B3', 'Susannah', 3),
    ('B3', 'The Wife', 1);


/*
the names of all library books published by Macmillan
*/


  SELECT DISTINCT title 
  FROM titles 
  WHERE titles.publisher='Macmillan';



/*
  branches that hold any books by Ann Brown (using a nested subquery).
*/

  
  SELECT branch 
  FROM holdings 
  WHERE title IN (
    SELECT title 
    FROM titles 
    WHERE author = 'Ann Brown'
    );



/*
  branches that hold any books by Ann Brown (without using a nested subquery).
*/

  SELECT branch 
  FROM holdings,titles 
  WHERE holdings.title=titles.title 
  AND titles.author='Ann Brown';




/*
  the total number of books held at each branch.
*/

  
  SELECT branch, COUNT(*) 
  FROM holdings 
  GROUP BY branch;
