create table departments (
    dept_no varchar(40) primary key,
    dept_name VARCHAR(40)
);

select *
from dept_manager;

create table dept_emp(
	emp_no varchar(40),
    foreign key (emp_no) references employees(emp_no),
	dept_no int,
    Foreign key (dept_no) references departments(dept_no)
);

create table dept_manager(
	dept_no int,
    Foreign key (dept_no) references departments(dept_no),
	manager_no varchar(40) primary key
);

create table employees(
    emp_no varchar(40) primary key,
	emp_title_id varchar(45),
    foreign key (emp_title_id) references titles(title_id),
    birth_date varchar(45),
    first_name varchar(45),
    last_name varchar(45),
    sex varchar(5),
    hire_date varchar(45)
);

create table salaries(
	emp_no varchar(45),
    FOREIGN key (emp_no) REFERENCES employees(emp_no),
    salary int
);

create table titles(
    title_id varchar(40) primary key,
    title varchar(40)
);