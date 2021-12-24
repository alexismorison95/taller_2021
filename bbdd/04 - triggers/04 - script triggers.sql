------------------------------------------------------------------------------------------ TRIGGERS


-- al dar de alta un nuevo periodo utilizable, 
-- actualizar el nroactual del equipo y activarlo
CREATE OR REPLACE FUNCTION ActualizarNroActualEquipoAltaPeriodoUtilizable() RETURNS TRIGGER AS
$$
BEGIN
	UPDATE Equipo 
	SET 
		NroActual = NEW.NroIngreso, 
		Activo = true 
	WHERE Id = NEW.IdEquipo;
 
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER ActualizarPeriodoUtilizableTRIGGER AFTER INSERT ON PeriodoUtilizable
FOR EACH ROW EXECUTE PROCEDURE ActualizarNroActualEquipoAltaPeriodoUtilizable();


----------------------------------

-- al dar de alta una nueva prueba, actualizar el nroactual del equipo
CREATE OR REPLACE FUNCTION ActualizarNroActualEquipoAltaPrueba() RETURNS TRIGGER AS
$$
DECLARE mId INT;
BEGIN
	SELECT 
		IdEquipo INTO mId 
	FROM Prestamo 
	WHERE 
		Id = NEW.IdPrestamo;

	UPDATE Equipo 
	SET NroActual = NroActual + 1 
	WHERE Id = mId;
 
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER AltaPruebaActualizarNroActualEquipoTRIGGER AFTER INSERT ON Prueba
FOR EACH ROW EXECUTE PROCEDURE ActualizarNroActualEquipoAltaPrueba();




-------------------------------------------------------------------- CONTROLES LOGICOS DE INTEGRIDAD Y REDUNDANCIA


-- VALIDACIONES DE INSERT

-- USUARIO
-- CREATE OR REPLACE FUNCTION insertar_usuario() RETURNS TRIGGER AS
-- $$
-- BEGIN

	-- NEW.nombreReal = LOWER(NEW.nombreReal);
	
	-- NEW.tipousuario = LOWER(NEW.tipousuario);

	-- RETURN NEW;

-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER insertar_usuario_TRIGGER BEFORE INSERT ON usuario
-- FOR EACH ROW EXECUTE PROCEDURE insertar_usuario();

----------

-- Se ejecuta cuando se inserta un usuario de tipo examinador (3)
CREATE OR REPLACE FUNCTION InsertarUsuarioExaminador() RETURNS TRIGGER AS
$$
BEGIN
	IF NEW.TipoUsuario = 'examinador' THEN
		
		INSERT INTO Examinador(NombreReal, IdUsuario) 
		VALUES (NEW.NombreReal, NEW.Id);
		
	END IF;

	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER InsertarUsuarioExaminadorTRIGGER AFTER INSERT ON Usuario
FOR EACH ROW EXECUTE PROCEDURE InsertarUsuarioExaminador();

----------

-- al editar usuarios, si se le asigna el tipo examinador (3), 
-- hay que insertarlo en la tabla examinador
CREATE OR REPLACE FUNCTION EditarUsuarioExaminador() RETURNS TRIGGER AS
$$
BEGIN
	IF NEW.IdTipoUsuario = 3 THEN
		
		INSERT INTO Examinador(NombreReal, IdUsuario) 
		VALUES (NEW.NombreReal, NEW.Id);
		
	END IF;

	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER EditarUsuarioExaminadorTRIGGER BEFORE UPDATE ON Usuario
FOR EACH ROW EXECUTE PROCEDURE EditarUsuarioExaminador();

-------

-- al eliminar usuario, si es examinador (3), darlo de baja en la tabla
CREATE OR REPLACE FUNCTION EliminarUsuarioExaminador() RETURNS TRIGGER AS
$$
BEGIN
	IF OLD.IdTipoUsuario = 3 THEN
		
		UPDATE Examinador 
		SET 
			Activo = false, 
			IdUsuario = null 
		WHERE 
			OLD.Id = IdUsuario;
		
	END IF;

	RETURN OLD;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER EliminarUsuarioExaminadorTRIGGER BEFORE DELETE ON Usuario
FOR EACH ROW EXECUTE PROCEDURE EliminarUsuarioExaminador();


----------------------------------

-- -- CONDUCTOR
-- CREATE OR REPLACE FUNCTION insertar_conductor() RETURNS TRIGGER AS
-- $$
-- BEGIN

	-- NEW.nombre = LOWER(NEW.nombre);
	
	-- NEW.apellido = LOWER(NEW.apellido);
 
	-- RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER insertar_conductor_TRIGGER BEFORE INSERT ON conductor
-- FOR EACH ROW EXECUTE PROCEDURE insertar_conductor();


----------------------------------

-- DOMINIO
-- CREATE OR REPLACE FUNCTION insertar_dominio() RETURNS TRIGGER AS
-- $$
-- BEGIN

	-- NEW.descripcion = LOWER(NEW.descripcion);
 
	-- RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER insertar_dominio_TRIGGER BEFORE INSERT ON dominio
-- FOR EACH ROW EXECUTE PROCEDURE insertar_dominio();


----------------------------------

-- EXAMINADOR
-- CREATE OR REPLACE FUNCTION insertar_examinador() RETURNS TRIGGER AS
-- $$
-- BEGIN

-- 	NEW.nombre = LOWER(NEW.nombre);
	
-- 	NEW.apellido = LOWER(NEW.apellido);
 
-- 	RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER insertar_examinador_TRIGGER BEFORE INSERT ON examinador
-- FOR EACH ROW EXECUTE PROCEDURE insertar_examinador();


----------------------------------

-- EQUIPO
-- CREATE OR REPLACE FUNCTION insertar_equipo() RETURNS TRIGGER AS
-- $$
-- BEGIN

	-- NEW.nombre = LOWER(NEW.nombre);
	
	-- IF NEW.nroactual = 0 THEN
		
		-- RAISE EXCEPTION 'El número actual del equipo debe ser distinto de cero.';
		
	-- END IF;
 	
	-- RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER insertar_equipo_TRIGGER BEFORE INSERT ON equipo
-- FOR EACH ROW EXECUTE PROCEDURE insertar_equipo();


----------------------------------


-- VALIDACION DE ACTUALIZACION DE LAS PRUEBAS

-- CREATE OR REPLACE FUNCTION verificar_prueba() RETURNS TRIGGER AS
-- $$
-- DECLARE
	-- id_usuario integer;
-- BEGIN
	
	-- IF NEW.verificado = false THEN
		
		-- RAISE EXCEPTION 'El estado de verificado debe ser true.';
		
	-- END IF;
	
	-- NEW.descripcionrechazo = LOWER(NEW.descripcionrechazo);
	
	-- RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER verificar_prueba_TRIGGER BEFORE UPDATE ON prueba
-- FOR EACH ROW EXECUTE PROCEDURE verificar_prueba();












