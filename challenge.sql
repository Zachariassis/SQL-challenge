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

-- Part 1 Employee and salary
select employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
from employees
inner join salaries on salaries.emp_no=employees.emp_no;

-- Part 2 Employee and 1986
select employees.first_name, employees.last_name, employees.hire_date
from employees
where substring(employees.hire_date,char_length(employees.hire_date)-3,4) = '1986';

-- Part 3 Manager 
select dept_manager.dept_no, departments.dept_name, dept_manager.manager_no, employees.last_name, employees.first_name
from departments
inner join dept_manager on dept_manager.dept_no=departments.dept_no
inner join employees on dept_manager.manager_no=employees.emp_no;

-- Part 4 
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no;

-- Part 5
select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name='Hercules' and employees.last_name like 'B%';

-- Part 6
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
where departments.dept_name='Sales';

-- Part 7
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
where departments.dept_name='Sales' or departments.dept_name='Development';


-- Part 8
select employees.last_name, count(employees.last_name) as "count_name"
from employees
group by last_name
order by count_name DESC;