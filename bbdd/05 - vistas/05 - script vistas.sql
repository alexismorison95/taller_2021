------------------------------------------------------------------------------------------ VISTAS

-- lista la cantidad de positivos y negativos en la ultima semana
CREATE VIEW VistaCantidadPositivosYNegativosUltimaSemana AS 

	SELECT 
		Fecha,
		SUM(CASE WHEN Resultado = 0.0 THEN 1 ELSE 0 END) AS Negativos,
		SUM(CASE WHEN Resultado > 0.0 THEN 1 ELSE 0 END) AS Positivos
    FROM Prueba
	WHERE 
		Fecha >= CURRENT_DATE - 7 
		AND Fecha <= CURRENT_DATE
	GROUP BY 
		Fecha
	ORDER BY 
		Fecha;

--------------------------


-- lista la cantidad de pruebas en la ultima semana
CREATE VIEW VistaCantidadPruebasUltimaSemana AS 

	SELECT 
		Fecha,
		COUNT(*) AS Cantidad
    FROM prueba
	WHERE 
		Fecha >= CURRENT_DATE - 7 
		AND Fecha <= CURRENT_DATE
	GROUP BY 
		Fecha
	ORDER BY 
		Fecha;
	
--------------------------	

-- vista de los resultados mas altos de pruebas en el ultimo mes
CREATE VIEW VistaResultadosMasAltosUltimoMes AS 

	SELECT
		Fecha,
		MAX(Resultado) AS Resultado
    FROM Prueba
	WHERE 
		Fecha >= CURRENT_DATE - 30 
		AND Fecha <= CURRENT_DATE
	GROUP BY 
		Fecha
	ORDER BY 
		Fecha;
	