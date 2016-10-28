
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
    ('Tunde', 'amdin'),
    ('Brown', 'normal'),
    ('Jones', 'admin'),
    ('Segun', 'normal'),
    ('Obi', 'admin'),
    ('user3', 'normal'),
    ('user2', 'normal');

    INSERT INTO categories (category) VALUES
    (1, 'Politics'),
    (2, 'Family'),
    (3, 'Sports'),
    (4, 'Health');


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

  SELECT * FROM articles 
  JOIN users 
  ON users.id = articles.user_id 
  WHERE users.name = 'user3';



  SELECT * FROM users 
  JOIN articles 
  ON users.id = articles.user_id 
  WHERE users.name = '';

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


      

  SELECT comments.article, comment 
  FROM comments, articles 
  WHERE (
    comments.article = articles.article
  );


/*
Write a query to select all articles which do not have any comments (Do using subquery
also)
*/
      

  SELECT article 
  FROM comments 
  WHERE comments.comment='';



  SELECT DISTINCT comments.article 
  FROM comments,articles
  WHERE (
    comments.comment=''
  );



/*
Write a query to select article which has maximum comments.
*/


  SELECT DISTINCT article, 
  COUNT(*) AS MyCount
  FROM comments 
  GROUP BY article
  ORDER BY MyCount
  DESC LIMIT 1;


/*
Write a query to select article which does not have more than one comment by the
same user ( do this using left join and group by )
*/


  SELECT DISTINCT comments.user,  
  COUNT(
    DISTINCT comments.user
  ) AS MyCount  
  FROM comments, articles  
  WHERE (
    articles.article=comments.article
  ) GROUP BY comments.article 
  ORDER By MyCount ASC LIMIT 1;


