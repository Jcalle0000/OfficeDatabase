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
    startDate        VARCHAR(15),

    employee_id int FOREIGN KEY REFERENCES EMPLOYEE(employee_id)   , 
    location_id int FOREIGN KEY REFERENCES LOCATIONS (location_id),

    PRIMARY KEY (department_id)
)

-- once departments are created we can alter employee table to add the department_id
alter table EMPLOYEE add department_id int;

alter TABLE EMPLOYEE 
ADD FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id);

