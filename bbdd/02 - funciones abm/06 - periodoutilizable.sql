-- FUNCIONES PeriodoUtilizable. FALTA MODIFICACION

CREATE OR REPLACE FUNCTION AltaPeriodoUtilizable(
												pFechaInicio DATE, 
												pFechaVencimiento DATE, 
												pNroIngreso INT, 
												pIdEquipo INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO PeriodoUtilizable(FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) 
	VALUES (pFechaInicio, pFechaVencimiento, pNroIngreso, pIdEquipo)
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaPeriodoUtilizable(pIdPeriodoUtilizable INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	UPDATE PeriodoUtilizable 
	SET Activo = false 
	WHERE 
		Id = pIdPeriodoUtilizable
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';