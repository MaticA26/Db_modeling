CREATE TABLE IF NOT EXISTS parcuri_judete(
	parcuri_id INTEGER, --FK
	Judete_id INTEGER, --FK
	FOREIGN KEY(parcuri_id) REFERENCES parcuri,
	FOREIGN KEY(Judete_id) REFERENCES Judete,
	PRIMARY KEY(parcuri_id, Judete_id)
);

SELECT * FROM parcuri_judete