create DATABASE OFFICE;

-- Built first
CREATE TABLE LOCATIONS(
    location_id             int     not null,
    name_of_location        VARCHAR(15),

    PRIMARY key (location_id)
);

-- Built Secondly and then department id was altered into it
CREATE TABLE EMPLOYEE (
    employee_id     int       not null, 
    gender          varchar(10),
    birthDate       VARCHAR(12),
    street          VARCHAR(20),
    postalCode      int ,
    city            VARCHAR(10),
    FirstName       VARCHAR(10),
    lastName        VARCHAR(10),

    PRIMARY KEY (employee_id),
    -- needs to be added after department is constructed
    -- department_id   int FOREIGN KEY REFERENCES DEPARTMENT(department_id)
);


-- Built Thirdly 
CREATE table DEPARTMENT (
    department_id    int             not null,
    dname            VARCHAR(10),
    startDate        VARCHAR(15),  -- this column was supposed to be used for when an employee starts managing a department 

    employee_id int FOREIGN KEY REFERENCES EMPLOYEE(employee_id)   ,  -- can have various employees working for the department 
    location_id int FOREIGN KEY REFERENCES LOCATIONS (location_id), -- can have multiple locations 

    PRIMARY KEY (department_id)
)

-- once departments are created we can alter employee table to add the department_id
alter table EMPLOYEE add department_id int;

alter TABLE EMPLOYEE 
ADD FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id);

-- we are not making department_id requied
    -- b/c we may want to add a project and may 
    -- not be sure of what department we want to add it to
    -- Incorporates relationship 4
CREATE TABLE PROJECT (
    project_id  INT          NOT NULL ,    
    projName    VARCHAR(20),
    department_id INT       , -- we are not specifying as null

    FOREIGN KEY (department_id) REFERENCES DEPARTMENT (department_id),

    PRIMARY KEY(project_id)
)

-- this is intresting as it has two primary keys
    -- since theyre primary keys they cannot be empty
-- M:N Relationship
-- Relationship 3
CREATE TABLE WORKS_ON(
    project_id      INT      NOT null, 
    employee_id     INT      not NULL,
    FOREIGN KEY   (project_id) REFERENCES PROJECT(project_id),
    FOREIGN KEY   (employee_id) REFERENCES EMPLOYEE (employee_id),

    amount_of_Hours INT,           

    -- constraints are needed for multiple primary keys?
    CONSTRAINT PK_WORKS_ON PRIMARY KEY (project_id, employee_id)
    
)

