	CREATE DATABASE vtapp;	
	
	USE vtapp;			

		CREATE USER 'vtapp_user'@'localhost' IDENTIFIED BY '';	

		GRANT ALL ON vtapp.* TO 'vtapp_user'@'localhost';	