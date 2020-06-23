--Thiet ke co so du lieu luu tru thong tin sinh vien, thi sinh dang ki du thi
--Mot ho so thi sinh bao gom so bao danh, so cmnd, dien thoai, email va dia chi thuong tru
--Can phai tra loi dc cau hoi thong ke so thi sinh theo tung khu vuc, yeu cau tach ra
--2 table. 1 la table student, 2 la table city
--student thi masv primary key
--city se co 1 cot CityID not null tu tang va ten thanh pho ko d.c null.
--DBK15_StudentManagements
----------------------------
--Suy nghi: Em di hoc tren thanh pho o ki tuc xa, me em len thanh pho tham e
--truoc khi me e len tham e, truoc do e co cho me e so phong` nhung ma ngat noi 
--ky tuc xa e o? co rat nhieu lo 
--hoi? thiet ke table nhu the nao de co the select chinh xac cai phong cua e
--chu nhan cac phong khong trung ten
CREATE DATABASE DBK15_StudentManagements
USE DBK15_StudentManagements
/*Drop statements*/
drop table City
drop table Student
/*Drop statements*/
Create table Student(
	MSSV char(8) primary key,
	NAME nvarchar(40),
	CMND nvarchar(20),
	PHONE nvarchar(20),
	EMAIL nvarchar(50),
	CityID int
	)

create table City(
	CityID int primary key identity(1,2),
	CityName nvarchar(40)
	)
select * from Student
select * from City
insert into Student values (N'SE140885',N'Hoàng Quy',N'381928043',N'0914682425',N'caohoanghuy@gmail.com',1)
insert into Student values (N'SE140776',N'Trần Hào',N'381923434',N'0914682232',N'tranhao2001@gmail.com',2)
insert into Student values (N'SE140443',N'Hoàng Minh',N'381928213',N'0914685673',N'minhhoanghotboy@gmail.com',3)
insert into Student values (N'SE140123',N'Lê Minh',N'381924567',N'0914680998',N'minhfuckzboy@gmail.com',4)
insert into Student values (N'SE140903',N'Quốc Bảo',N'381928543',N'0945165512',N'baoqucxxx@gmail.com',1)
insert into Student values (N'SE140324',N'Trần Huy',N'381920967',N'0914682435',N'tranhuy9x@gmail.com',5)
insert into Student values (N'SE140867',N'Thái Huy',N'381928041',N'0914685555',N'deptraixxx@gmail.com',1)
insert into Student values (N'SE140809',N'Trần Luân',N'381928042',N'0914678925',N'soaicaxxx@gmail.com',4)
insert into Student values (N'SE140823',N'Hoàng Thùy',N'381928563',N'0914090425',N'xautrai9x@gmail.com',5)
insert into Student values (N'SE140551',N'Bảo An',N'381928778',N'0914681245',N'daika01@gmail.com',6)
insert into Student values (N'SE140442',N'Như Quỳnh',N'381928992',N'0914698025',N'fuckboyz@gmail.com',7)
-------------------------------------
insert into City(CityName) values (N'TP.HCM')
insert into City(CityName) values (N'TP.CT')
insert into City(CityName) values (N'Hải Phòng')
insert into City(CityName) values (N'Đà Lạt')
insert into City(CityName) values (N'Cà Mau')
insert into City(CityName) values (N'Hà Nội')
insert into City(CityName) values (N'Bà Rịa Vũng Tàu')