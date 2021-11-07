-- CARGAR POR PARTES!!!!

-- TIPO USUARIO

INSERT INTO TipoUsuario(TipoUsuario) VALUES ('administrador');
INSERT INTO TipoUsuario(TipoUsuario) VALUES ('administrativo');
INSERT INTO TipoUsuario(TipoUsuario) VALUES ('examinador');


-- USUARIO

INSERT INTO Usuario(NombreReal, NombreUsuario, Contrasenia, IdTipoUsuario) 
VALUES ('admin cuenta', 'admin', 'demo', 1);

INSERT INTO Usuario(NombreReal, NombreUsuario, Contrasenia, IdTipoUsuario) 
VALUES ('administrativo cuenta', 'administrativo', 'demo', 2);

INSERT INTO Usuario(NombreReal, NombreUsuario, Contrasenia, IdTipoUsuario) 
VALUES ('cosso carlos', 'examinador1', 'demo', 3);

INSERT INTO Usuario(NombreReal, NombreUsuario, Contrasenia, IdTipoUsuario) 
VALUES ('morison hernan', 'examinador2', 'demo', 3);

INSERT INTO Usuario(NombreReal, NombreUsuario, Contrasenia, IdTipoUsuario) 
VALUES ('kloss laura', 'examinador3', 'demo', 3);


-- CONDUCTOR

INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('38386790', 'alexis', 'morison');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('39346678', 'carla', 'monzon');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('28504932', 'monica', 'gobbi');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('19496583', 'ramiro', 'sanchez');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('37495039', 'jorge', 'delfino');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('23466886', 'alexis', 'rein');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('28768456', 'juan', 'mendez');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('35675677', 'pablo', 'cosso');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('38452433', 'silvina', 'pereyra');
INSERT INTO Conductor(DNI, Nombre, Apellido) VALUES ('28656432', 'gisela', 'morana');


-- DOMINIO

INSERT INTO Dominio(Id, Descripcion) VALUES ('ab 123 cd', 'auto ford fiesta azul');
INSERT INTO Dominio(Id, Descripcion) VALUES ('ab 567 cd', 'camioneta volkswagen amarok gris');
INSERT INTO Dominio(Id, Descripcion) VALUES ('a 123 bcd', 'motocicleta honda cbr naranja');
INSERT INTO Dominio(Id, Descripcion) VALUES ('b 456 acd', 'motocicleta yamaha fz azul');
INSERT INTO Dominio(Id, Descripcion) VALUES ('nvz 087', 'auto peugeot 206 blanco');
INSERT INTO Dominio(Id, Descripcion) VALUES ('ab 076 sd', 'auto peugeot 308 rojo');
INSERT INTO Dominio(Id, Descripcion) VALUES ('b 067 dfs', 'motocicleta motomel dlx deluxe azul');
INSERT INTO Dominio(Id, Descripcion) VALUES ('b 456 sdd', 'motocicleta rouser bajaj 220 amarilla');


-- EXAMINADOR

-- INSERT INTO examinador(nombre, apellido, idusuario) VALUES ('cosso carlos', 3);
-- INSERT INTO examinador(nombre, apellido, idusuario) VALUES ('morison alexis', 4);
-- INSERT INTO examinador(nombre, apellido, idusuario) VALUES ('kloss laura', 5);


-- EQUIPO

INSERT INTO Equipo(Nombre) VALUES ('ymc055');
INSERT INTO Equipo(Nombre) VALUES ('zvc344');
INSERT INTO Equipo(Nombre) VALUES ('ymc056');


-- PERIODOUTILIZABLE

INSERT INTO PeriodoUtilizable(FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) 
VALUES ('01/11/2021', '06/11/2022', 2040, 1);

INSERT INTO PeriodoUtilizable(FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) 
VALUES ('01/11/2021', '06/11/2022', 1234, 2);

INSERT INTO PeriodoUtilizable(FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) 
VALUES ('01/11/2021', '06/11/2022', 4555, 3);


-- PRESTAMO

INSERT INTO Prestamo(FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) 
VALUES ('01/11/2021', '09:30', 2040, 1, 1);

INSERT INTO Prestamo(FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) 
VALUES ('02/11/2021', '18:30', 1234, 2, 2);

INSERT INTO Prestamo(FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) 
VALUES ('03/11/2021', '09:30', 4555, 3, 3);


-- PRUEBA

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, NroActa, NroRetencion, DNIConductor, IdDominio, IdPrestamo)
VALUES ('03/11/2021', '20:35', 4555, 1.5, 2345, 3457, '38386790', 'ab 123 cd', 3);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('03/11/2021', '17:35', 4556, 0.0, '38386790', 'ab 567 cd', 3);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, NroActa, NroRetencion, DNIConductor, IdDominio, IdPrestamo)
VALUES ('1/11/2021', '21:26', 2040, 0.5, 4567, 7899, '39346678', 'a 123 bcd', 1);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('1/11/2021', '21:30', 2041, 0.0, '28504932', 'ab 123 cd', 1);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('02/11/2021', '21:36', 1234, 0.0, '19496583', 'b 456 acd', 2);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, NroActa, NroRetencion, DNIConductor, IdDominio, IdPrestamo)
VALUES ('03/11/2021', '17:35', 4557, 2.0, 5677, 2344, '23466886', 'b 456 sdd', 3);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('03/11/2021', '17:40', 4558, 0.0, '28768456', 'b 067 dfs', 3);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, NroActa, NroRetencion, DNIConductor, IdDominio, IdPrestamo)
VALUES ('1/11/2021', '17:40', 2042, 1.7, 6788, 3456, '35675677', 'ab 076 sd', 1);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('1/11/2021', '17:50', 2043, 0.0, '38386790', 'ab 123 cd', 1);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('03/11/2021', '22:00', 4559, 0.0, '37495039', 'b 456 acd', 3);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, NroActa, NroRetencion, DNIConductor, IdDominio, IdPrestamo)
VALUES ('02/11/2021', '21:36', 1235, 1.3, 23445, 4577, '38452433', 'ab 076 sd', 2);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, NroActa, NroRetencion, DNIConductor, IdDominio, IdPrestamo)
VALUES ('02/11/2021', '21:45', 1236, 0.6, 6788, 3456, '28656432', 'nvz 087', 2);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('02/11/2021', '22:00', 1237, 0.0, '19496583', 'b 456 acd', 2);

INSERT INTO Prueba(Fecha, Hora, NroMuestra, Resultado, DNIConductor, IdDominio, IdPrestamo)
VALUES ('1/11/2021', '23:50', 2045, 0.0, '28656432', 'nvz 087', 1);


