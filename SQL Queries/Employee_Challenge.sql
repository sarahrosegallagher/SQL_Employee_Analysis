--DELIVERABLE 1 

-- list of retiring employees by title 
-- fix: use emp table not rl table 
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
t.title
INTO unique_titles
FROM employees as e
INNER JOIN titles AS t on t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01'
AND (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.to_date DESC;

SELECT * FROM unique_titles; --33k rows fixed 72k 

DROP TABLE retiring_titles;
-- count of retiring employees by title (different counts from example - error or updated?)
-- sum of count of emp_no : 50k~
SELECT DISTINCT title, COUNT(emp_no) AS "count"
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY "count" DESC;


SELECT * FROM retiring_titles;

--testing
-- SELECT COUNT(title = 'Senior Engineer')
-- FROM unique_titles

-- SELECT * FROM retiree_list

-- SELECT * 
-- FROM unique_titles
-- WHERE (title = 'Senior Engineer')

--DELIVERABLE 2

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN titles AS t ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no
	
	