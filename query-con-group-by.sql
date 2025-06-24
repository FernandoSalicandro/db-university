
-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(students.enrolment_date) AS "Anno", COUNT(*) AS "Numero di Iscritti"
FROM students
GROUP BY Anno
ORDER BY Anno

--  2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT teachers.office_address AS "Edificio", COUNT(*) AS "Insegnanti"
FROM teachers
GROUP BY Edificio

-- 3. Calcolare la media dei voti di ogni appello d'esame

select exam_student.exam_id, AVG(exam_student.vote) AS "Media Voti"
FROM exam_student
GROUP BY exam_student.exam_id
ORDER BY exam_student.exam_id;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT degrees.department_id, COUNT(degrees.department_id) AS "Numero Di Corsi"
FROM degrees
GROUP BY degrees.department_id;

