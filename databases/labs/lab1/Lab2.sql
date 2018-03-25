# Return students grades and section numbers
SELECT student.Name, grade, Section_identifier AS section FROM student
  JOIN grade_report USING (Student_number);

# Return students name and course number for people in instructor king's class
SELECT DISTINCT student.Name, Course_number FROM student
  JOIN grade_report USING (Student_number)
  JOIN section USING (Section_identifier)
WHERE Instructor='King';

# Return the name of students in King's class starting from section number
# and joining left until the name is within reach
SELECT DISTINCT student.Name FROM
  (SELECT Section_identifier FROM section where Instructor='King') sec
  LEFT JOIN grade_report USING (Section_identifier)
  LEFT JOIN student USING (Student_number);

# Do it Yourself

# Show prereqs for each course that each stdent took in the form:
# Student | course | prereq

SELECT DISTINCT Name, Course_number as Course,
                      IFNULL(Prerequisite_number, '') as Prerequisite FROM student
  JOIN grade_report USING (Student_number)
  JOIN section USING (Section_identifier)
  JOIN course USING (Course_number)
  LEFT JOIN prerequisite USING (Course_number)
ORDER BY Name ASC, course ASC;

# Show a table with concat'd name and course number

SELECT CONCAT_WS(':', Course_number, Course_name) as course,
       CONCAT_WS(':', prerequisite.Prerequisite_number, prerequisite_name) as prerequisite
FROM course
  LEFT JOIN prerequisite USING (Course_number)
  LEFT JOIN(
             SELECT Course_name as prerequisite_name, Course_number as Prerequisite_number from course
           ) temp on prerequisite.Prerequisite_number = temp.Prerequisite_number
