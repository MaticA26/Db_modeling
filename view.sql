---CREATE VIEW
create view first_view as 
select * from employee;

---SELECT VIEW
select * from first_view;

---CREATE SELECT VIEW JOINS
create view angajati_proiecte_view as
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id;

select * from angajati_proiecte_view;

---FILTER SELECT
select nume_angajat, cnp from angajati_proiecte_view;


SELECT av. *, e.adresa FROM angajati_proiecte_view as av
inner join employee as e 
on av.cnp=e.cnp;


select av.*,e.adresa From
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
)as av
inner join employee as e
on av.cnp=e.cnp;


-- VIEW FOR UPDATE
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' WHERE nume_angajat='Vasile';

-- EQUIVALENT WITH PREVIOUS
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' 
WHERE nume_angajat=(
					SELECT DISTINCT nume_angajat FROM angajati_proiecte_view WHERE cnp ='1234567890127' 
					);
					
-- EQUIVALENT WITH PREVIOUS			
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' 
WHERE nume_angajat in(
					SELECT DISTINCT nume_angajat FROM angajati_proiecte_view WHERE cnp ='1234567890127' 
					);
					

-- EQUIVALENT WITH PREVIOUS
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' 
WHERE nume_angajat=(
SELECT DISTINCT nume_angajat FROM 
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
)as t
where t.cnp='1234567890127'
);

-- DELETE FROM gerenated
DELETE FROM generated WHERE nume_angajat in(
					SELECT DISTINCT nume_angajat FROM angajati_proiecte_view WHERE cnp ='1234567890127' 
					);
					
					
CREATE VIEW drona_cu_senzori AS
SELECT d.*,ds.senzor_id FROM drona as d
LEFT JOIN drona_senzor as ds 
on d.id=ds.drona_id;

SELECT * FROM drona_cu_senzori;


SELECT model, count(*) as senzori from drona_cu_senzori
group by model;

SELECT model, nume from drona_cu_senzori as ds
inner join senzor as s
on ds.senzor_id=s.id;


SELECT DISTINCT model, nume FROM drona_cu_senzori as ds
left join operator_drona_projects as odp
on ds.id=odp.id
left join projects as pr
on odp.projects_id= pr.id;
SELECT * FROM drona_cu_senzori

CREATE VIEW operatori_pentru_drone AS
SELECT e.nume, e.prenume, e.cnp, e.id, od.drona_id, p.nume AS proiect  FROM employee AS e
LEFT JOIN operator_drona AS od
ON e.id=od.employee_id
LEFT JOIN operator_drona_projects AS odp
ON od.id= odp.operator_drona_id
LEFT JOIN projects AS p
ON odp.projects_id= p.id;

SELECT * FROM operatori_pentru_drone;


SELECT DISTINCT prenume, count(*) AS nr_licente FROM operatori_pentru_drone
group by drona_id, prenume; 

create table proiecte_cu_drona as
select * from operatori_pentru_drone where proiect is not null;

select * from proiecte_cu_drona;

insert into proiecte_cu_drona select * from operatori_pentru_drone where proiect is null;


SELECT * FROM proiecte_cu_drona;


SELECT * FROM operatori_pentru_drone;


delete from proiecte_cu_drona where id in 
(
SELECT DISTINCT ID FROM operatori_pentru_drone where proiect is null
);


					