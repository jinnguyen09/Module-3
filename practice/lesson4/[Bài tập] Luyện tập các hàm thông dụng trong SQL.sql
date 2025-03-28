use quanlysinhvien;

select * from student;
select * from mark;
select * from studysubject;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * 
FROM studysubject 
WHERE credit = (SELECT MAX(credit) FROM studysubject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT * from mark
where mark = (select max(Mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.studentid, s.studentname, s.address, s.phone, s.status, avg(mark) 
from student s join mark m on s.studentid = m.StudentID
group by s.studentid, s.StudentName, s.Address, s.phone, s.status
order by avg(mark) Desc;
