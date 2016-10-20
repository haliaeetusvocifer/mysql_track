
  CREATE DATABASE article;

  USE article;


/*
Manage categories, articles, comments, and users
*/


    CREATE TABLE users( 
    user VARCHAR(100) NOT NULL,
    type_user INT UNSIGNED
    );

    CREATE TABLE articles( 
    article VARCHAR(300) NOT NULL,
    category VARCHAR(100) NOT NULL,
    user VARCHAR(100) NOT NULL
    );


    CREATE TABLE comments( 
    article VARCHAR(300) NOT NULL,
    comment VARCHAR(500) NOT NULL,
    user VARCHAR(100) NOT NULL
    );

    INSERT INTO users (user, type_user) VALUES
    ('Tunde', 1),
    ('Brown', 2),
    ('Jones', 1),
    ('Segun', 2),
    ('Sommy', 2),
    ('Obi', 1),
    ('user3', 2),
    ('user2', 2),
    ('Wilson', 1);


    INSERT INTO articles (article, category, user) VALUES
    ('Who moved my Cheese', 'Politics', 'Tunde'),
    ('BBOG', 'Family', 'Brown'),
    ('Nigeria Sport', 'Sports','Jones'),
    ('EPL week 7 Report', 'Sports','Jones'),
    ('Family Wealth', 'Family', 'Sommy'),
    ('Disease: Ebola', 'Health','user3');


    INSERT INTO comments (article, comment, user) VALUES
    ('Who moved my Cheese', 'i laugh ooo', 'Jones'),
    ('Who moved my Cheese', 'I don"t buy the idea', 'segun'),
    ('Family Wealth', 'great Initiative, I will apply to my family', 'Sommy'),
    ('Family Wealth', 'It can"t work in my family', 'Segun'),
    ('Nigeria Sport', 'remove the minister', 'Segun');




/*
Select all articles whose author's name is user3 (Do this exercise using variable
also).
*/

  SELECT * FROM articles 
  WHERE articles.user = 'user3';


  SELECT * FROM articles 
  WHERE articles.user = '';


/*
For all the articles being selected above, select all the articles and also the comments
associated with those articles in a single query (Do this using subquery also)
*/
  
  SELECT article,comment 
  FROM comments 
  ORDER BY article;


      

  SELECT comments.article, comment 
  FROM comments, articles 
  WHERE (
    comments.article=articles.article
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
  COUNT(DISTINCT comments.user) AS MyCount  
  FROM comments, articles  
  WHERE (articles.article=comments.article)  
  GROUP BY comments.article 
  ORDER By MyCount ASC LIMIT 1;


