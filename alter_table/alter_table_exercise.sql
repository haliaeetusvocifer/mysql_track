1. Create a table named "testing_table" with following fields: name (string), contact_name (string), roll_no (string)
	
		Before creating a table, mysql will be started, initiated in terminal and database is created:

		COMMANDS:

		mysql -u root -p

		CREATE DATABASE testone;										[This creates database testone]	
		USE testone;													[This switch to the database testone]											 											
		CREATE TABLE testing_table (name VARCHAR(100), contact_name VARCHAR(100), roll_no VARCHAR(10));			[This creates name, contact_name and roll_no qith their datatypes]

		DESCRIBE testing_table;      [This shows me the columns in the table andd their datatype]



2. Delete column name
	
	COMMAND:

		ALTER TABLE testing_table DROP name;        [Delete column name]



3. Rename contact_name to username.

	COMMAND:

		ALTER TABLE testing_table CHANGE COLUMN contact_name username VARCHAR(100);


4. Add two fields first_name, last_name.

	COMMAND:

		ALTER TABLE testing_table ADD (first_name VARCHAR(100), last_name VARCHAR(60));


5. Change the type of roll_no to integer

	COMMAND:

		ALTER TABLE testing_table MODIFY roll_no INT;
		

