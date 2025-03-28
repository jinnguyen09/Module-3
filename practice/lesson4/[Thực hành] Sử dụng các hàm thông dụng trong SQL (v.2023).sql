use quanlysinhvien;

select Address, count(studentID) as 'Số lượng sinh viên'
from student
group by address;

select * from student;
select * from mark;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;

select s.studentid, s.studentname, avg(mark)
from student s join mark m on s.studentid = m.studentid
group by s.studentid, s.studentname
having avg(mark) > 8;

select s.studentid, s.studentname, avg(mark)
from student s join mark m on s.studentid = m.studentid
group by s.student, s.studentname
having avg(mark) > all ();

