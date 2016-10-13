 Backup and Restore :Take backup of the db you created for practice/exercise and send it to me. Now create a new. database named "restored" and restore that backup into this DB.


 	COMMANDS:

 		mysqldump -u root -p vtapp > vtapp_backup.sql

 		CREATE DATABASE restored;

 		mysqldump -u root -p restored < vtapp_backup.sql