CREATE TABLE department (
    dept_no varchar   NOT NULL,
    dept_name varchar   NOT NULL
--     CONSTRAINT pk_department PRIMARY KEY (
--         dept_no
--      )
);

CREATE TABLE department_emp (
    emp_no int   NOT NULL,
    dept_no varchar(30)   NOT NULL
--     CONSTRAINT pk_department_emp PRIMARY KEY (
--         emp_no,dept_no
--      )
);
CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id varchar   NOT NULL,
    birth_date Date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar   NOT NULL,
    hire_date Date   NOT NULL
--     CONSTRAINT pk_employees PRIMARY KEY (
--         emp_no
--      )
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL
--     FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
--     FOREIGN KEY (dept_no) REFERENCES department (dept_no),
--     PRIMARY KEY (dept_no, emp_no)
);


CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
--     CONSTRAINT pk_salaries PRIMARY KEY (
--         emp_no
--      )
);

CREATE TABLE title (
    title_id varchar   NOT NULL,
    title varchar   NOT NULL
--     CONSTRAINT pk_title PRIMARY KEY (
--         title_id
--      )
);

ALTER TABLE department ADD CONSTRAINT pk_department PRIMARY KEY(dept_no);
-- Resolve error with ALTER statement
-- ALTER TABLE department_emp ADD CONSTRAINT pk_department_emp PRIMARY KEY(emp_no);

-- ALTER TABLE department_emp ADD CONSTRAINT pk_dept_emp PRIMARY KEY(dept_no);

ALTER TABLE employees ADD CONSTRAINT pk_employees PRIMARY KEY(emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
-- Emp_no and dept_no are from incompatible data types (both should be dept_no )
-- ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_man FOREIGN KEY(emp_no)
-- REFERENCES department (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT pk_dept_manager PRIMARY KEY(emp_no);

-- Multiple primary keys in dept_manager table?
-- ALTER TABLE dept_manager ADD CONSTRAINT pk_dept_man PRIMARY KEY(dept_no);

ALTER TABLE salaries ADD CONSTRAINT pk_salaries PRIMARY KEY(emp_no);

ALTER TABLE title ADD CONSTRAINT pk_title PRIMARY KEY(title_id);

-- not present 
-- ALTER TABLE department_emp ADD CONSTRAINT fk_department_emp_emp_no FOREIGN KEY(emp_no)
-- REFERENCES employees (emp_no)

ALTER TABLE department_emp ADD CONSTRAINT fk_department_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES department (dept_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES title (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

