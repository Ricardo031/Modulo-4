--1. Listar todos los estudiantes con sus inscripciones y cursos (JOIN).
SELECT e.nombre_completo AS Estudiante, c.nombre
FROM estudiantes e
JOIN inscripciones i ON i.id_estudiante = e.id
JOIN cursos c on i.id_curso = c.id

--2. Listar cursos dictados por docentes con > 5 años de experiencia.
SELECT c.nombre AS Curso, d.nombre_completo AS Docente, d.experiencia
FROM docentes d
JOIN cursos c ON c.id_docente = d.id
WHERE d.experiencia > 5

--3. Mostrar estudiantes inscritos en más de un curso (HAVING COUNT(*) > 1).
SELECT e.nombre_completo AS Estudiante, Count(*) AS cantidad_cursos
FROM estudiantes e
Join inscripciones i ON i.id_estudiante = e.id
JOIN cursos c ON i.id_curso = c.id
GROUP BY e.id, e.nombre_completo 
HAVING COUNT(*) > 1

--4. ALTER TABLE: agregar columna estado_academico a estudiantes.
ALTER TABLE estudiantes
ADD COLUMN estado_academico TEXT
ALTER COLUMN estado_academico SET DEFAULT 'Activo'; 

--5. Eliminar un docente y observar el efecto en cursos (revisar ON DELETE en la FK).
ALTER TABLE cursos DROP CONSTRAINT cursos_id_docente_fkey;

ALTER TABLE cursos 
ADD CONSTRAINT cursos_id_docente_fkey 
FOREIGN KEY (id_docente) REFERENCES docentes(id) ON DELETE CASCADE;

DELETE FROM docentes WHERE docentes.id = 4
SELECT * FROM docentes
SELECT * FROM cursos

--6. Consultar cursos con más de 2 estudiantes inscritos (GROUP BY + COUNT + HAVING).
SELECT c.nombre AS curso, Count(*) AS cantidad_estudiantes
FROM cursos c
JOIN inscripciones i ON i.id_curso = c.id
GROUP BY c.id, c.nombre
HAVING Count(*) > 1
ORDER BY cantidad_estudiantes desc
