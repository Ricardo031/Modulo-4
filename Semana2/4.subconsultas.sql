--Estudiantes cuya calificación promedio sea > promedio general (AVG() + subconsulta).
SELECT 
    e.nombre_completo AS Estudiante, 
    AVG(i.calificacion_final) AS promedio_estudiante
FROM estudiantes e
JOIN inscripciones i ON i.id_estudiante = e.id
GROUP BY e.id, e.nombre_completo
HAVING AVG(i.calificacion_final) > (
    SELECT AVG(ins.calificacion_final) 
    FROM inscripciones ins
)
ORDER BY promedio_estudiante DESC;


--otra forma usando WHERE
SELECT 
    nombre_completo, 
    promedio_estudiante
FROM (
    -- Esta tabla interna ya calcula el promedio por estudiante
    SELECT 
        e.nombre_completo, 
        AVG(i.calificacion_final) AS promedio_estudiante
    FROM estudiantes e
    JOIN inscripciones i ON i.id_estudiante = e.id
    GROUP BY e.id, e.nombre_completo
) AS promedios_estudiantes, 
(
    -- Esta tabla interna calcula el promedio global
    SELECT AVG(calificacion_final) AS promedio_general 
    FROM inscripciones
) AS promedio_total
-- AQUÍ USAS EL WHERE
WHERE promedios_estudiantes.promedio_estudiante > promedio_total.promedio_general;


--Nombres de carreras con estudiantes inscritos en cursos del semestre ≥ 2 (IN o EXISTS).
SELECT DISTINCT e.carrera
FROM estudiantes e
WHERE id IN (
	SELECT i.id_estudiante
	FROM inscripciones i
	JOIN cursos c ON i.id_curso = c.id
	WHERE c.semestre >= 2
);
--SELECT e.carrera AS Carrera, COUNT(*) AS cantidad_estudiantes
--FROM cursos c
--JOIN inscripciones i ON i.id_curso = c.id
--JOIN estudiantes e ON i.id_estudiante = e.id
--GROUP BY c.id, c.nombre, e.carrera
--HAVING COUNT(c.semestre) >= 2

--Usar ROUND, SUM, MAX, MIN, COUNT para obtener indicadores.
SELECT
	C.NOMBRE AS CURSO,
	COUNT(i.id_estudiante) AS total_estudiantes,
	ROUND(AVG(i.calificacion_final), 2) AS promedio_curso,
	MAX(i.calificacion_final) AS nota_mas_alta,
	MIN(i.calificacion_final) AS nota_mas_baja,
	SUM(i.calificacion_final) AS suma_notas
FROM cursos c
JOIN inscripciones i ON c.id = i.id_curso
GROUP BY c.id, c.nombre
--HAVING ROUND(AVG(i.calificacion_final), 2) < 3.0
ORDER BY promedio_curso DESC








