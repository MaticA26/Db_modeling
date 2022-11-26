CREATE TABLE IF NOT EXISTS parcuri(
	id SERIAL PRIMARY KEY NOT NULL,
	Name Varchar(50) NOT NULL,
	tip_parc_id INTEGER NOT NULL, --FK
	registration_date DATE NOT NULL,
	FOREIGN KEY (tip_parc_id) REFERENCES tip_parc
);


SELECT * FROM parcuri