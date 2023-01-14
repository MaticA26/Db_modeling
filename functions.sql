--FUNCTIONS DEFINITION

create function deactivate_unpaid_accounts() return void

LANGUAGE SQL 

AS $$ 

	UPDATE accounts SET active = false WHERE balance < 0;

$$;

-- EXEMPLE

CREATE FUNCTION deactivate_unpaid_accounts() RETURNS void

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







