

  CREATE DATABASE mail_campaign;

  USE mail_campaign;

  CREATE TABLE subscribers (
  email_address VARCHAR(100) NOT NULL, 
  mobile_number INT UNSIGNED, 
  city VARCHAR(50) NOT NULL
  );


  LOAD DATA LOCAL INFILE 'email_subscribers.txt' 
  INTO TABLE subscribers FIELDS TERMINATED BY ',';


  SELECT * 
  FROM subscribers;


/*
What all cities did people respond from
*/

  SELECT DISTINCT city 
  FROM subscribers;




/*
How many people responded from each city
*/

  SELECT city, COUNT(*) 
  FROM subscribers 
  GROUP BY city; 




/*
Which city were the maximum respondents from?
*/


SELECT city, MAX(cityCount) 
FROM (
  SELECT city, COUNT(*) as cityCount    
  FROM subscribers      
  GROUP BY city 
  ) as maxCity;


    
/*
What all email domains did people respond from ?
*/

  SELECT DISTINCT substring_index(email_address, '@', -1)domain 
  FROM mail_campaign.subscribers 
  ORDER BY domain;


/*
Which is the most popular email domain among the respondents ?
*/


  SELECT MAX(MyCount) 
  FROM (
    SELECT  substring_index(email_address, '@', -1)domain, 
  COUNT(*) AS MyCount 
  FROM mail_campaign.subscribers 
  GROUP BY substring_index(email_address, '@', -1) 
   ) AS domanMAx;



