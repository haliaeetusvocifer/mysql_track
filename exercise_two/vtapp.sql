Create a DB named "vtapp", create a db user named 'vtapp_user' and give him permissions to access vtappDB.

		COMMANDS:


	CREATE DATABASE vtapp;					[Creates vtapp]
	
	USE vtapp;								[swicthes to vtapp]

		CREATE USER 'vtapp_user'@'localhost' IDENTIFIED BY '';		[Creates user vtapp_user without password]

		GRANT ALL ON vtapp.* TO 'vtapp_user'@'localhost';			[Grants vtapp_user all access to the vtapp]



