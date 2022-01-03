-- FUNCIONES CONDUCTOR

CREATE OR REPLACE FUNCTION AltaConductor(
										pDNI VARCHAR, 
										pNombre VARCHAR, 
										pApellido VARCHAR) RETURNS SETOF Conductor AS
$$
DECLARE mId VARCHAR;
BEGIN
	INSERT INTO Conductor(DNI, Nombre, Apellido) 
	VALUES (pDNI, pNombre, pApellido) 
	RETURNING DNI INTO mId;
	
	RETURN QUERY SELECT * FROM Conductor WHERE DNI = mId;
END;
$$
LANGUAGE 'plpgsql';

----------------------------

CREATE OR REPLACE FUNCTION ModificarConductor(
											pDNI VARCHAR, 
											pNombre VARCHAR, 
											pApellido VARCHAR) RETURNS SETOF Conductor AS
$$
DECLARE mId VARCHAR;
BEGIN
	UPDATE Conductor 
	SET 
		Nombre = pNombre, 
		Apellido = pApellido 
	WHERE 
		DNI = pDNI 
	RETURNING DNI INTO mId;
	
	RETURN QUERY SELECT * FROM Conductor WHERE DNI = mId;
END;
$$
LANGUAGE 'plpgsql';