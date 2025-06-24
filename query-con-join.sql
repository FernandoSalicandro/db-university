
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.id, students.name, students.surname, degrees.name
FROM `students` 
JOIN `degrees` ON degrees.id = students.degree_id
WHERE degrees.name = "Corso di Laurea in Economia"
ORDER BY students.id ASC;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT degrees.id,degrees.name,degrees.level
FROM degrees
JOIN departments ON departments.id = degrees.department_id
WHERE degrees.level = "magistrale";

--  3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT teachers.id ,teachers.name AS "nome prof", teachers.surname AS "cognome prof",courses.name AS "Corso"
FROM courses
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON teachers.id = course_teacher.teacher_id
WHERE teachers.id = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--  relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT 
students.name AS "Nome", students.surname AS "Cognome",
departments.name AS "Dipartimento",
degrees.name AS "Nome Corso Laurea",degrees.level, degrees.address, degrees.email, degrees.website
FROM students
JOIN degrees ON degrees.id = students.degree_id
JOIN departments ON departments.id = degrees.department_id
ORDER BY students.surname,  students.name;

--  5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT degrees.name AS "Nome Corso Di Laurea", courses.name AS "Corso", teachers.name AS "Nome", teachers.surname AS "Cognome"
FROM degrees
JOIN courses ON degrees.id = courses.degree_id
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON teachers.id = course_teacher.teacher_id
ORDER BY degrees.name;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT 
  teachers.id,
  teachers.name AS "Nome Prof",
  teachers.surname AS "Cognome Prof",
  departments.name AS "Dipartimento"
FROM departments
JOIN degrees ON departments.id = degrees.department_id
JOIN courses ON degrees.id = courses.degree_id
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON teachers.id = course_teacher.teacher_id
WHERE departments.name = 'Dipartimento di Matematica'
GROUP BY teachers.id, teachers.name, teachers.surname;








