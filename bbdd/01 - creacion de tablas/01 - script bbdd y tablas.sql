--create database alcoholemia;

------------------------------------------------------------------------------------------ TABLAS

CREATE TABLE TipoUsuario (
	Id SERIAL PRIMARY KEY,
	TipoUsuario VARCHAR
);

CREATE TABLE Usuario (
	Id SERIAL PRIMARY KEY,
	NombreReal VARCHAR NOT NULL,
	NombreUsuario VARCHAR NOT NULL,
	Contrasenia VARCHAR NOT NULL,
	IdTipoUsuario INT REFERENCES TipoUsuario(Id)
);

CREATE TABLE Conductor (
	DNI VARCHAR PRIMARY KEY,
	Nombre VARCHAR NOT NULL,
	Apellido VARCHAR NOT NULL
);

CREATE TABLE Dominio (
	Id VARCHAR PRIMARY KEY,
	Descripcion VARCHAR NOT NULL
);

CREATE TABLE Examinador (
	Id SERIAL PRIMARY KEY,
	NombreReal VARCHAR NOT NULL,
	Activo BOOLEAN NULL,
	IdUsuario INT REFERENCES Usuario(Id)
);

CREATE TABLE Equipo (
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR NOT NULL, 
	Activo BOOLEAN DEFAULT FALSE,
	NroActual INT
);

CREATE TABLE PeriodoUtilizable (
	Id SERIAL PRIMARY KEY,
	Activo BOOLEAN NULL,
	FechaInicio DATE NOT NULL,
	FechaVencimiento DATE NOT NULL,
	NroIngreso INT NOT NULL,
	IdEquipo INT REFERENCES Equipo(Id)
);

CREATE TABLE Prestamo (
	Id SERIAL PRIMARY KEY,
	Activo BOOLEAN NULL,
	FechaPrestamo DATE NOT NULL,
	HoraPrestamo TIME NOT NULL,
	NroInicial INT NOT NULL,
	FechaDevolucion DATE,
	HoraDevolucion TIME,
	NroDevolucion INT,
	IdExaminador INT REFERENCES Examinador(Id),
	IdEquipo INT REFERENCES Equipo(Id)
);

CREATE TABLE Prueba (
	Id SERIAL PRIMARY KEY,
	Fecha DATE NOT NULL,
	Hora TIME NOT NULL,
	NroMuestra INT NOT NULL,
	Resultado FLOAT NOT NULL check(resultado >= 0.0),
	NroActa INT,
	NroRetencion INT,
	Verificado BOOLEAN DEFAULT FALSE,
	Rechazado BOOLEAN DEFAULT FALSE,
	DescripcionRechazo VARCHAR,
	IdVerificador INT,
	DNIConductor VARCHAR REFERENCES Conductor(DNI),
	IdDominio VARCHAR REFERENCES Dominio(Id),
	IdPrestamo INT REFERENCES Prestamo(Id)
);


---------------------------------------------------------------- TABLA PARA ADMINISTRAR SESIONES ACTIVAS SW
CREATE TABLE Sesion (
	"sid" VARCHAR NOT NULL COLLATE "default",
	"sess" json NOT NULL,
	"expire" TIMEstamp(6) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE Sesion ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;