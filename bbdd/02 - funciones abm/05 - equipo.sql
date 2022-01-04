-- FUNCIONES Equipo

CREATE OR REPLACE FUNCTION AltaEquipo(pNombre varchar) RETURNS SETOF Equipo AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Equipo(Nombre, Activo) 
	VALUES (pNombre, false) 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Equipo WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaEquipo(pId INT) RETURNS SETOF Equipo AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Equipo 
	SET 
		Activo = false 
	WHERE 
		Id = pId 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Equipo WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

-------------------------

CREATE OR REPLACE FUNCTION ModificarEquipo(
	pId INT, 
	pNombre varchar
) 
RETURNS SETOF Equipo AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Equipo 
	SET Nombre = pNombre 
	WHERE 
		Id = pId 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Equipo WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';