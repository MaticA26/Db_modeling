SELECT employee.*, operator_drona.* FROM employee
INNER JOIN operator_drona
ON employee.id=operator_drona.employee_id;

SELECT * FROM employee AS e
INNER JOIN operator_drona AS od
ON e.id=od.employee_id
INNER JOIN drona AS d
ON od.drona_id=d.id;

SELECT e.nume, e.prenume, e.cnp, d.model, d.timp_zbor, d.inaltime_zbor FROM employee AS e
INNER JOIN operator_drona AS od
ON e.id=od.employee_id
INNER JOIN drona AS d
ON od.drona_id=d.id
WHERE d.model='Agras T10';

SELECT COUNT (*),d.model FROM employee AS e
INNER JOIN operator_drona AS od
ON e.id=od.employee_id
INNER JOIN drona AS d
ON od.drona_id=d.id
GROUP BY d.model;

SELECT e.nume,COUNT(*) FROM employee AS e
INNER JOIN operator_drona AS od
ON e.id=od.employee_id
INNER JOIN drona AS d
ON od.drona_id=d.id
GROUP BY e.nume;


SELECT nume, prenume, model, inaltime_zbor FROM
(
SELECT * FROM employee AS e
INNER JOIN operator_drona AS od
ON e.id=od.employee_id
INNER JOIN drona AS d
ON od.drona_id=d.id
) AS AL;
 