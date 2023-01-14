UPDATE employee SET adresa='Mun. Arad, jud. Arad';

UPDATE employee SET adresa='Mun. Timisoara, Jud. Timis' WHERE id=1;

UPDATE employee SET adresa='Mun. Timisoara, Jud. TImis' where id IN(1,3,5);

UPDATE employee SET adresa='Mun. Buzias, Jud. Timis' where sex='F';





SELECT * FROM employee;

UPDATE employee SET adresa='Mun. Timisoara, Jud. TImis' where id IN(1,3,5);

SELECT * FROM employee WHERE id in(
SELECT employee_id FROM operator_drona where drona_id=5
);

SELECT * from employee where id in
(
	SELECT employee_id from operator_drona WHERE drona_id=
	(
	SELECT id FROM drona where model='Phantom 4 RTK'
	)
);
select* from drona;
SELECT * from operator_drona;
SELECT * from employee;

UPDATE employee SET adresa='Mun. Sibiu, Jud. Sibiu' where id IN
(
	SELECT employee_id from operator_drona WHERE drona_id=
	(
	SELECT id FROM drona where model='Phantom 4 RTK'
	)
);

DELETE from employee where id IN
(
	SELECT employee_id from operator_drona WHERE drona_id=
	(
	SELECT id FROM drona where model='Phantom 4 RTK'
	)
);


