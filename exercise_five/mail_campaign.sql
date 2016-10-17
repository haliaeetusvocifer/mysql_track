

	CREATE DATABASE mail_campaign;

	USE mail_campaign;

	CREATE TABLE subscribers (email_address VARCHAR(100) NOT NULL, 
    mobile_number INT UNSIGNED, city VARCHAR(50) NOT NULL
    );


	LOAD DATA LOCAL INFILE 'email_subscribers.txt' 
    INTO TABLE subscribers FIELDS TERMINATED BY ',';


	SELECT * FROM subscribers;   

	SELECT DISTINCT city FROM subscribers;


	SELECT city, COUNT(*) FROM subscribers GROUP BY city; 


	SELECT MAX(city) FROM subscribers; 


	SELECT city, COUNT(*) AS cityCount FROM subscribers 
    GROUP BY city ORDER BY cityCount DESC LIMIT 1; 


