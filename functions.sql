--FUNCTIONS DEFINITION

create function deactivate_unpaid_accounts() return void

LANGUAGE SQL 

AS $$ 

	UPDATE accounts SET active = false WHERE balance < 0;

$$;

-- EXEMPLE

CREATE FUNCTION deactivate_unpaid_accounts() RETURN void

LANGUAGE SQL 

AS $$ 

	UPDATE generated SET prenume= 'Popescu';

$$;

SELECT deactivate_unpaid_accounts();


-- CREATE PROCEDURE

CREATE PROCEDURE update_adress()

LANGUAGE SQL 

AS $$ 

	UPDATE generated SET adresa = 'Timisoara';

$$;

CALL update_adress();

-- REPLACE FUNCTION

CREATE FUNCTION account_type_count(cnp text, id integer) RETURNS integer
LANGUAGE plpgsql
AS $$ 
	DECLARE account_count int;
BEGIN
	SELECT count(*) INTO account_count
	FROM generated
	INNER JOIN employee e
	ON e.id=generated.id
	WHERE generated.cnp =$1 and e.id=$2;
	
	RETURN account_count;
END;
$$;

SELECT account_type_count('1234567899874',2)-- MAI TREBUIE MODIFICATA TABELUL generated PRIN ADAUGAREA COLOANEI ID

-- DAY 2
--CREATE PROCEDURE 

CREATE PROCEDURE procedure-name(parameters-list)

LANGUAGE plpgsql

AS$$ 

DECLARE 

(variable name of procedure)

BEGIN

	---SQL statements / logic / condition.

END $$

-- EXEMPLE 

CREATE OR REPLACE PROCEDURE adddrones
(
model_p VARCHAR (50),
timp_zbor_p  TIME,
inaltime_zbor_p INTEGER,
sarcina_utila_p INTEGER
) 
LANGUAGE plpgsql
AS
$$ 
BEGIN
INSERT INTO drona(model, timp_zbor, inaltime_zbor, sarcina_utila) VALUES(model_p,timp_zbor_p,inaltime_zbor_p,sarcina_utila_p);
END$$;

INSERT INTO drona(model,timp_zbor,inaltime_zbor,sarcina_utila) VALUES('Matrice 30','02:10',50,1);

CALL adddrones ('Matrice 31','02:10',50,1);

--INSERT 

CREATE OR REPLACE PROCEDURE updatedronesmodel
(
old_name VARCHAR (50),
new_name VARCHAR (50)
) 
LANGUAGE plpgsql
AS
$$ 
BEGIN
UPDATE drona
SET model = new_name
WHERE model = old_name;
END$$;

CALL updatedronesmodel('Matrice 30','Alexandrudrones');

--UPDATE

CREATE OR REPLACE PROCEDURE updateprojectdates
(
id_p INTEGER,
start_date_p DATE,
end_date_p DATE
)

LANGUAGE plpgsql

AS
$$
BEGIN
UPDATE projects
SET start_date= start_date_p, end_date=end_date_p
WHERE id=id_p;

END
$$;


call updateprojectdates(4,'2023-01-16','2023-12-16');


select * from projects where id=4

--DELETE

CREATE OR REPLACE PROCEDURE DeleteProjectsFromRange
(
start_date_p DATE,
end_date_p DATE
)

LANGUAGE plpgsql

AS
$$
BEGIN
DELETE FROM projects
WHERE start_date <= start_date_p AND end_date >= end_date_p;

END
$$;


call DeleteProjectsFromRange ('2023-01-15','2023-12-16');

DELETE FROM projects 
WHERE start_date<= '2023-01-15' AND end_date>='2023-12-16';

---

CREATE OR REPLACE FUNCTION GetprojectCount(proiect_id_p INTEGER)
RETURNS projects
LANGUAGE sql
AS
$$
SELECT * FROM projects WHERE id=proiect_id_p;

$$;


SELECT * FROM GetprojectCount(5);

--- PROCEDURE INSERT

CREATE OR REPLACE PROCEDURE addnewentrytogenerated(cnp_p VARCHAR (13))
language plpgsql
as
$$
begin
insert into generated
SELECT av. *, e.adresa FROM
(
	select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
	inner join operator_drona
	on e.id=operator_drona.employee_id
	inner join operator_drona_projects
	on operator_drona.id=operator_drona_projects.operator_drona_id
	inner join projects p
	on operator_drona_projects.projects_id=p.id
) AS av
	inner join employee as e 
	on av.cnp=e.cnp
	where e.cnp=cnp_p;
end
$$;

SELECT * FROM generated;

CALL addnewentrytogenerated ('1234567899856');

SELECT * FROM generated;

create or replace procedure updatename (cnp_p VARCHAR(13),adresa_p VARCHAR(30))
language plpgsql
as 
$$
begin
UPDATE generated SET adresa = adresa_p 
WHERE nume_angajat IN (
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp =cnp_p
);
END
$$;

call updatename ('1234567899856','Sibiu');

select * from generated



