
mysqldump -u root -p vtapp > vtapp_backup.sql

 	CREATE DATABASE restored;

 	mysqldump -u root -p restored < vtapp_backup.sql