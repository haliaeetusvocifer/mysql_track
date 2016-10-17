    CREATE DATABASE testone;

    USE testone;  

    CREATE TABLE testing_table (
      name VARCHAR(100),
      contact_name VARCHAR(100),
      roll_no VARCHAR(10)
    );      



    ALTER TABLE testing_table DROP name;       



    ALTER TABLE testing_table CHANGE COLUMN contact_name username VARCHAR(100);


    ALTER TABLE testing_table ADD (
      first_name VARCHAR(100), 
      last_name VARCHAR(60)
    );


    ALTER TABLE testing_table MODIFY roll_no INT;
    