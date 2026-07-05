CREATE TABLE estudiantes(
	Id SERIAL PRIMARY KEY, 
	nombre_completo VARCHAR(100) NOT NULL,
	correo_electronico TEXT UNIQUE NOT NULL CHECK (correo_electronico LIKE '%@%.%'),
	genero TEXT NOT NULL,
	identificacion INT UNIQUE NOT NULL,
	carrera VARCHAR(50) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	fecha_ingreso DATE NOT NULL CHECK (fecha_ingreso >= fecha_nacimiento)
);

CREATE TABLE docentes (
id SERIAL PRIMARY KEY,
nombre_completo VARCHAR(50) NOT NULL,
correo_institucional VARCHAR(37) NOT NULL CHECK (correo_institucional LIKE '%@%.%'),
departamento_academico VARCHAR(50) NOT NULL,
experiencia INT NOT NULL
);

CREATE TABLE cursos (
Id SERIAL PRIMARY KEY, 
id_docente INT,
FOREIGN KEY (id_docente) REFERENCES docentes(id),
nombre VARCHAR(100) NOT NULL,
codigo INT UNIQUE NOT NULL,
creditos INT NOT NULL CHECK (creditos > 0),
semestre INT CHECK (semestre > 0)
);
 

CREATE TABLE inscripciones (
Id SERIAL PRIMARY KEY,
id_estudiante INT,
FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
id_curso INT,
FOREIGN KEY (id_curso) REFERENCES cursos(id),
fecha_inscripcion DATE,
calificacion_final DECIMAL CHECK (calificacion_final >= 0 AND calificacion_final <= 5) --califiacion del 0 al 
);