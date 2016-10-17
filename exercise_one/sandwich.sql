CREATE DATABASE sandwich;

USE sandwich;


	SELECT location FROM sandwiches
	 	WHERE filling = (SELECT DISTINCT filling FROM tastes WHERE name = 'Jones');

	
	SELECT DISTINCT sandwiches.location FROM sandwiches, tastes 
		WHERE (tastes.name = 'Jones') AND (tastes.filling=sandwiches.filling);


	SELECT DISTNCT sandwiches.location, COUNT( DISTINCT tastes.name) AS 'people total' 
		FROM sandwiches, tastes 
			WHERE (tastes.filling=sandwiches.filling) GROUP BY sandwiches.location;
