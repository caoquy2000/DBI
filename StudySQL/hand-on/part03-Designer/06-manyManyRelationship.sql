create database DBK15_part05_manyManyRelationship
use DBK15_part05_manyManyRelationship
--Moi quan he nhieu nhieu se phat sinh ra bang trung gian, mac dinh duoc ghep tu ten cua 2 table
--Key cua 2 table se dem sang table trung gian lam FK
--Ta su dung surrogate KEy lam table trung gian de cho 2 FK duoc xuat hien nhieu lan trong 2 table,
--chung to quan he n-n ra~ ra 2 moi quan he 1-n.
create table Club(
	ID char(4) not null,
	name nvarchar(50)
)
alter table Club
	add constraint PK_Club primary key (ID)
insert into Club values ('VOVI',N'CLB Việt Võ Đạo')
insert into Club values ('FEV',N'CCLB Sự Kiện')
insert into Club values ('FBK',N'CLB Âm Nhạc')
insert into Club values ('SITI',N'CLB Tình Nguyện')

select * from Club

create table Student(
	ID char(8) not null,
	name nvarchar(50)
)
alter table Student
	add constraint PK_Student primary key (ID)

	select * from Student
--note*: cam tao FK trong student hay Club vi se bien thanh 1-n va khong luu duoc data dung nhu bai yeu cau.
--Mot sinh vien tham gia nhieu cau lac bo va nguoc lai.
insert into Student values ('s1',N'An')
insert into Student values ('s2',N'Bình')
insert into Student values ('s3',N'Cường')
insert into Student values ('s4',N'Dũng')
insert into Student values ('s5',N'Em')

--Tao table trung gian:
create table Registration(
	SEQ int not null identity,
	SID char(8),
	CID char(4),
	RegDate datetime,
	LevDate datetime,
)

alter table Registration
	add constraint PK_Registration primary key (SEQ)
alter table Registration
	add constraint FK_Registration_Student foreign key (SID) references Student(ID) on delete set null
																					on update cascade
alter table Registration 
	add constraint FK_Registration_Club foreign key (CID) references Club(ID)

--có quyền insert thiếu cột trong tình huống này
--do cột đầu tiên đã tự động có giá trị được chèn vào
insert into Registration values ('s1','VOVI','2017-1-1','2018-12-1')
insert into Registration values ('s1','FEV','2017-1-1',null)
insert into Registration values ('s1','FBK','2017-1-1',null)
insert into Registration values ('s2','VOVI','2017-1-1',null)
insert into Registration values ('s3','VOVI','2017-1-1',null)

select * from Registration
--1. hãy in ra thông tin sv đăng ký clb
--output mả sv ,tên sv, mãclb, tên clb
select S.ID, S.name, R.CID
from Student S join Registration R on S.ID = R.SID
--cách 2 cho câu trên bằng kỹ thuật tích đề cát
select S.ID, S.name, R.CID
from Student S, Registration R where S.ID = R.SID
--2.đếm xem mỗi CLB có bao nhiêu SV tham gia
--output1: mã CLB, số lượng
select CID, count(SID)
from Registration r right join Club c on r.CID = c.ID
group by CID

select c.ID,c.name, count(SID)
from Club c left join Registration r on c.ID = r.CID
where LevDate is null
group by c.ID,c.name
select * from Registration
--output2: mã CLB, tên clb , số lượng
--đừng quên count cột nhen, vì count dòng thì có 1 dòng
--SITI, cuont cột mã sv thì cvì SITI k có SV đk,vậy mang
--null. mà count trên null thì ra 0
-----------------
select * from Club
select * from Student
select * from Registration
--BTVN
--CLB nào có nhiều sv nhất
select  max(ka.SL)
from (select c.ID,c.name, count(SID) as SL
from Club c left join Registration r on c.ID = r.CID
where LevDate is null
group by c.ID,c.name) as KA

select c.ID,c.name, count(SID)
from Club c left join Registration r on c.ID = r.CID
where LevDate is null
group by c.ID,c.name 
having count(SID) >= ALL(select count(SID)
from Club c left join Registration r on c.ID = r.CID
where LevDate is null
group by c.ID,c.name)
select * from Registration
--CLB vovi có bao nhiêu sv
select c.ID,c.name, count(SID)
from Club c left join Registration r on c.ID = r.CID
where LevDate is null
group by c.ID,c.name having c.ID = N'SITI'
--đếm xem số lượng clb mà mỗi sinh viên đang tham gia
select S.ID,S.name,count(R.CID)
from Student S left join Registration R on S.ID = R.SID
where LevDate is null
group by S.ID,S.name

--sv nào đang tham gia nhiều clb nhất
select S.ID,S.name,count(R.CID)
from Student S left join Registration R on S.ID = R.SID
where LevDate is null
group by S.ID,S.name having count(R.CID) >= ALL(select count(R.CID)
from Student S left join Registration R on S.ID = R.SID
where LevDate is null
group by S.ID,S.name)

--sinh vien an tham gia những câu lạc bộ nào 
select *
from Student S left join Registration R on S.ID = R.SID 
			   left join Club c on r.CID = c.ID
where S.name = N'an' and LevDate is null
--clb vovi và fbk có tổng cộng bao nhiêu sv
select sum(d.noOfStudent) from (select c.ID ,COUNT(SID) as noOfStudent
from Club C left join Registration R on C.ID = R.CID group by C.ID having C.ID = N'VOVI' or C.ID = N'FBK') as D