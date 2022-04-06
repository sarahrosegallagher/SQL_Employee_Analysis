# SQL Employee Analysis

## Overview of the analysis: 

As the company prepares for a large wave of retirements, this analysis adds actionable insights for leadership. Starting from a set of 6 CSVs, I leveraged SQL queries with joins and filters to create a total of 11 tables drilling down to answer specific questions about retirees' information, department specific insights, counts by title, and information for a pilot mentorship program to facilitate transition. 


## Results: 

Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

* The overall number of retirement-eligible employees is 36,619 (filters included birth date,  hire date, and current employees).

* Per the mentorship eligibility table, there are 1,549 employees who could participate in the mentorship program (filtered by birth year = 1965).

* Per the retirement titles table, **Senior Engineer** and **Senior Staff** the titles with by far the highest retirement rate (a combined total of **50k** vs the remaining titles with a combined total of **20k**).

![retirement titles table](Data\retirement_titles.png)

* The departments with the highest level of retirement-eligible employees are **Development** (9,281) and **Production** (8,174). These stand out among the other departments with an average of roughly 2,000 employees. 


## Summary: 

Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."


* How many roles will need to be filled as the "silver tsunami" begins to make an impact?

There will be 36,619 roles to be filled. 

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

The number of eligible employees for the mentorship program depends on how broadly we filter for birthdate. Based on the filter that includes only employees born in 1965 (1.5k employees), this doesn't seem sufficient. If we broaden our scope to include a wider range of ages, the outlook on the mentorship program is more optimistic (see queries under tailored-lists.sql).