------------------------------------------------------------------------------------------ REPORTES

-- historial por dominio
CREATE OR REPLACE FUNCTION ReportePorDominio(
	pIdDominio 	VARCHAR, 
	pVerificado BOOLEAN
) 
RETURNS TABLE (
	Fecha 				DATE,
	Hora 				TIME,
	NroMuestra 			INT,
	Resultado 			FLOAT,
	NroActa 			INT,
	NroRetencion 		INT,
	NombreExaminador 	VARCHAR(250)
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		P.Fecha,
		P.Hora,
		P.NroMuestra,
		P.Resultado,
		P.NroActa,
		P.NroRetencion,
		E.NombreReal AS NombreExaminador
	FROM Prueba P
	INNER JOIN Prestamo PO
		ON PO.Id = P.IdPrestamo
	INNER JOIN Examinador E
		ON E.Id = PO.IdExminador
	WHERE 
		P.IdDominio = pIdDominio
		-- si es null trae todas las pruebas
		AND (pVerificado IS NULL OR P.Verificado = pVerificado);
END;
$$
LANGUAGE 'plpgsql';

--------------------------

-- historial por dni
CREATE OR REPLACE FUNCTION ReportePorDNI(
	pDNI 		VARCHAR, 
	pVerificado BOOLEAN
)  
RETURNS TABLE (
	Fecha 				DATE,
	Hora 				TIME,
	NroMuestra 			INT,
	Resultado 			FLOAT,
	NroActa 			INT,
	NroRetencion 		INT,
	NombreExaminador 	VARCHAR(250)
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		P.Fecha,
		P.Hora,
		P.NroMuestra,
		P.Resultado,
		P.NroActa,
		P.NroRetencion,
		E.NombreReal AS NombreExaminador
	FROM Prueba P
	INNER JOIN Prestamo PO
		ON PO.Id = P.IdPrestamo
	INNER JOIN Examinador E
		ON E.Id = PO.IdExminador
	WHERE 
		P.DNIConductor = pDNI
		-- si es null trae todas las pruebas
		AND (pVerificado IS NULL OR P.Verificado = pVerificado);
END;
$$
LANGUAGE 'plpgsql';

--------------------------

-- historial entre fechas
CREATE OR REPLACE FUNCTION ReporteEntreFechas(
	pFechaDesde DATE, 
	pFechaHasta DATE,
	pVerificado BOOLEAN
)
RETURNS TABLE (
	Fecha 				DATE,
	Hora 				TIME,
	NroMuestra 			INT,
	Resultado 			FLOAT,
	NroActa 			INT,
	NroRetencion 		INT,
	NombreExaminador 	VARCHAR,
	Patente 			VARCHAR,
	Descripcion 		VARCHAR,
	DNI 				VARCHAR,
	NombreConductor 	VARCHAR
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		P.Fecha,
		P.Hora,
		P.NroMuestra,
		P.Resultado,
		P.NroActa,
		P.NroRetencion,
		E.NombreReal AS NombreExaminador,
		D.Patente,
		D.Descripcion,
		C.DNI,
		CONCAT(C.Nombre, ' ', C.Apellido) AS NombreConductor
	FROM Prueba P
	INNER JOIN Prestamo PO
		ON PO.Id = P.IdPrestamo
	INNER JOIN Examinador E
		ON E.Id = PO.IdExminador
	INNER JOIN Dominio D
		ON D.Patente = P.IDDominio
	INNER JOIN Conductor C
		ON C.DNI = P.DNIConductor
	WHERE 
		P.Fecha BETWEEN pFechaDesde AND pFechaHasta
		-- si es null trae todas las pruebas
		AND (pVerificado IS NULL OR P.Verificado = pVerificado);
END;
$$
LANGUAGE 'plpgsql';


-- cantidad de pruebas, positivas y negativas entre fechas agrupado por examinador
CREATE OR REPLACE FUNCTION ReporteEntreFechasPorExaminador(
	pFechaDesde 	DATE, 
	pFechaHasta 	DATE,
	pIdExaminador 	INT,
	pVerificado 	BOOLEAN
)
RETURNS TABLE (
	NombreExaminador 	VARCHAR,
	CantidadPruebas 	INT,
	CantidadPositivos 	INT,
	CantidadNegativos 	INT,
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		E.NombreReal 									AS NombreExaminador,
		COUNT(*) 										AS CantidadPruebas,
		SUM(WHEN P.Resultado > 0.0 THEN 1 ELSE 0 END) 	AS CantidadPositivos,
		SUM(WHEN P.Resultado = 0.0 THEN 1 ELSE 0 END) 	AS CantidadNegativos
	FROM Prueba P
	INNER JOIN Prestamo PO
		ON PO.Id = P.IdPrestamo
	INNER JOIN Examinador E
		ON E.Id = PO.IdExminador
	WHERE 
		P.Fecha BETWEEN pFechaDesde AND pFechaHasta
		-- si es null trae todas las pruebas
		AND (pVerificado IS NULL OR P.Verificado = pVerificado)
		-- si no se pasa ningun examinador evalua todos
		AND (pIdExaminador IS NULL OR P.IdExaminador = pIdExaminador)
	GROUP BY
		E.NombreReal
	ORDER BY
		E.NombreReal;
END;
$$
LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------ REPORTES GRAFICOS

-- cantidad de controles entre fechas
CREATE OR REPLACE FUNCTION ReporteEntreFechasCantidadControles(
	pFechaDesde DATE, 
	pFechaHasta DATE,
	pVerificado BOOLEAN
) 
RETURNS TABLE (
	Fecha 		DATE,
	Cantidad 	INT
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		Prueba.Fecha,
		COUNT(*) AS Cantidad
	FROM Prueba
	WHERE 
		Prueba.fecha BETWEEN pFechaDesde AND pFechaHasta
		-- si es null trae todas las pruebas
		AND (pVerificado IS NULL OR P.Verificado = pVerificado)
	GROUP BY
		Prueba.Fecha
	ORDER BY
		Prueba.Fecha;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

-- cantidad de controles entre meses del mismo año
-- CREATE OR REPLACE FUNCTION reporte_entre_meses_cant_controles(fecha1 DATE, fecha2 DATE,
															-- OUT cantidad BIGINT, OUT mes DOUBLE PRECISION) 
-- RETURNS SETOF record AS
-- $$
-- BEGIN
	-- RETURN QUERY SELECT COUNT (*) AS cantidad, EXTRACT(MONTH FROM Prueba.fecha) AS mes
        		 -- FROM Prueba
      			 -- WHERE Prueba.fecha >= fecha1 AND Prueba.fecha <= fecha2
    			 -- GROUP BY EXTRACT(MONTH FROM Prueba.fecha)
				 -- ORDER BY EXTRACT(MONTH FROM Prueba.fecha);
-- END;
-- $$
-- LANGUAGE 'plpgsql';

--select count(*), extract(month from Prueba.fecha) as mes from Prueba group by extract(month from Prueba.fecha)

--------------------------

-- cantidad de controles entre años
-- CREATE OR REPLACE FUNCTION reporte_entre_anios_cant_controles(anio1 DOUBLE PRECISION, anio2 DOUBLE PRECISION, 
															-- OUT cantidad BIGINT, OUT anio DOUBLE PRECISION) 
-- RETURNS SETOF record AS
-- $$
-- BEGIN
	-- RETURN QUERY SELECT COUNT (*) AS cantidad, EXTRACT(YEAR FROM Prueba.fecha) AS anio
        		 -- FROM Prueba
      			 -- WHERE EXTRACT(YEAR FROM Prueba.fecha) >= anio1 AND EXTRACT(YEAR FROM Prueba.fecha) <= anio2
    			 -- GROUP BY EXTRACT(YEAR FROM Prueba.fecha)
				 -- ORDER BY EXTRACT(YEAR FROM Prueba.fecha);
-- END;
-- $$
-- LANGUAGE 'plpgsql';

--------------------------

-- cantidad de test positivos y negativos entre fechas, agrupados por mes
-- MISMO AÑO
CREATE OR REPLACE FUNCTION ReporteEntreFechasCantidadPositivosYNegativosPorMes(
	pFechaDesde DATE, 
	pFechaHasta DATE
) 
RETURNS TABLE (
	Mes 		NUMERIC, 
	Negativos 	BIGINT, 
	Positivos 	BIGINT
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		EXTRACT(MONTH FROM Fecha) 							AS Mes,
		SUM(CASE WHEN Resultado = 0.0 THEN 1 ELSE 0 END) 	AS Negativos,
		SUM(CASE WHEN Resultado > 0.0 THEN 1 ELSE 0 END) 	AS Positivos
	 FROM Prueba
	 WHERE 
		Fecha BETWEEN pFechaDesde AND pFechaHasta
	 GROUP BY 
		EXTRACT(MONTH FROM Fecha)
	 ORDER BY 
		EXTRACT(MONTH FROM Fecha);
END;
$$
LANGUAGE 'plpgsql';

---------------------------

-- cantidad de test positivos y negativos entre meses del mismo año
-- CREATE OR REPLACE FUNCTION ReporteEntreMesesCantidadPositivosYNegativos(
																		-- pAnio DOUBLE PRECISION, 
																		-- pMesDesde DOUBLE PRECISION, 
																		-- mes2 DOUBLE PRECISION, 
																		-- OUT negativos BIGINT, 
																		-- OUT positivos BIGINT, 
																		-- OUT mes DOUBLE PRECISION) 
-- RETURNS SETOF record AS
-- $$
-- BEGIN
	-- RETURN QUERY SELECT SUM(CASE WHEN a.resultado = 0.0 THEN 1 ELSE 0 END) AS negativos,
						-- SUM(CASE WHEN a.resultado > 0.0 THEN 1 ELSE 0 END) AS positivos, 
						-- EXTRACT(MONTH FROM a.fecha) AS mes
				 -- FROM
				 	-- (SELECT * FROM Prueba
					 -- WHERE EXTRACT(YEAR FROM Prueba.fecha) = anio) as a
				 -- WHERE EXTRACT(MONTH FROM a.fecha) >= mes1 AND EXTRACT(MONTH FROM a.fecha) <= mes2
				 -- GROUP BY EXTRACT(MONTH FROM a.fecha)
				 -- ORDER BY EXTRACT(MONTH FROM a.fecha);
-- END;
-- $$
-- LANGUAGE 'plpgsql';

--------------------------

-- cantidad de test positivos y negativos entre años
-- CREATE OR REPLACE FUNCTION reporte_entre_anios_cant_pos_neg(anio1 DOUBLE PRECISION, anio2 DOUBLE PRECISION, 
															-- OUT negativos BIGINT, OUT positivos BIGINT, 
															-- OUT anio DOUBLE PRECISION) 
-- RETURNS SETOF record AS
-- $$
-- BEGIN
	-- RETURN QUERY SELECT SUM(CASE WHEN resultado = 0.0 THEN 1 ELSE 0 END) AS negativos,
						-- SUM(CASE WHEN resultado > 0.0 THEN 1 ELSE 0 END) AS positivos, 
						-- EXTRACT(YEAR FROM Prueba.fecha) AS anio
        		 -- FROM Prueba
      			 -- WHERE EXTRACT(YEAR FROM Prueba.fecha) >= anio1 AND EXTRACT(YEAR FROM Prueba.fecha) <= anio2
				 -- GROUP BY EXTRACT(YEAR FROM Prueba.fecha)
				 -- ORDER BY EXTRACT(YEAR FROM Prueba.fecha);
-- END;
-- $$
-- LANGUAGE 'plpgsql';


--------------------------

-- promedio de graduaciones entre fechas, agrupados por mes
-- MISMO AÑO
CREATE OR REPLACE FUNCTION ReporteEntreFechasPromedioGraduacionesPorMes(
	pFechaDesde DATE, 
	pFechaHasta DATE
)
RETURNS TABLE (
	Mes 		NUMERIC, 
	Promedio  	DOUBLE PRECISION
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		EXTRACT(MONTH FROM Fecha) 	AS Mes,
		AVG(Resultado) 				AS Promedio
    FROM Prueba
	WHERE 
		Fecha BETWEEN pFechaDesde AND pFechaHasta
	GROUP BY 
		EXTRACT(MONTH FROM Fecha)
	ORDER BY 
		EXTRACT(MONTH FROM Fecha);
END;
$$
LANGUAGE 'plpgsql';

--------------------------

-- promedio de graduaciones entre meses del mismo año??
-- CREATE OR REPLACE FUNCTION reporte_entre_meses_graduaciones(anio DOUBLE PRECISION, mes1 DOUBLE PRECISION, 
															-- mes2 DOUBLE PRECISION, 
															-- OUT promedio DOUBLE PRECISION, 
															-- OUT mes DOUBLE PRECISION) 
-- RETURNS SETOF record AS
-- $$
-- BEGIN
	-- RETURN QUERY SELECT (SUM(a.resultado)/COUNT (*)) AS promedio, EXTRACT(MONTH FROM a.fecha) AS mes
        		 -- FROM (SELECT * FROM Prueba
					   -- WHERE EXTRACT(YEAR FROM Prueba.fecha) = anio) as a
      			 -- WHERE EXTRACT(MONTH FROM a.fecha) >= mes1 AND EXTRACT(MONTH FROM a.fecha) <= mes2
    			 -- GROUP BY EXTRACT(MONTH FROM a.fecha)
				 -- ORDER BY EXTRACT(MONTH FROM a.fecha);
-- END;
-- $$
-- LANGUAGE 'plpgsql';

--------------------------

-- promedio de graduaciones entre años??
-- CREATE OR REPLACE FUNCTION reporte_entre_anios_graduaciones(anio1 DOUBLE PRECISION, anio2 DOUBLE PRECISION, 
															-- OUT promedio DOUBLE PRECISION, 
															-- OUT anio DOUBLE PRECISION) 
-- RETURNS SETOF record AS
-- $$
-- BEGIN
	-- RETURN QUERY SELECT (SUM(Prueba.resultado)/COUNT (*)) AS promedio, EXTRACT(YEAR FROM Prueba.fecha) AS anio
        		 -- FROM Prueba
      			 -- WHERE EXTRACT(YEAR FROM Prueba.fecha) >= anio1 AND EXTRACT(YEAR FROM Prueba.fecha) <= anio2
    			 -- GROUP BY EXTRACT(YEAR FROM Prueba.fecha)
				 -- ORDER BY EXTRACT(YEAR FROM Prueba.fecha);
-- END;
-- $$
-- LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION ReporteEntreFechasPromedioGraduacionesPorAnio(
	pFechaDesde DATE, 
	pFechaHasta DATE
) 
RETURNS TABLE (
	Anio 		NUMERIC, 
	Promedio  	DOUBLE PRECISION
) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		EXTRACT(YEAR FROM Fecha) AS Anio,
		AVG(Resultado) AS Promedio
    FROM Prueba
    WHERE 
		Fecha BETWEEN pFechaDesde AND pFechaHasta
    GROUP BY 
		EXTRACT(YEAR FROM Fecha)
	ORDER BY 
		EXTRACT(YEAR FROM Fecha);
END;
$$
LANGUAGE 'plpgsql';

