-- FUNCIONES DOMINIO

CREATE OR REPLACE FUNCTION AltaDominio(
	pPatente VARCHAR, 
	pDescripcion VARCHAR
) 
RETURNS SETOF Dominio AS
$$
DECLARE mId VARCHAR;
BEGIN
	INSERT INTO Dominio(patente, descripcion) 
	VALUES (pPatente, pDescripcion) 
	RETURNING Patente INTO mId;
	
	RETURN QUERY SELECT * FROM Dominio WHERE Patente = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarDominio(
	pPatente VARCHAR, 
	pDescripcion VARCHAR
) 
RETURNS SETOF Dominio AS
$$
DECLARE mId VARCHAR;
BEGIN
	UPDATE Dominio 
	SET 
		Descripcion = pDescripcion 
	WHERE 
		Patente = pPatente
	RETURNING Patente INTO mId;	
	
	RETURN QUERY SELECT * FROM Dominio WHERE Patente = mId;
END;
$$
LANGUAGE 'plpgsql';