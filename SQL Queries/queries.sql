--total
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--1952
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--1953
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

--1954
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31'

--1955
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31'

DROP TABLE retirement_info;

--retirement eligibility 
SELECT  emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info

--COUNT retirement eligibility 
SELECT COUNT(first_name)
FROM 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
-- join names and titles 
SELECT first_name, last_name, title
FROM employees as e 
LEFT JOIN titles as t ON e.emp_no = t.emp_no

-- employees broken down by departments 

--step1: join retirement info table w dept emp for if they're still here 

SELECT r.emp_no, r.first_name, r.last_name, d.to_date 
-- INTO current_employees
FROM retirement_info as r 
LEFT JOIN dept_emp as d ON r.emp_no = d.emp_no
WHERE d.to_date = ('9999-01-01')

-- step 2: count, order by, and grouby w joins to sep employees into depts 

SELECT COUNT(c.emp_no), de.dept_no
-- INTO dept_count
FROM current_employees as c 
LEFT JOIN dept_emp as de ON c.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;


-- lists
-- employee inf w no, name, gender, salary 
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
INTO emp_info 
FROM employees as e 
INNER JOIN salaries AS s ON s.emp_no = e.emp_no
INNER JOIN dept_emp AS de ON de.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01')

-- managers list w dept no, dept name, emp nam,emp no, start, end dates
SELECT d.dept_no, d.dept_name, ce.first_name, ce.last_name, dm.emp_no, dm.from_date, dm.to_date
INTO manager_info
FROM departments as d 
INNER JOIN dept_manager as dm ON d.dept_no = dm.dept_no
INNER JOIN current_employees as ce ON ce.emp_no = dm.emp_no

DROP TABLE retiree_list
-- dept retirees list w current emp w depts 
SELECT ce.emp_no, ce.first_name, ce.last_name, d.dept_name, de.from_date, de.to_date
INTO retiree_list
FROM current_employees as ce 
INNER JOIN dept_emp as de 
ON ce.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no; 

SELECT * FROM retiree_list