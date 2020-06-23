--DDL
create database dbK15_ch01_orderBy
use dbK15_ch01_orderBy

--Lệnh DDL dùng để tạo thùng chứa Data, Data nằm trong table
--Table nằm trong thùng chứa, thùng cơ sở dữ liệu DB.
--Dùng lệnh use để mở lệnh ra và bắt đầu làm việc với thùng.
--Đóng tủ đựng đồ: tủ : talbe , đồ: data

--DDL
CREATE TABLE NHANVIEN(
	MANV char(5) primary key,
	Name nvarchar(40),
	Yob int
)
select * from NHANVIEN
CREATE TABLE Student(
	ID char(7) primary key,
	Name nvarchar(40),
	Yob int
)
select * from Student

--câu lệnh để chèn data DML(insert) vào table
--insert 
--bỏ đồ vào tủ đã có
--ta còn có các lệnh để thao tác trên đồ
--select update delete
--nhóm lệnh CRUD(create/insert ..retrieve/select|update|delete)
--các lệnh này thao tác trên đồ trong tủ,được gọi là dml sql statements
--data manipulation language

insert into Student values ('SE99999',N'Chín Nguyễn', 1997)
insert into Student values ('SE99998',N'Chín Nguyễn', 1990)
insert into Student values ('SE99997',N'Chín Nguyễn', 1995)
insert into Student values ('SE99995',N'Chín Trần',2000)
insert into Student values ('SE99996',N'Chín Võ',1995)
insert into Student values ('SE99991', N'Chín Võ', 1994)
insert into Student values ('SE99990', N'Chín Võ', 1999)
insert into Student values ('SE99980', N'Tám Lê', 1994)
insert into Student values ('SE99970', N'Bảy Trần', 1995)
insert into Student values ('SE99971', N'Bảy Trần', 1994)

select * from Student

--1. In ra danh sách sv tăng dần theo tên
select * from Student Order by Name asc

--2. In ra danh sách sv, tăng dần theo tên trước
--nếu tên trùng nhau, thì trong đám tên trùng nhau, ta sắp tăng dần theo yob
select * from Student Order by Name, Yob asc

--3. In ra ds sv, tăng dần theo tên trước đã
--nếu tên trùng nhau, thì trong đám trùng nhau tên nhau, ta sắp giảm dần
--theo năm sinh
select * from Student Order by Name asc, Yob desc
--Chốt: Nếu sort trên nhiều cột 
--Từ trái sang phải sort một cột trước đã, trong các cột đó nếu có trùng value
--thì cột 2 mới bắt đầu sort, tương tự với cột 3 4 5....