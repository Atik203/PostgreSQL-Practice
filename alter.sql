
-- show all fields in the table
 select * from person;

-- Add a column to the table
ALTER TABLE person
   ADD COLUMN email VARCHAR(255) DEFAULT 'default@gmail.com' NOT NULL;

-- Drop a column from the table
ALTER TABLE person
   DROP COLUMN email;

-- rename a column
ALTER TABLE person
   RENAME COLUMN name TO full_name;

-- change the data type of a column
ALTER Table person
    ALTER COLUMN full_name TYPE VARCHAR(120); 

-- change the constraint of a column
ALTER TABLE person
    ALTER COLUMN full_name SET NOT NULL;

-- remove the constraint of a column
ALTER TABLE person
    ALTER COLUMN full_name DROP NOT NULL;

-- add a constraint to a column
ALTER Table person
    ADD CONSTRAINT person_name_unique UNIQUE (full_name);   

-- remove a constraint from a column
ALTER TABLE person
    DROP CONSTRAINT person_name_unique;
    
-- truncate the table
TRUNCATE TABLE person;    