use quanlysinhvien;


-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student
where trim(StudentName) like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class
where month(StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from studysubject
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set classID = 2
where studentID = 1;
select * from student;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần. 
select st.studentname, su.subname, ma.mark
FROM student st
JOIN mark ma ON st.StudentID = ma.StudentID
JOIN studysubject su ON ma.SubID = su.SubID 
order by ma.mark DESC, st.StudentName ASC;
select * from mark;
