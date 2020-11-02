-- After Insert
-- CREATE TRIGGER tWorksON_AIU(

--     AFTER INSERT OF project_id, employee_id ON  WORKS_ON
--         INSERT INTO amount_of_Hours ('40') 
-- ); 

-- LOGGING DELETIION FOR employees
-- we will delete employee 3 since its not connected to anything
CREATE table employee_deleted_log(
    employee_id int    
)

-- save their id's
CREATE TRIGGER employee_History
    on EMPLOYEE
    AFTER INSERT
AS                  -- body of trigger beging with the AS keyword
BEGIN

    INSERT INTO
        employee_deleted_log
            (
                employee_id
            )
    SELECT
        i.employee_id
    FROM 
        INSERTED as i;
END

-- inserted this employee to see if it works 
INSERT INTO EMPLOYEE 
VALUES ('99', 'Male', '07-29-2001', '111 lex ave', 
        '10021', 'New York', 'ryan', 'davis', '001'  , '28' )