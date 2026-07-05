SELECT * FROM vista_historial_academico

CREATE ROLE revisor_academico;
GRANT SELECT ON vista_historial_academico TO revisor_academico


REVOKE INSERT, UPDATE, DELETE ON inscripciones FROM revisor_academico

BEGIN;
UPDATE inscripciones 
SET calificacion_final = 4.8 
WHERE id_estudiante = 1 AND id_curso = 1;


SAVEPOINT antes_actualizacion_critica

UPDATE inscripciones 
SET calificacion_final = 5.0 
WHERE id_estudiante = 1 and id_curso = 3
--si pasara algo malo con ese update pues solo vamos para atras
ROLLBACK TO SAVEPOINT antes_actualizacion_critica;
--confirmar cambios
COMMIT

select * FROM inscripciones