SELECT * FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects
ON operator_drona_projects.id=projects.id;

SELECT * FROM employee e
INNER JOIN operator_drona
ON e.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects p
ON operator_drona_projects.id=p.id;

SELECT * FROM operator_drona
INNER JOIN 
(
	select * from employee where sex='M'

) e
ON e.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects
ON operator_drona_projects.id=projects.id;

-- BEST PERFORMANCE

SELECT * FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id AND employee.sex='F'
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects
ON operator_drona_projects.id=projects.id;





