INSERT INTO estudiantes (nombre_completo, correo_electronico, genero, identificacion, carrera, fecha_nacimiento, fecha_ingreso) VALUES
('Ana García', 'ana.garcia@email.com', 'Femenino', 1001, 'Ingeniería', '2002-05-15', '2021-02-01'),
('Carlos Ruiz', 'carlos.ruiz@email.com', 'Masculino', 1002, 'Derecho', '2001-11-20', '2020-08-15'),
('Elena Vargas', 'elena.vargas@email.com', 'Femenino', 1003, 'Medicina', '2003-02-10', '2022-02-01'),
('Luis Pineda', 'luis.pineda@email.com', 'Masculino', 1004, 'Ingeniería', '2000-07-22', '2019-08-15'),
('Sofía Mendieta', 'sofia.m@email.com', 'Femenino', 1005, 'Psicología', '2002-12-05', '2021-08-15');

INSERT INTO docentes (nombre_completo, correo_institucional, departamento_academico, experiencia) VALUES
('Dr. Roberto Santos', 'rsantos@uni.edu', 'Ingeniería', 15),
('Dra. Laura Ortega', 'lortega@uni.edu', 'Ciencias Sociales', 10),
('Prof. Miguel Torres', 'mtorres@uni.edu', 'Medicina', 8),
('Prof. Carlos Martines', 'carlos@uni.edu', 'Fisica', 4);
;

INSERT INTO cursos (id_docente, nombre, codigo, creditos, semestre) VALUES
(1, 'Cálculo Diferencial', 101, 4, 1),
(1, 'Programación Avanzada', 102, 3, 3),
(2, 'Introducción al Derecho', 201, 3, 1),
(3, 'Anatomía Humana', 301, 5, 2),
(4, 'Derecho', 401, 4, 3);


INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion, calificacion_final) VALUES
(1, 1, '2021-02-05', 4.5),
(1, 2, '2022-08-10', 4.0),
(1, 3, '2022-08-10', 4.0),
(2, 3, '2020-08-20', 3.8),
(3, 4, '2022-02-10', 4.9),
(4, 1, '2019-08-20', 3.5),
(4, 2, '2020-02-15', 4.2),
(5, 3, '2021-08-20', 4.0),
(5, 4, '2023-02-10', 3.7);