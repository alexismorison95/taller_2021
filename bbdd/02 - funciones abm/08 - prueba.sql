-- FUNCIONES Prueba

CREATE OR REPLACE FUNCTION AltaPrueba(
									pFecha DATE, 
									pHora TIME, 
									pNroMuestra INT, 
									pResultado FLOAT, 
									pNroActa INT, 
									pNroRetencion INT, 
									pDNIConductor VARCHAR, 
									pIdDominio VARCHAR, 
									pIdPrestamo INT) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, NroActa, NroRetencion, DNIConductor, IdDominio, IdPrestamo) 
	VALUES (pFecha, pHora, pNroMuestra, pResultado, pNroActa, pNroRetencion, pDNIConductor, pIdDominio, pIdPrestamo)
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarPrueba(
											pId INT, 
											pRechazado BOOLEAN, 
											pDescripcionRechazo VARCHAR) RETURNS INT AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Prueba 
	SET 
		Verificado = true, Rechazado = pRechazado, DescripcionRechazo = pDescripcionRechazo 
	WHERE 
		Id = pId
	RETURNING Id INTO mId;
	
	RETURN mId;
END;
$$
LANGUAGE 'plpgsql';