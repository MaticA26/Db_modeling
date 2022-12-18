SELECT * FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id
INNER JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
INNER JOIN projects
ON operator_drona_projects.id=projects.id;

SELECT * FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id
LEFT JOIN operator_drona_projects
ON operator_drona.id=operator_drona_projects.operator_drona_id
RIGHT JOIN projects
ON operator_drona_projects.id=projects.id;