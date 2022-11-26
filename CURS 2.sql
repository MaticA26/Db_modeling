-- CREATE tip_parc table
CREATE TABLE IF NOT EXISTS tip_parc(
	id SERIAL PRIMARY KEY NOT NULL,
	type VARCHAR(20) NOT NULL,
	description VARCHAR(400)
);

--INSERT DATE INTO TABLE AFTER CREATE
INSERT INTO tip_parc (type,description) VALUES
					('Parc NATIONAL', 'Arie protejata infiintata conform regulament Romsilva'),
					('Parc natura', 'Arie naturala proteja conform OUG Life natura 2000'),
					('Stiintifica' , 'Rezervatie apartinand UVT');
					
--update data if required
UPDATE tip_parc SET
		type='Rez Stiintifice',
		description='rez apartinand uvt'
WHERE type='Stiintifica';

SELECT * FROM tip_parc;