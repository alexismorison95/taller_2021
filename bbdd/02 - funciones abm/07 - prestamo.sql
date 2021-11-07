-- FUNCIONES Prestamo

CREATE OR REPLACE FUNCTION AltaPrestamo(
										pFechaPrestamo DATE, 
										pHoraPrestamo TIME, 
										pNroInicial INT, 
										pIdExaminador INT, 
										pIdEquipo INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Prestamo(FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) 
	VALUES (pFechaPrestamo, pHoraPrestamo, pNroInicial, pIdExaminador, pIdEquipo) 
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaPrestamo(
										pIdPrestamo INT, 
										pFechaDevolucion DATE, 
										pHoraDevolucion TIME, 
										pNroDevolucion INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Prestamo 
	SET 
		Activo = false, 
		FechaDevolucion = pFechaDevolucion, 
		HoraDevolucion = pHoraDevolucion, 
		NroDevolucion = pNroDevolucion 
	WHERE 
		Id = pIdPrestamo 
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';