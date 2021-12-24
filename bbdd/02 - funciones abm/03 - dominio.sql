-- FUNCIONES DOMINIO

CREATE OR REPLACE FUNCTION AltaDominio(
										pId VARCHAR, 
										pDescripcion VARCHAR) RETURNS SETOF Dominio AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Dominio(id, descripcion) 
	VALUES (pId, pDescripcion) 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Dominio WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarDominio(
											pId VARCHAR, 
											pDescripcion VARCHAR) RETURNS SETOF Dominio AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Dominio 
	SET 
		Descripcion = pDescripcion 
	WHERE 
		Id = pId
	RETURNING Id INTO mId;	
	
	RETURN QUERY SELECT * FROM Dominio WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';