-- list of retiring employees by title 
SELECT DISTINCT ON (rl.emp_no) rl.emp_no,
rl.first_name,
rl.last_name,
t.title
INTO unique_titles
FROM retiree_list as rl
INNER JOIN titles AS t on t.emp_no = rl.emp_no
WHERE rl.to_date = '9999-01-01'
ORDER BY rl.emp_no, rl.to_date DESC;


-- count of retiring employees by title (different counts from example - error or updated?)
SELECT DISTINCT title, COUNT(emp_no) AS "count"
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY "count" DESC;

--testing
-- SELECT COUNT(title = 'Senior Engineer')
-- FROM unique_titles

-- SELECT * FROM retiree_list

-- SELECT * 
-- FROM unique_titles
-- WHERE (title = 'Senior Engineer')