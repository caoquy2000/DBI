use DBK15_ch04_Join
--InnerJoin
--1.Ta sẽ thiết kế datavase để lưu trữ dữ liệu thông tin sinh viên
--và chuyên ngnah2 mà sv theo học
--Trường đại học x có mỡ các chuyên chuyên ngành
create table Major
(
	ID char(2) primary key,
	Name nvarchar(30),
	Room char(4),
	Hotline char(11)
)
insert into Major values('IS', 'Information System', 'R101', '091x...')
insert into Major values('JS', 'Japanese Software Eng.', 'R101', '091x...')
insert into Major values('ES', 'Embedded System', 'R101', null)
insert into Major values('JP', 'Japanese Language', 'R102', '091x...')
insert into Major values('EN', 'English', 'R102', null)
insert into Major values('HT', 'Hotel Management', 'R103', null)
insert into Major values('IA', 'Information Asurance', 'R103', null)
select * from Major

create table Student
(
	ID char(8) primary key,
	Name nvarchar(30),
	MID char(2) null,  --mã chuyên ngành
	foreign key (MID) references Major(ID)
)
insert into Student values ('SE123456', N'An Nguyễn', 'IS')
insert into Student values ('SE123457', N'Bình Lê', 'IS')
insert into Student values ('SE123458', N'Cường Võ', 'IS')
insert into Student values ('SE123459', N'Dũng Phạm', 'IS')

insert into Student values ('SE123460', N'Em Trần', 'JS')
insert into Student values ('SE123461', N'Giang Lê', 'JS')
insert into Student values ('SE123462', N'Hương Võ', 'JS') 
insert into Student values ('SE123463', N'Khanh Lê', 'JS') 

insert into Student values ('SE123464', N'Lan Trần', 'ES')
insert into Student values ('SE123465', N'Minh Lê', 'ES')
insert into Student values ('SE123466', N'Ninh Phạm', 'ES') 

insert into Student values ('SE123467', N'Oanh Phạm', 'JP')
insert into Student values ('SE123468', N'Phương Nguyễn', 'JP')

insert into Student values ('SE123472', N'Anh Lê', 'IA')
--IS: 4, JS: 4, ES: 3, JP: 2
--HT: 0, EN: 0
--3 sv đang học dự bị, tức là mã CN là null
insert into Student values ('SE123469', N'Quang Trần', null)
insert into Student values ('SE123470', N'Rừng Lê', null)
insert into Student values ('SE123471', N'Sơn Phạm', null) 

select * from Student
select * from Major
select * from Student, Major
--Co bao nhieu chuyen nganh
select  count(*) from Major  
--Co bao nhieu sinh vien
select count(*) from Student
--Noi day du 2 bang 
select * from Major M inner join Student S on M.ID = S.MID
--Xem xem co bao nhieu sinh vien co infor cua chuyen nganh 
select * from Student S inner join Major M on S.MID = M.ID
--Show ra thong tin bo ra cot MID
select S.*, M.Name, M.Room, M.Hotline from Student S inner join Major M on S.MID = M.ID
--Lay het tat ca cac sinh vien 
select * from Student S full join Major M on S.MID = M.ID
select * from Student where MID is null
select * from Student
select * from Major 
--Dem xem moi chuyen nganh co bao nhieu sinh vien 
select  iif(MajorID is null,N'Không Xác Định',MajorID),count(ID) 
from (select S.ID, S.Name, M.ID as MajorID  from Student S full join Major M on S.MID = M.ID) as G 
group by MajorID
--Show ten chuyen nganh, ma chuyen nganh, kem so luong sinh vien 
select  iif(MajorID is null,N'Không Xác Định',MajorID),MajorName,count(ID) 
from (select S.ID, S.Name, M.ID as MajorID , m.Name as MajorName from Student S full join Major M on S.MID = M.ID) as G 
group by MajorID, MajorName
--Lay ra chuyen nganh nao co tu 3 sinh vien tro len 
select  iif(MajorID is null,N'Không Xác Định',MajorID),MajorName,count(ID) 
from (select S.ID, S.Name, M.ID as MajorID , m.Name as MajorName from Student S full join Major M on S.MID = M.ID) as G 
group by MajorID, MajorName having Count(ID) > 3
--Dem xem co tat ca bao nhieu chuyen nganh co tu 3 sinh vien tro len
select count(*) from (select  iif(MajorID is null,N'Không Xác Định',MajorID) as IDD,MajorName,count(ID) as M
from (select S.ID, S.Name, M.ID as MajorID , m.Name as MajorName from Student S full join Major M on S.MID = M.ID) as G 
group by MajorID, MajorName having Count(ID) > 3) as DDD

--Chuyen nganh nao co nhieu sinh vien nhat
select  iif(MajorID is null,N'Không Xác Định',MajorID),MajorName,count(ID)
from (select S.ID, S.Name, M.ID as MajorID , m.Name as MajorName 
from Student S full join Major M on S.MID = M.ID) 
as G 
group by MajorID, MajorName having count(ID) >= ALL(select count(ID)
from (select S.ID, S.Name, M.ID as MajorID , m.Name as MajorName 
from Student S full join Major M on S.MID = M.ID) 
as G 
group by MajorID, MajorName )
--Co bao nhieu sinh vien hoc chuyen nganh IA va IS
--MSV, TEN SV, MA CN, TenCN
select S.ID, S.Name, M.ID, M.Name from Student S full join Major M on S.MID = M.ID where M.ID = 'IS'
select * from Student
--6. Chuyên ngành nào có ít sv nhất
select M.ID, S.Name from Student S right join Major M on S.MID = M.ID
select G.ID , count(*) from (select M.ID, S.Name from Student S right join Major M on S.MID = M.ID) as G group by G.ID having count(*) <= ALL(
select count(*) from (select M.ID, S.Name from Student S right join Major M on S.MID = M.ID) as G group by G.ID)

--7. Đếm số sv của cả 2 chuyên ngành ES và JS 
select M.ID , count(*) from Student S full join Major M on S.MID = M.ID group by M.ID having M.ID in ('ES','JS')
select SUM(H.K) from (select M.ID , count(*) as K from Student S full join Major M on S.MID = M.ID group by M.ID having M.ID in ('ES','JS')) as H
--8. Mỗi chuyên ngành ES và JS có bao nhiêu sv

select M.ID , count(*) from Student S full join Major M on S.MID = M.ID group by M.ID having M.ID in ('ES','JS')
--9. Chuyên ngành nào có từ 3 sv trở lên
select  iif(MajorID is null,N'Không Xác Định',MajorID),MajorName,count(ID) 
from (select S.ID, S.Name, M.ID as MajorID , m.Name as MajorName from Student S full join Major M on S.MID = M.ID) as G 
group by MajorID, MajorName having Count(ID) > 3

--10. Chuyên ngành nào có từ 2 sv trở xuống
select  iif(MajorID is null,N'Không Xác Định',MajorID),MajorName,count(ID) 
from (select S.ID, S.Name, M.ID as MajorID , m.Name as MajorName from Student S full join Major M on S.MID = M.ID) as G 
group by MajorID, MajorName having Count(ID) < 2
--11. Liệt kê danh sách sv của mỗi CN
select M.ID, S.Name from Major M left join Student S on M.ID = S.MID
--12. Liệt kê thông tin chuyên ngành của mỗi sv
select S.Name, M.ID, M.Name, M.Hotline from Major M right join Student S on M.ID = S.MID

