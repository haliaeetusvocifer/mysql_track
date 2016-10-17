CREATE DATABASE sandwich;

USE sandwich;

  CREATE TABLE tastes( name VARCHAR(100) NOT NULL, 
    filling VARCHAR(100) NOT NULL
    );

  CREATE TABLE sandwiches( location VARCHAR(70) NOT NULL,
    bread VARCHAR(100) NOT NULL,
    filling VARCHAR(100) NOT NULL,
    price DECIMAL(5,2)
    );

  CREATE TABLE locations( lName VARCHAR(70) NOT NULL,
    phone INT UNSIGNED,
    address VARCHAR(100) NOT NULL
    );

  INSERT INTO tastes (name, filling) VALUES
    ('Brown', 'Turkey'),
    ('Brown', 'Beef'),
    ('Brown', 'Ham'),
    ('Jones', 'Cheese'),
    ('Green', 'Beef'),
    ('Green', 'Turkey'),
    ('Green', 'Cheese');


  INSERT INTO sandwiches (location, bread, filling, price) VALUES
    ('Lincoln', 'Rye', 'Ham', 1.25),
    ('O"Neill"s', 'White', 'Cheese', 1.20),
    ('O"Neill"s', 'Whole', 'Ham', 1.25),
    ('Old Nag', 'Rye', 'Beef', 1.35),
    ('Buttery', 'White', 'Cheese', 1.00),
    ('O"Neill"s', 'White', 'Turkey', 1.35),
    ('Buttery', 'White', 'Ham', 1.10),
    ('Lincoln', 'Rye', 'Beef', 1.35),
    ('Lincoln', 'White', 'Ham', 1.30),
    ('Lincoln', 'Rye', 'Ham', 1.40);


  INSERT INTO locations (lName, phone, address) VALUES
    ('Lincoln', 6834523, 'Lincoln Place'),
    ('O"Neill"s', 6742134, 'Pearse St'),
    ('Old Nag', 7678132, 'Dame St'),
    ('Old Nag', 7023421, 'College St');

    
	SELECT location FROM sandwiches
	 	WHERE filling = (SELECT DISTINCT filling FROM tastes WHERE name = 'Jones');

	
	SELECT DISTINCT sandwiches.location FROM sandwiches, tastes 
		WHERE (tastes.name = 'Jones') AND (tastes.filling=sandwiches.filling);


	SELECT DISTNCT sandwiches.location, COUNT( DISTINCT tastes.name) AS 'people total' 
		FROM sandwiches, tastes 
			WHERE (tastes.filling=sandwiches.filling) GROUP BY sandwiches.location;
