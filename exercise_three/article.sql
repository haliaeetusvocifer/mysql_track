
  CREATE DATABASE article;

  USE article;


/*
Manage categories, articles, comments, and users
*/


    CREATE TABLE users( 
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(100) NOT NULL,
      type_user ENUM ('admin', 'normal') DEFAULT 'admin'
    );

    CREATE TABLE categories(
      id INT AUTO_INCREMENT PRIMARY KEY,
      category VARCHAR(100) NOT NULL
    );

    CREATE TABLE articles( 
      id INT AUTO_INCREMENT PRIMARY KEY,
      user_id INT NOT NULL,
      category_id INT NOT NULL,
      article VARCHAR(300) NOT NULL
    );


    CREATE TABLE comments( 
      id INT AUTO_INCREMENT PRIMARY KEY,
      user_id INT NOT NULL,
      article_id INT NOT NULL,
      comment VARCHAR(500) NOT NULL,
      INDEX (user_id)
    );

    INSERT INTO users (name, type_user) VALUES
    ('Tunde', 'admin'),
    ('Brown', 'normal'),
    ('Jones', 'admin'),
    ('Segun', 'normal'),
    ('Obi', 'admin'),
    ('user3', 'normal'),
    ('user2', 'normal');

    INSERT INTO categories (category) VALUES
    ('Politics'),
    ('Family'),
    ('Sports'),
    ('Health');


    INSERT INTO articles (user_id, category_id, article) VALUES
    (1, 2, 'Who moved my Cheese'),
    (4, 2, 'BBOG'),
    (3, 3, 'Nigeria Sport'),
    (3, 3, 'EPL week 7 Report'),
    (2, 2, 'Family Wealth'),
    (6, 4, 'Disease: Ebola');


    INSERT INTO comments (user_id, article_id, comment) VALUES
    (3, 1, 'i laugh ooo'),
    (4, 1, 'I don"t buy the idea'),
    (7, 5, 'great Initiative, I will apply to my family'),
    (4, 5, 'It can"t work in my family'),
    (4, 3, 'remove the minister');


/*
Select all articles whose author's name is user3 (Do this exercise using variable
also).
*/

  SELECT article FROM articles 
  JOIN users 
  ON users.id = articles.user_id 
  WHERE users.name = 'user3';


/*Using Sub query*/
  SELECT @art:= article FROM articles 
  JOIN users 
  ON users.id = articles.user_id 
  WHERE users.name = 'user3';


/*
For all the articles being selected above, select all the articles and also the comments
associated with those articles in a single query (Do this using subquery also)
*/

  SELECT article, name, comment    
  FROM articles    
  INNER JOIN users       
  ON users.id = articles.user_id 
  INNER JOIN  comments    
  ON comments.article_id = articles.id   
  WHERE users.name = 'user3';
  

  SELECT comment, articles   
  FROM comments,(     
    SELECT article, id      
    FROM articles      
    WHERE user_id = (         
      SELECT id          
      FROM users          
      WHERE name="user3"     
      )   
    ) AS artic   
  WHERE artic.id = comments.article_id;


/*
Write a query to select all articles which do not have any comments (Do using subquery
also)
*/

  SELECT article, comment   
  FROM articles   
  LEFT JOIN comments 
  ON articles.id = comments.article_id   
  WHERE comments.id IS NULL;


  SELECT article
  FROM articles 
  WHERE id NOT IN (
    SELECT article_id 
    FROM comments
  );


/*
Write a query to select article which has maximum comments.
*/

  SELECT artic.*, COUNT(com.id) AS comm_count 
  FROM articles AS artic 
  JOIN comments AS com 
  ON artic.id = com.article_id 
  GROUP BY artic.id
  HAVING comm_count = (
    SELECT MAX(maxi.comm_count) 
    FROM (
        SELECT artic.*, COUNT(com.id) AS comm_count 
        FROM articles AS artic 
        JOIN comments AS com 
        ON artic.id = com.article_id 
        GROUP BY artic.id    
    ) AS maxi
  );


/*
Write a query to select article which does not have more than one comment by the
same user ( do this using left join and group by )
*/


  SELECT artic.*, COUNT(com.id) AS comm_count 
  FROM articles AS artic 
  LEFT JOIN comments AS com 
  ON artic.id = com.article_id 
  GROUP BY com.article_id, com.user_id
  HAVING comm_count = 1;


