-- INSERTING DATA WITHOUT HAVING TO CONNECT EMPLOYEE TO A DEPARTMENT
-- b/c were not adding data to the last column we have to specify the column we are inserting data to
INSERT INTO EMPLOYEE ( employee_id, gender, birthDate, street, postalCode, city, FirstName, lastName )
VALUES ('1', 'Male', '01-02-2000', '2000 3rd ave', 
        '10021', 'New York', 'Jay', 'Cal'   )


-- First Department created is for software
INSERT INTO DEPARTMENT (department_id, dname ) 
VALUES ( '001', 'Software' )

-- Employee 2 will work in software (last column is 001)
INSERT INTO EMPLOYEE 
VALUES ('2', 'Male', '03-02-2001', '2001 4th ave', 
        '10022', 'New York', 'Ron', 'Cane', '001'   )


-- Employee 3 will work in software (last column is 001)
        -- since various employees can be working for a department 
INSERT INTO EMPLOYEE 
VALUES ('3', 'Male', '09-20-1995', '5642 2nd ave', 
        '14411', 'New York', 'Victor', 'German', '001'   )

-- Next we want to have examples for the relationships 

INSERT INTO LOCATIONS
        VALUES ('1111', 'Manhattan')