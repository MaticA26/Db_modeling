CREATE TABLE IF NOT EXISTS Judete(
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(50)NOT NULL,
	indicativ CHAR(2) NOT NULL,
	edited DATE DEFAULT NOW()
	
);

INSERT INTO judete(name, indicativ) VALUES ('Timis','TM');

SELECT * FROM Judete;