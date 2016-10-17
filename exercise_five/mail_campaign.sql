

	CREATE DATABASE mail_campaign;

	USE mail_campaign;

	CREATE TABLE subscribers (email_address VARCHAR(100) NOT NULL, mobile_number INT UNSIGNED, city VARCHAR(50) NOT NULL);


	ctrl + ctrl

	cd ~/documents/sqltrack   (This navigates to where my .csv file is saved)

	mysql -u root -p --local-infile     (This enables me to use the command to import .csv file)

	LOAD DATA LOCAL INFILE 'email_subscribers.txt' INTO TABLE subscribers FIELDS TERMINATED BY ',';

	SELECT * FROM subscribers;    (this shpws me the imported files and data in my table)

	SELECT DISTINCT city FROM subscribers;		(What all xcities did people respond from)


	SELECT city, COUNT(*) FROM subscribers GROUP BY city; 		 (How many people responded from each city)

	SELECT MAX(city) FROM subscribers;  (Maximum number of people )

	SELECT city, COUNT(*) AS cityCount FROM subscribers GROUP BY city ORDER BY cityCount DESC LIMIT 1; 		(city max)


