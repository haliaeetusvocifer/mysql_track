CREATE DATABASE sandwich;

USE sandwich;




Write SQL statements to retrieve the following information:
(i) places where Jones can eat (using a nested subquery). 

	
	
	SELECT location FROM sandwiches WHERE filling = (SELECT DISTINCT filling FROM tastes WHERE name = 'Jones');


(ii) places where Jones can eat (without using a nested subquery). 

	
	SELECT DISTINCT sandwiches.location FROM sandwiches, tastes WHERE (tastes.name = 'Jones') AND (tastes.filling=sandwiches.filling);



(iii) for each location the number of people who can eat there. 
	
	SELECT DISTNCT sandwiches.location, COUNT( DISTINCT tastes.name) AS 'people total' 
	FROM sandwiches, tastes WHERE (tastes.filling=sandwiches.filling) GROUP BY sandwiches.location;


