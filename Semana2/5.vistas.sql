CREATE  VIEW vista_historial_academico AS 
	SELECT 
		e.nombre_completo AS Estudiante,
		c.nombre AS Curso,
		d.nombre_completo AS Docente,
		c.semestre,
		i.calificacion_final
	FROM estudiantes e
	JOIN inscripciones i ON i.id_estudiante = e.id
	JOIN cursos c ON i.id_curso = c.id 
	JOIN docentes d ON c.id_docente = d.id

SELECT * FROM vista_historial_academico