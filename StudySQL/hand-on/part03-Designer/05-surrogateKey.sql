--Ly thuyet
--Mot sinh vien hoc toi da 1 chuyen nganh
--Mot chuyen nganh co toi da nhieu sinh vien
-----------------------------------------------------
-------------------Natural KEY-----------------------
-----------------------------------------------------
create table MajorV1
(
	ID char(2) not null primary key, --IA, SE, SB, GD, IB
	name nvarchar(30)

)
insert into MajorV1 values ('SB',N'Quản Trị Kinh Doanh')
insert into MajorV1 values ('SE',N'Kĩ Thuật Phần Mềm')
insert into MajorV1 values ('GD',N'Thiết Kế Đồ Họa')
--những key này dùng hằng ngày
--sinh viên vào học thì phải đăng ký chuyên ngành\
create table StudentV1(
	ID char(8) primary key,
	Name nvarchar(40),
	MID char(2),	--trong sv phải có info chuyên ngành
	--quan hệ 1-n kéo key từ 1 sang N làm FK
	--rằng buộc tham chiếu MID phải thuộc về id của MajorV1
	constraint FK_StudentV1
		foreign key(MID) references MajorV1(ID) on delete set null
												on update cascade
												--nếu sữa mã chuyên ngnah2 thì sẽ đổi chung
												--bị sửa theo
)

              
insert into StudentV1 values ('S1',N'An','GD')
insert into StudentV1 values ('S2',N'Bình','GD')
insert into StudentV1 values ('S3',N'Cường','SB')
insert into StudentV1 values ('S4',N'Dũng','SB')

--nếu chuyên ngành SB đổi thành SS thì sao
--thì cội MID bên table Student sẽ bị đổi theo
--on update cascade
update MajorV1 set ID = N'SS' where ID = N'SB'
--DB còn phức tạp lắm,vì table major còn phải dao du kết bạn, conecter với rất nhiều table khác
--việc sữa update gây ra hiệu ứng xáo trộn khá lớn trong DB
--nên ngta sẽ né việc đổi PK
--ngta dùng đến surrogate key
--nếu ta dùng pk thì nó sẽ bị domino
--surrogate key giúp ta update mà các table khác không ảnh hưởng
--tìm hiểu trên google : natural key và surrogate key
create table MajorV2(
	SEQ int identity primary key, --key tự tăng
	ID char(2) not null unique,	--gài unique tránh trùng  
	--> candidate key, phế võ công của natural key, cột thường cho unique
	name nvarchar(30)
	--sequence
)

use DB15_Part03_OneManyRelationship


insert into MajorV2 values ('SB',N'Quản Trị Kinh Doanh')
insert into MajorV2 values ('SE',N'Kĩ Thuật Phần Mềm')
insert into MajorV2 values ('GD',N'Thiết Kế Đồ Họa')
select * from MajorV2

create table StudentV2(
	ID char(8) primary key,
	Name nvarchar(40),
	MID int,	--trong sv phải có info chuyên ngành
	--quan hệ 1-n kéo key từ 1 sang N làm FK
	--rằng buộc tham chiếu MID phải thuộc về id của MajorV1
	constraint FK_StudentV2
		foreign key(MID) references MajorV2(SEQ) on delete set null
												on update cascade
												--nếu sữa mã chuyên ngnah2 thì sẽ đổi chung
												--bị sửa theo
)
select * from StudentV2
select * from MajorV2

update MajorV2 set ID = N'SS' where ID = N'SB'

--Khi nao thi dung surrogate key, surrogate key nen duoc su dung khi:
--PK co kha nang thay doi, luc nay ta dung surrogate key lam key gia hung chiu
--lam dai dien chinh cho PK, giup cho PK ko bi dinh hien tuong DOMINO o cac table khac.

--Tao table voi khoa thay the, khoa tu tang.
--Ta co 2 co che.
--Co che 1: Tu dong phat sinh ra con so khong trung lai voi noi bo. trong 1 table
--Demo:
	--SEQ cua major V2.
--Co che nay co tinh bao mat thap, cac hacker chuyen nghiep hoac ban chuyen deu co the doan
--mo va tu vao d.c
--Luu tru nhung cai khong can bao mat cao.
--Co che 2: Dung ham newid() cung cap boi sql sever
--Ham nay se phat sinh ra con so hexa 
--Con so duoc phat sinh ra tra ve dang so khong trung lai tat ca nhung thang trong DB
create table MajorV3
(
	SEQ uniqueidentifier default newid() not null primary key,
	ID char(2),
	name nvarchar(30),
)

insert into MajorV3(ID,name) values ('SB',N'Quản Trị Kinh Doanh')
insert into MajorV3(ID,name)  values ('SE',N'Kĩ Thuật Phần Mềm')
insert into MajorV3(ID,name)  values ('GD',N'Thiết Kế Đồ Họa')
--Msg 213, Level 16, State 1, Line 103
--Column name or number of supplied values does not match table definition.
--Neu chay doan code nay ma thieu chon vung thi no se khoong biet se phai do vao cot nao ca
--nho rang SEQ la cot unique van dc coi la 1 cot binh thuong thoy, phai dua gia tri chu dong.
--Neu ko dua gia tri chu dong thi no moi default.
--Vi so rat xau sau khi duoc xuat ra nen do bao mat cuc cao.
select * from MajorV3
--Vay tao surrogate Key de lam gi:
--1.Chi tao Key gia trong tinh huong khong biet Key la gi.
--2.Thay cho composite Key.
--3.Tranh hieu ung domino.

