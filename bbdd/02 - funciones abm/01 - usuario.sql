-- FUNCIONES USUARIO

CREATE OR REPLACE FUNCTION AltaUsuario(
	pNombreReal VARCHAR, 
	pNombreUsuario VARCHAR, 
	pContrasenia VARCHAR, 
	pTipoUsuario VARCHAR
) 
RETURNS SETOF Usuario AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Usuario(NombreReal, NombreUsuario, Contrasenia, TipoUsuario) 
	VALUES (pNombreReal, pNombreUsuario, pContrasenia, pTipoUsuario) 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Usuario WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaUsuario(pId INT) 
RETURNS SETOF Usuario AS
$$
DECLARE mUsuario Usuario;
BEGIN
	DELETE 
	FROM Usuario 
	WHERE 
		Usuario.Id = pId 
	RETURNING Id, NombreReal, NombreUsuario, Contrasenia, TipoUsuario INTO mUsuario;
	
	RETURN NEXT mUsuario;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarUsuario(
	pId INT, 
	pNombreReal VARCHAR, 
	pNombreUsuario VARCHAR, 
	pContrasenia VARCHAR, 
	pTipoUsuario VARCHAR
) 
RETURNS SETOF Usuario AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Usuario 
	SET 
		NombreReal = pNombreReal, 
		NombreUsuario = pNombreUsuario, 
		Contrasenia = pContrasenia, 
		TipoUsuario = pTipoUsuario 
	WHERE 
		Id = pId 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Usuario WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';
