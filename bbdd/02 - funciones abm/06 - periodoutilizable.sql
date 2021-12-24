-- FUNCIONES PeriodoUtilizable. FALTA MODIFICACION

CREATE OR REPLACE FUNCTION AltaPeriodoUtilizable(
												pFechaInicio DATE, 
												pFechaVencimiento DATE, 
												pNroIngreso INT, 
												pIdEquipo INT) RETURNS SETOF PeriodoUtilizable AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO PeriodoUtilizable(FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) 
	VALUES (pFechaInicio, pFechaVencimiento, pNroIngreso, pIdEquipo)
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM PeriodoUtilizable WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaPeriodoUtilizable(pIdPeriodoUtilizable INT) RETURNS SETOF PeriodoUtilizable AS
$$
DECLARE mId INT;
BEGIN
	UPDATE PeriodoUtilizable 
	SET 
		Activo = false 
	WHERE 
		Id = pIdPeriodoUtilizable
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM PeriodoUtilizable WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';