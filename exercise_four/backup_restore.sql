
mysqldump -u root -p cookbook > cookbook_backup.sql

  CREATE DATABASE restore;

  mysql -u root -p restore < cookbook_backup.sql