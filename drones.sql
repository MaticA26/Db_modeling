CREATE TABLE IF NOT EXISTS employee(
	id SERIAL PRIMARY KEY NOT NULL,
	nume VARCHAR(50) NOT NULL,
	prenume VARCHAR(50) NOT NULL,
	cnp VARCHAR(13) UNIQUE NOT NULL,
	adresa VARCHAR(200) NOT NULL,
	sex CHAR(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS clients(
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	contact VARCHAR(200) NOT NULL,
	cui INTEGER UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS senzor(
	id SERIAL PRIMARY KEY NOT NULL,
	nume VARCHAR(100) UNIQUE NOT NULL,
	tip_senzor VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS drona(
	id SERIAL PRIMARY KEY NOT NULL,
	model VARCHAR(50) UNIQUE NOT NULL,
	timp_zbor TIME NOT NULL,
	inaltime_zbor INTEGER NOT NULL,
	sarcina_utila INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS operator_drona(
	id SERIAL PRIMARY KEY NOT NULL,
	employee_id INTEGER NOT NULL,
	drona_id INTEGER NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employee,
	FOREIGN KEY (drona_id) REFERENCES drona,
	UNIQUE(employee_id, drona_id)
);

CREATE TABLE IF NOT EXISTS projects(
	id SERIAL PRIMARY KEY NOT NULL,
	nume VARCHAR(100) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	description VARCHAR(300) NULL,
	clients_id INTEGER NOT NULL,
	FOREIGN KEY(clients_id) REFERENCES clients
);

CREATE TABLE IF NOT EXISTS operator_drona_projects(
	id SERIAL PRIMARY KEY NOT NULL,
	operator_drona_id INTEGER NOT NULL,
	projects_id INTEGER NOT NULL,
	FOREIGN KEY (operator_drona_id) REFERENCES operator_drona,
	FOREIGN KEY (projects_id) REFERENCES projects,
	UNIQUE(operator_drona_id, projects_id)
);

CREATE TABLE IF NOT EXISTS drona_senzor(
	id SERIAL PRIMARY KEY NOT NULL,
	drona_id INTEGER NOT NULL,
	senzor_id INTEGER NOT NULL,
	FOREIGN KEY (drona_id) REFERENCES drona,
	FOREIGN KEY (senzor_id) REFERENCES senzor,
	UNIQUE(drona_id, senzor_id)
);

CREATE TABLE drona_projectie_senzor(
	id SERIAL PRIMARY KEY NOT NULL,
	projects_id INTEGER NOT NULL,
	drona_senzor_id INTEGER NOT NULL,
	FOREIGN KEY (projects_id) REFERENCES projects,
	FOREIGN KEY (drona_senzor_id) REFERENCES senzor,
	UNIQUE(projects_id, drona_senzor_id)
);

