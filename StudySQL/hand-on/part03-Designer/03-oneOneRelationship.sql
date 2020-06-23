create database DB15_Part03_02_OneOneRelationship
use DB15_Part03_02_OneOneRelationship
--tạo database lưu trữ data của các công dân (citizen) trong thành phố
--id--last name--firstName-nhiều lắm k nói tới
create table Citizen
(
	ID char(15) not null,
	LastName nvarchar(30) not null,
	FirstName nvarchar(30) not null
)
alter table Citizen 
	add constraint PK_Citizen primary key(ID)
--chèn data DML 
insert into Citizen values ('C1',N'Nguyễn',N'An')
insert into Citizen values ('C2',N'Lê',N'Bình')
insert into Citizen values ('C3',N'Võ',N'Cường')
insert into Citizen values ('C4',N'Phạm',N'Dũng')

--table passport lưu các hộ chiếu cấp cho công dân
--những thông tin cơ bản thì k cần lưu lại bên hộ chiếu
--ta phải rằng buộc các data để thỏa mãn điều kiện : 1 người thì chỉ được có 1 passport
--mói quan hệ giửa pp và Citizen là 1 - 1

create table Passport(
	PNO char(8) not null, --pk
	issuedDate date,
	expiredDate date,
	CMND char(15) not null,
	--tình huống này mình phải ép nó not null
	--pp phải được thuộc về 1 công dân nào đó
	--là 1 tham chiếu, khóa ngoại
	--khóa ngoại về mặt lý thuyết được null
	--k được, phải cho ai đó
	--unique
)
alter table Passport
	add constraint PK_Passport primary key (PNO)
--cho người ta thấy rằng nếu thiếu FK và unique thì data của ta sẽ vô lý như nào
insert into Passport values('B1','2018-12-4','2028-12-4','Ahihi')

--> méo có thằng nào là Ahihi cả, công dân cà chớn này k hề tồn tại

insert into Passport values('B2','2018-12-4','2028-12-4','Ahihi')
--1 công dân có 2 passport

--ta phải tham chiếu giá trị: chặn công dân  cà chớn
-- của cmnd từ cityzen và  cấm trùng để k ai có 2 pp
--FK tham khảo/ tham chiếu/ánh xạ chiếu đến cột id bên citizen

--pk thì có rồi cái này là 1cam61 1 người làm 2 pp(cấm trùng cmnd)
alter table Passport
	add constraint FK_CMND_Passport Foreign key (CMND) references Citizen(ID)
alter table Passport
	add constraint UQ_CMND_Passport unique (CMND)

Insert into Passport values ('B1','2018-12-4','2028-12-4','C1')
Insert into Passport values ('B3','2018-12-4','2028-12-4','C3')
select * from Passport
--In ra thong ho chieu cong dan kem ten 
select P.*, C.FirstName, c.LastName from Passport P inner join Citizen C on P.CMND = C.ID