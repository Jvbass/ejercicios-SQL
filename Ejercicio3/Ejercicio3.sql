-- Juan V. Pino Contreras

USE ACADEMIA;
-- ❖ Seleccionar el nombre del alumno número 10 y el curso que está haciendo 
SELECT A.nombre AS nombre_alumno10, C.nombre AS nombre_curso
FROM ALUMNOS A JOIN CURSOS C 
ON A.cod_curso = C.cod_curso
WHERE A.cod_alumno = 10;

-- ❖ Visualizar las asignaturas del curso 1. 
SELECT nombre AS asignaturas_curso1 FROM asignaturas WHERE cod_curso = 1;

-- ❖ Visualizar el número de asignaturas de cada curso
SELECT C.nombre AS curso, COUNT(A.cod_asignatura) AS numero_asignaturas
FROM cursos C
LEFT JOIN asignaturas A ON C.cod_curso = A.cod_curso
GROUP BY C.nombre;

-- ❖ Visualizar las asignaturas del profesor con el código 2. 
SELECT A.nombre AS asignatura_profe_2
FROM profesores P
JOIN asignaturas A ON P.cod_profesor = A.cod_profesor
WHERE P.cod_profesor = 2;

-- ❖ Visualizar las notas del alumno 10 
SELECT N.nota AS notas_alumno_10
FROM alumnos A
JOIN notas_alumnos N ON A.cod_alumno = N.cod_alumno
WHERE A.cod_alumno = 10;

-- ❖ Mostrar el curso y el promedio de notas de los alumnos 
SELECT C.nombre AS curso, AVG(NA.nota) AS promedio_notas_alumnos
FROM cursos C
JOIN notas_alumnos NA ON C.cod_curso = NA.cod_curso
GROUP BY C.nombre;

-- ❖ Sacar el promedio, pero en este caso por asignatura.
SELECT A.nombre AS asignatura, AVG(NA.nota) AS promedio_nota
FROM asignaturas A
JOIN notas_alumnos NA ON A.cod_asignatura = NA.cod_asignatura
GROUP BY A.nombre;

/*Probando LEFT Y RIGHT JOIN*/
-- ❖ Inserta un par de filas en la tabla CURSOS. Esto permite tener dos cursos que no tienen alumnos 
insert into cursos values(11,'curso11',100); 
insert into cursos values(12,'curso12',200);

-- ❖ Averiguar ahora el número de alumnos por curso. Debes usar la cláusula USING para hacer la join ( Investiga sobre la clausaula USING y aplícala).
-- USING se usa cuando dos tablas tienen una columna con el mismo nombre, en este caso "cod_curso" la usamos para comparar las tablas alumnos y cursos.
SELECT C.nombre, COUNT(A.cod_curso)
FROM cursos c 
JOIN alumnos A USING (cod_curso)
GROUP BY C.nombre;

-- ❖ Comprueba si aparecen los nuevos cursos. Hazlo con Left Join y deben aparecer 0 alumnos.
SELECT C.nombre, COUNT(A.cod_curso)
FROM cursos c 
LEFT JOIN alumnos A USING (cod_curso)
GROUP BY C.nombre;

/* ❖ Obtén cada asignatura con sus profesores. Hay algunos profesores que no 
aparecen ya que no tienen asignaturas todavía. Los debes incluir con un RIGHT JOIN */
SELECT P.nombre AS profesor, A.nombre AS asignatura
FROM asignaturas A
RIGHT JOIN profesores P USING (cod_profesor);

