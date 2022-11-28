select 2;

select 2+2;

select TRUE;

select now();

select * from employee;

SELECT nume, prenume, cnp from employee;

SELECT nume, prenume, cnp, NOW() from employee;

SELECT nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data Raport" from employee;

SELECT nume  "Nume angajat", prenume  "Prenume angajat", cnp  "CNP", NOW()  "Data Raport" from employee;

SELECT nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data Raport", (id*3)/2 as "ID Angajat" from employee ;

-- filtrare rezultate cu WHERE

SELECT * FROM employee WHERE id=3;

SELECT nume, prenume, cnp from employee WHERE id='3';

SELECT nume, prenume from employee where id='3';

select* from employee where id not in (3,4,5);

select * from employee where id >3;

select * from employee where nume like ('%r%');

select * from employee where prenume like ('P%');

select * from employee where adresa like ('%Tim%');

SELECT nume as "Nume angajat", e.prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data Raport" from employee e 
where e.nume='Gheorghe';

SELECT employee.nume as "Nume angajat", employee.prenume as "Prenume angajat", employee.cnp as "CNP", NOW() as "Data Raport" from employee;

CREATE TABLE employee_extended AS 
SELECT nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data Raport" from employee;

create view employee_extended_view AS
	SELECT nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data Raport" from employee;

select * from employee_extended;

SELECT model, timp_Zbor from
	(
		SELECT *, NOW() AS "Acum" FROM drona
	)as temp;




