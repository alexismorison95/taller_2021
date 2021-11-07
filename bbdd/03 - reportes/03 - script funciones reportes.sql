------------------------------------------------------------------------------------------ REPORTES

-- historial por dominio
CREATE OR REPLACE FUNCTION ReportePorDominio(pIdDominio VARCHAR) RETURNS SETOF Prueba AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		* 
	FROM Prueba 
	WHERE 
		Prueba.IdDominio = pIdDominio;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

-- historial por dni
CREATE OR REPLACE FUNCTION ReportePorDNI(pDNI VARCHAR) RETURNS SETOF Prueba AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		* 
	FROM Prueba 
	WHERE 
		Prueba.DNIConductor = pDNI;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

-- historial entre fechas
CREATE OR REPLACE FUNCTION ReporteEntreFechas(
												pFechaDesde DATE, 
												pFechaHasta DATE) RETURNS SETOF Prueba AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		* 
	FROM Prueba 
	WHERE 
		Prueba.Fecha >= pFechaDesde 
		AND Prueba.Fecha <= pFechaHasta;
END;
$$
LANGUAGE 'plpgsql';



------------------------------------------------------------------------------------------ REPORTES GRAFICOS

-- cantidad de controles entre fechas
CREATE OR REPLACE FUNCTION ReporteEntreFechasCantidadControles(
																pFechaDesde DATE, 
																pFechaHasta DATE) RETURNS SETOF BIGINT AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		COUNT(*) AS Cantidad
	FROM Prueba
	WHERE 
		Prueba.fecha >= pFechaDesde 
		AND Prueba.fecha <= pFechaHasta;
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
																		pFechaHasta DATE) 
																		RETURNS TABLE (
																			Mes NUMERIC, 
																			Negativos BIGINT, 
																			Positivos BIGINT) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		EXTRACT(MONTH FROM Fecha) AS Mes,
		SUM(CASE WHEN Resultado = 0.0 THEN 1 ELSE 0 END) AS Negativos,
		SUM(CASE WHEN Resultado > 0.0 THEN 1 ELSE 0 END) AS Positivos
	 FROM Prueba
	 WHERE 
		Fecha >= pFechaDesde 
		AND Fecha <= pFechaHasta
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
																	pFechaHasta DATE)
																	RETURNS TABLE (
																		Mes NUMERIC, 
																		Promedio  DOUBLE PRECISION) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		EXTRACT(MONTH FROM Fecha) AS Mes,
		AVG(Resultado) AS Promedio
    FROM Prueba
	WHERE 
		Fecha >= pFechaDesde 
		AND Fecha <= pFechaHasta
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
																	pFechaHasta DATE) 
																	RETURNS TABLE (
																		Anio NUMERIC, 
																		Promedio  DOUBLE PRECISION) AS
$$
BEGIN
	RETURN QUERY 
	SELECT 
		EXTRACT(YEAR FROM Fecha) AS Anio,
		AVG(Resultado) AS Promedio
    FROM Prueba
    WHERE 
		Fecha >= pFechaDesde 
		AND Fecha <= pFechaHasta
    GROUP BY 
		EXTRACT(YEAR FROM Fecha)
	ORDER BY 
		EXTRACT(YEAR FROM Fecha);
END;
$$
LANGUAGE 'plpgsql';

