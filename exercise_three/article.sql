
  CREATE DATABASE article;

    USE article;


    CREATE TABLE users( user VARCHAR(100) NOT NULL,
    type_user INT UNSIGNED
    );

    CREATE TABLE articles( article VARCHAR(300) NOT NULL,
    category VARCHAR(100) NOT NULL,
    user VARCHAR(100) NOT NULL
    );


    CREATE TABLE comments( article VARCHAR(300) NOT NULL,
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



      SELECT * FROM articles WHERE articles.user = 'user3';


      SELECT article,comment FROM comments ORDER BY article;


      SELECT comments.article, comment FROM comments, articles 
        WHERE (comments.article=articles.article);



      SELECT article FROM comments WHERE comments.comment='';


