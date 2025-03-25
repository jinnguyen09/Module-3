create database QuanLyDiemThi;

use QuanLyDiemThi;

create table HocSinh(
	MaHS varchar(20) primary key,
	TenHS varchar(200),
    NgaySinh datetime,
    Lop varchar(200),
    GT varchar(50)
);

create table MonHoc(
	MaMH varchar(20) primary key,
    TenMH varchar(50),
    MaGV varchar(20)
);

create table BangDiem(
	MaHS varchar(20),
    MaMH varchar(20),
    DiemThi int,
    NgayKT datetime,
    primary key (MaHS, MaMH),
    foreign key (MaHS) references HocSinh(MaHS),
    foreign key (MaMH) references MonHoc(MaMH)
);

create table GiaoVien(
	MaGV varchar(20) primary key,
    TenGV varchar(20),
    SDT varchar(10)
);

alter table MonHoc Add constraint FK_MaGV foreign key (MaGV) references GiaoVien(MaGV);

insert into Teacher(name, age, country) values ("Nguyen Dinh Thiep", 20, "Viet Nam");
insert into Teacher(name, age, country) values ("Nguyen Dinh Thiep", 20, "Viet Nam");
insert into Teacher(name, age, country) values ("Nguyen Dinh Thiep", 20, "Viet Nam");

select id, name, age, country from Teacher;



