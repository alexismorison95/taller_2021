------------------------------------------------------------------------------------------ USUARIOS/ROLES

CREATE USER administrador PASSWORD 'asfAFsaf_@_423a.a';
CREATE USER examinador PASSWORD 'asfAFsaf_@_423a.a';
CREATE USER administrativo PASSWORD 'asfAFsaf_@_423a.a';
CREATE USER sesion_user PASSWORD 'asfAFsaf_@_423a.a';
CREATE USER login_user PASSWORD 'asfAFsaf_@_423a.a';


------------------------------------------------------------------------------------------ PERMISOS

-- ADMINISTRADOR_ROL
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO administrador;
GRANT USAGE, SELECT ON SEQUENCE usuario_id_seq TO administrador;
GRANT USAGE, SELECT ON SEQUENCE prueba_id_seq TO administrador;
GRANT USAGE, SELECT ON SEQUENCE prestamo_id_seq TO administrador;
GRANT USAGE, SELECT ON SEQUENCE periodoutilizable_id_seq TO administrador;
GRANT USAGE, SELECT ON SEQUENCE examinador_id_seq TO administrador;
GRANT USAGE, SELECT ON SEQUENCE equipo_id_seq TO administrador;


-- EXAMINADOR_ROL
GRANT SELECT ON TABLE Equipo, Examinador, PeriodoUtilizable, Prestamo, Prueba, Dominio, Conductor TO examinador;
GRANT INSERT, UPDATE ON TABLE prueba, dominio, conductor, equipo, examinador TO examinador;
GRANT USAGE, SELECT ON SEQUENCE usuario_id_seq TO examinador;
GRANT USAGE, SELECT ON SEQUENCE prueba_id_seq TO examinador;
GRANT USAGE, SELECT ON SEQUENCE examinador_id_seq TO examinador;


-- ADMINISTRATIVO_ROL
GRANT SELECT ON TABLE Usuario, Conductor, Dominio, Equipo, Examinador, PeriodoUtilizable, Prestamo, Prueba TO administrativo;
GRANT UPDATE ON TABLE Prueba TO administrativo;
GRANT USAGE, SELECT ON SEQUENCE usuario_id_seq TO administrativo;
GRANT USAGE, SELECT ON SEQUENCE prueba_id_seq TO administrativo;
GRANT USAGE, SELECT ON SEQUENCE prestamo_id_seq TO administrativo;
GRANT USAGE, SELECT ON SEQUENCE periodoutilizable_id_seq TO administrativo;
GRANT USAGE, SELECT ON SEQUENCE examinador_id_seq TO administrativo;
GRANT USAGE, SELECT ON SEQUENCE equipo_id_seq TO administrativo;


-- LOGIN USER
GRANT SELECT ON TABLE Usuario TO login_user;


-- SESION USER
grant all on table Sesion to sesion_user;