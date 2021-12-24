-- FUNCIONES EXAMINADOR. ALTA EXAMINADOR YA NO SE HARIA, SE HACE POR MEDIO DE ALTA USUARIO
-- FALTA MODIFICACION. DEBERIA PONERSE EN UN TRIGGER 

-- CREATE OR REPLACE FUNCTION alta_examinador(nombrereal_nuevo varchar, idusuario_nuevo int) RETURNS SETOF examinador AS
-- $$
-- BEGIN
-- 	RETURN QUERY INSERT INTO examinador(nombrereal, idusuario) 
-- 								VALUES (nombrereal_nuevo, idusuario_nuevo) RETURNING *;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaExaminador(pId INT) RETURNS SETOF Examinador AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Examinador 
	SET 
		Activo = false 
	WHERE 
		Id = pId
	RETURNING Id INTO mId;	
	
	RETURN QUERY SELECT * FROM Examinador WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';