--tailored lists 7.3.6

-- sales

SELECT ri.emp_no, ri.first_name, ri.last_name, d.dept_name
FROM retirement_info AS ri 
INNER JOIN dept_emp as de ON ri.emp_no = de.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'

-- sales and development

SELECT ri.emp_no, ri.first_name, ri.last_name, d.dept_name
FROM retirement_info AS ri 
INNER JOIN dept_emp as de ON ri.emp_no = de.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
-- WHERE d.dept_name = 'Sales' OR
-- 	d. dept_name = 'Development'