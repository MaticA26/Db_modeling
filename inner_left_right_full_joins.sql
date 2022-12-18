--INNER JOIN

SELECT * FROM clients
INNER JOIN projects
ON clients.id=projects.clients_id;

--LEFT JOIN

SELECT * FROM projects
LEFT JOIN clients
ON projects.clients_id=clients.id;

--RIGHT JOIN

SELECT * FROM projects
RIGHT JOIN clients
ON projects.clients_id=clients.id;

--FULL JOIN

SELECT * FROM clients
FULL JOIN projects
ON clients.id=projects.clients_id;

