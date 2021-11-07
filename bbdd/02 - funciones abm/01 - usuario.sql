-- FUNCIONES USUARIO

CREATE OR REPLACE FUNCTION AltaUsuario(
										pNombreReal VARCHAR, 
										pNombreUsuario VARCHAR, 
										pContrasenia VARCHAR, 
										pIdTipoUsuario INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Usuario(NombreReal, NombreUsuario, Contrasenia, IdTipoUsuario) 
	VALUES (pNombreReal, pNombreUsuario, pContrasenia, pIdTipoUsuario) 
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaUsuario(pId INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	DELETE 
	FROM Usuario 
	WHERE 
		Usuario.Id = pId 
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarUsuario(
											pId INT, 
											pNombreReal VARCHAR, 
											pNombreUsuario VARCHAR, 
											pContrasenia VARCHAR, 
											pIdTipoUsuario INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Usuario 
	SET 
		NombreReal = pNombreReal, 
		NombreUsuario = pNombreUsuario, 
		Contrasenia = pContrasenia, 
		IdTipoUsuario = pIdTipoUsuario 
	WHERE 
		Id = pId 
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';
