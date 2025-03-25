create database QuanLySinhVien;
use QuanLySinhVien;

insert class(classID, className, Startdate, status) values (1,"A1", "2008-12-20", 1);
insert class(ClassID, className, Startdate, status) values (2,"A2", "2008-12-22", 1);
insert class(classid, className, Startdate, status) values (3,"B3", current_date(), 0);
select * from class;

insert student(studentID, studentname, address, phone, status, classid) values (1, "Hung", "Ha Noi", "0912113113", 1, 1);
insert student(studentID, studentname, address, phone, status, classid) values (2, "Hoa", "Hai Phong","", 1, 1);
insert student(studentID, studentname, address, phone, status, classid) values (3, "Manh", "HCM", "0123123123", 0, 2);
select * from student;

insert studysubject(subid, subname, credit, status) values (1, "CF", 5, 1);
insert studysubject(subid, subname, credit, status) values (2, "C", 6, 1);
insert studysubject(subid, subname, credit, status) values (3, "HDJ", 5, 1);
insert studysubject(subid, subname, credit, status) values (4, "RDMB", 10, 1);
select * from studysubject;


insert Mark(markid, subid, studentid, mark, examtimes) values (1, 1, 1, 8, 1);
insert Mark(markid, subid, studentid, mark, examtimes) values (2, 1, 2, 10, 2);
insert Mark(markid, subid, studentid, mark, examtimes) values (3, 2, 1, 12, 1);
select * from mark;