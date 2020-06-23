create database DB15_Part03_OneManyRelationship
use DB15_Part03_OneManyRelationship
---------------------
--DDL
create table City
(
	ID int not null,
	Name nvarchar(40) not null
)

alter table City
	add constraint PK_City primary key (ID)

alter table City
	add constraint UQ_City Unique(Name)

--DML
insert into City values (1,N'TP.HCM')
insert into City values (2,N'TP.Hà Nội')
insert into City values (3,N'Bình Dương')
insert into City values (4,N'Tây Ninh')
insert into City values (5,N'Đak Lak')
insert into City values (6,N'Bắc Kạn')

--SQL
select * from City
-----------------tạo table candidate
create table Candidate(
	ID char(5) not null,
	LastName nvarchar(30) not null,
	FirstName nvarchar(20) not null,
	CityID int	--kết nối mã của thành phố
				--FK đãm bảo mọi giá trị phải tồn tại ở table city
				--phải tồn tại, hoặc mang giá trị null
)
alter table Candidate
	add constraint PK_Candidate primary key (ID)
alter table Candidate 
	add constraint FK_Candidate foreign key (CityID) references City(ID)

insert into Candidate values ('C1',N'Nguyễn',N'An',1)
insert into Candidate values ('C2',N'Lê',N'Bình',1)
insert into Candidate values ('C3',N'Võ',N'Cường',2)
insert into Candidate values ('C4',N'Phạm',N'Dũng',3)
insert into Candidate values ('C5',N'Trần',N'Em',4)

select * from Candidate
--Ôn Tập SQL
--1.Liệt Kê Danh Sách Sinh Viên
select * from Candidate
--2.liệt kê danh sách sinh viên kèm theo thông tin
select C.*, V.ID, V.Name from Candidate C full join City V on C.CityID = V.ID
--2.1.Liệt kê danh sách các tĩnh kèm thông tin sinh viên
select V.*, C.FirstName, C.LastName from Candidate C right join City V on C.CityID = V.ID
--3. in ra các sinh viên ở thành phố hồ chí minh
select C.FirstName, C.LastName, V.Name from Candidate C right join City V on C.CityID = V.ID where V.Name = N'TP.HCM'
--4.đếm xem có bao nhiêu sinh viên
select count(*) from Candidate 

--đếm xem mỗi tĩnh có bao nhiêu sinh viên5

select V.Name,V.ID, count(*) from Candidate C inner join City V on C.CityID = V.ID group by V.ID, V.Name
--đếm xem thành phố hồ chí minh có bao nhiêu sinh viên
select V.Name,V.ID, count(*) from Candidate C inner join City V on C.CityID = V.ID group by V.ID, V.Name having V.Name = N'TP.HCM'

--tĩnh nào nhiều sinh viên nhất
select V.Name,V.ID, count(*) from Candidate C inner join City V on C.CityID = V.ID group by V.ID, V.Name having count(*) >= ALL(select count(*) from Candidate C inner join City V on C.CityID = V.ID group by V.ID, V.Name)

--xem đổ domino
--điều gì sẽ xảy ra nếu 1 tỉnh bị xóa???
--city	candidate
--1-------n
--bên 1 xóa bên N sẽ ra sao???

--bên N xóa bên 1 ????
delete from City where id = '1'		--xóa hcm
--báo lỗi vi phạm FK bên candidate đang móc vào id: 1
delete from City where id = 6	
select * from Candidate
--sẽ xóa được nếu như data chưa được xuất hiện
--xóa đi không ảnh hướng đến table nào hết

update City set ID = 333 where id = 3
--update bị lỗi FK 
--nhưng mà tế thì phải đổi
----------------------------------------
---------------ver2---------------------

create table CityV2
(
	ID int not null,
	Name nvarchar(40) not null
)

alter table CityV2
	add constraint PK_CityV2 primary key (ID)

alter table CityV2
	add constraint UQ_CityV2 Unique(Name)

--DML
insert into CityV2 values (1,N'TP.HCM')
insert into CityV2 values (2,N'TP.Hà Nội')
insert into CityV2 values (3,N'Bình Dương')
insert into CityV2 values (4,N'Tây Ninh')
insert into CityV2 values (5,N'Đak Lak')
insert into CityV2 values (6,N'Bắc Kạn')


create table CandidateV2(
	ID char(5) not null,
	LastName nvarchar(30) not null,
	FirstName nvarchar(20) not null,
	CityID int	--kết nối mã của thành phố
				--FK đãm bảo mọi giá trị phải tồn tại ở table city
				--phải tồn tại, hoặc mang giá trị null
)
alter table CandidateV2
	add constraint PK_CandidateV2 primary key (ID)
alter table CandidateV2 
	add constraint FK_CandidateV2 foreign key (CityID) references CityV2(ID) on delete set null 
																			 on update cascade
																--cha xóa con bị xóa theo
																--nó phải tồn tại ở city
																--khi bị xóa gí trị là null

insert into CandidateV2 values ('C1',N'Nguyễn',N'An',1)
insert into CandidateV2 values ('C2',N'Lê',N'Bình',1)
insert into CandidateV2 values ('C3',N'Võ',N'Cường',2)
insert into CandidateV2 values ('C4',N'Phạm',N'Dũng',3)
insert into CandidateV2 values ('C5',N'Trần',N'Em',4)

delete from CityV2 where id = 1
select * from CandidateV2
select * from CityV2

update CityV2 set ID = 333 where id = 3

