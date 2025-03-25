create database QuanLyBanHang;
use QuanLyBanHang;

create table Customer(
	cID int not null auto_increment primary key,
    cName varchar(50),
    cAge int 
);

create table OrderBill(
	oID varchar(20) not null primary key,
    cID int,
    oDate datetime,
    oTotalPrice int
);

create table OrderDetail (
	oID varchar(20),
    pID varchar(20),
    odQTY int,
    foreign key (oID) references OrderBill (oID),
    foreign key (pID) references Product (pID)
);

create table Product(
	pID varchar(20) not null primary key,
    pName varchar(50),
    pPrice int
);