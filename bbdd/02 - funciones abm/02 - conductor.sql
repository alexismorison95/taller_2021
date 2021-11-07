-- FUNCIONES CONDUCTOR

CREATE OR REPLACE FUNCTION AltaConductor(
										pDNI VARCHAR, 
										pNombre VARCHAR, 
										pApellido VARCHAR) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Conductor(DNI, Nombre, Apellido) 
	VALUES (pDNI, pNombre, pApellido) 
	RETURNING DNI INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';

----------------------------

CREATE OR REPLACE FUNCTION ModificarConductor(pDNI VARCHAR, pNombre VARCHAR, pApellido VARCHAR) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Conductor 
	SET Nombre = pNombre, Apellido = pApellido 
	WHERE 
		DNI = pDNI 
	RETURNING DNI INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';