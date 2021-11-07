-- FUNCIONES DOMINIO

CREATE OR REPLACE FUNCTION AltaDominio(
										pId varchar, 
										pDescripcion varchar) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Dominio(id, descripcion) 
	VALUES (pId, pDescripcion) 
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarDominio(pId varchar, pDescripcion varchar) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Dominio 
	SET Descripcion = pDescripcion 
	WHERE 
		Id = pId
	RETURNING Id INTO mId;	
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';