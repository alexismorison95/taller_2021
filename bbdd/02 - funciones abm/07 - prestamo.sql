-- FUNCIONES Prestamo

CREATE OR REPLACE FUNCTION AltaPrestamo(
	pFechaPrestamo DATE, 
	pHoraPrestamo TIME, 
	pNroInicial INT, 
	pIdExaminador INT, 
	pIdEquipo INT
) 
RETURNS SETOF Prestamo AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Prestamo(Activo, FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) 
	VALUES (true, pFechaPrestamo, pHoraPrestamo, pNroInicial, pIdExaminador, pIdEquipo) 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Prestamo WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaPrestamo(
	pIdPrestamo INT, 
	pFechaDevolucion DATE, 
	pHoraDevolucion TIME, 
	pNroDevolucion INT
) 
RETURNS SETOF Prestamo AS
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
	
	RETURN QUERY SELECT * FROM Prestamo WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';