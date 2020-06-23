create database DBK15_Part03_OneTable
use DBK15_Part03_OneTable
--nhà :		database	--Create	,drop
--tủ :		table		--create	alter	drop	rename => DDL
--quần áo	data		insert	update	delete	select=> DML
--ddl ->  data definition language
--lệnh xây nhà, mua tủ đóng kễ, đặt tên cho tủ
--DML: data manipulation language
--thêm đồ, sữa đồ, bỏ đồ, xem đồ
--DCL: data control language
--liên quan đến bảo mật, quyền truy cập
--liên quan trực tiệp đến DBA- database administration
 --ddl,dml,dcl --> gọi chung là SQL- Structure query language
 --đóng cái tủ lưu hồ sơ sinh viên DDL

 create table StudentV1
 (
	ID char(8),
	Name nvarchar(30),
	DOB date, --yyyy/mm/dd
	Sex char(1), --M,F,L,G,B,T,U
	Email varchar(50)
 )

 --dùng DML để chèn data , hoặc là sữ lý
-- nếu ta lỡ tọa table Student mà ta k dùng thì ta có thể vứt nó đi
 --drop table StudentV1
 --một hồ sỡ sv sẽ là 1 dòng data, gồm nhiều miếng data nhỏ nằm ở các cột
 --object
insert into StudentV1 values ('SE123456', N'An Nguyễn', '1999-1-1', 'F', 'an@...')
--xem xét về data
--1.char(độ dài): lưu chuỗi ký tự, dù xài ít hay nhiều, thì vẫn xài đúng cái mà ram đã cấp 
--xái ít hơn những gì được cấp thì đc bù bằng dấu space
--2.nchar(độ dài):dùng lưu ký tự có dấu kèm tiếng việt
--3.varchar(độ dài):chuỗi có đội dài thay đổi,xài nhiêu cấp nhiêu
--không quá tối đa đã xin, hiệu quả, tiết kiệm, lưu data ở đĩa, HDD,lấy lâu hơn, truy suất chậm hơn, lưu ascii

--4.nvarchar(độ dài):giống varchar nhưng có thể viết dấu, nhớ xài kèm theo N
--nếu thiếu N thì data sẽ được lưu ? ở các chỗ có dấu
--vd:
insert	into StudentV1
		values ('SE123457', 'Bình Nguyễn', '2000-1-1', 'F', 'binh@...')
select * from StudentV1
update StudentV1 set Name = N'Bình Nguyễn' where id = 'SE123457'
insert	into StudentV1
		values ('SE123457', N'Cường Võ', '2001-1-1', 'M', 'cuong@...')
		--bất ổn, em lưu sinh viên , mục đích tìm kiếm và truy suất
		-- không được trùng ID, , không thể tìm kiếm chính xác 1 người dựa vào name ,yob, sex

--vẫn có thằng id trùng nhau được thêm vào table Student 
--> ta phải tạo ra sự rằng buộc, ép người dùng nhập vào k được trùng với data đã có rồi
--constraint
--table luôn cần ít nhất 1 cột có giá trị cấm trùng phục vụ cho việc truy suất data
--cột cấm này được gọi là PK(primary key)
--1 cột PK trong table
--Student(ID, Name, YOB,Email, Phone,CMND)
--student- people
--ID: là key ứng viên sáng giá nhất để trở thành PK

--1 table có thể có nhiều key, key tốt trong trường hợp bài toán thì gọi là PK
/*
còn những thằng key mà kém may mắn hơn thì được gọi à candidate key, key ứng viên
--lúc này cột ID cần được rằng buộc ID 1 cái PK ép nó k trùng, k null
--vậy PK được gọi là 1 constraint,rằng buộc cấm trùng cấm null, giúp tìm kiếm sinh viên dể hơn

*/
 create table StudentV2
 (
	ID char(8) primary key,
	Name nvarchar(30),
	DOB date, --yyyy/mm/dd
	Sex char(1), --M,F,L,G,B,T,U
	Email varchar(50)
 )
insert	into StudentV2
		values ('SE123456', N'An Nguyễn', '1999-1-1', 'F', 'an@...')
insert	into StudentV2
		values ('SE123457', N'Bình Nguyễn', '2000-1-1', 'F', 'binh@...')
insert	into StudentV2
		values ('SE123456', N'An Nguyễn', '1999-1-1', 'F', 'an@...')
insert	into StudentV2
		values ('SE123458', null, null, null, null)
select * from StudentV2
--Ten sinh vien la null khong tot
--Ta goi day la null constraint
create table StudentV3
 (
	ID char(8) primary key,
	Name nvarchar(30) not null,
	DOB date null, --yyyy/mm/dd
	Sex char(1) null, --M,F,L,G,B,T,U
	Email varchar(50) null
 )

 --thêm data và xem thử:
insert	into StudentV3
		values ('SE123456', N'An Nguyễn', '1999-1-1', 'F', 'an@...')
insert	into StudentV3
		values ('SE123457', N'Bình Nguyễn', '2000-1-1', 'F', 'binh@...')
-- vấn đề là chạy thử thằng dưới
insert	into StudentV3
		values ('SE123458', null, null, null, null)
--Ki thuat chen data thu 3.
--Chen hut. cot.
insert into StudentV3(ID,Name) values('SE123459',N'Võ Cường')
--Muon dua hut cot thi phai liet ke cac cot muon chen`.
select * from StudentV3
insert	into StudentV3(ID, Name)
		values ('SE123460', N'Trần Hoàng Dung')
insert	into StudentV3(ID, Name)
		values ('SE123461', N'Phan Trường Phước')
--Them du lieu the nay, hay sort ten cho toi
select * from StudentV3 order by Name asc
--Tach ra thanh first name va last name de co the sort duoc
--Chap luon ten tieng viet.
create table StudentV4
 (
	ID char(8) primary key,
	FirstName nvarchar(10) not null,
	LastName nvarchar(30) not null,
	DOB date null, --yyyy/mm/dd
	Sex char(1) null, --M,F,L,G,B,T,U
	Email varchar(50) null
 )

 insert	into StudentV4
		values ('SE123456', N'An', N'Nguyễn', '1999-1-1', 'F', 'an@...')
insert	into StudentV4(ID, FirstName, LastName)
		values ('SE123457', N'Nguyễn', N'Bình')
insert	into StudentV4(ID, FirstName, LastName)
		values ('SE123460', N'Dung', N'Trần Hoàng')
insert	into StudentV4(ID, FirstName, LastName)
		values ('SE123461', N'Phước', N'Phan Trường')
select * from StudentV4
select ID ,FirstName+ ' '+LastName as FullName,DOB, Sex,Email  from StudentV4 order by FirstName asc

create table StudentV5
 (
	ID char(8) not null,
	FirstName nvarchar(10) not null,
	LastName nvarchar(30) not null,
	DOB date null, --yyyy/mm/dd
	Sex char(1) null, --M,F,L,G,B,T,U
	Email varchar(50) null,

	primary key (ID)
	--PK viết dưới này phòng cho trường hợp có composite key, key gồm 2 hay nhiều cột
 )

 --rằng buộc là gì??? là cách ta ép dữ liệu vào table phải theo 1 chuẩn nào đó (constraint)

--vd: sex phải là M F L G B T U
 --Rang buoc tuoi lon hon 18
 --Rang buoc sdt ko d.c null 
 --Rang buoc mat khau duoi 30 ki tu
 --trong DB có những loại rằng buộc nào
 --PK	khóa chính not null và cấm trùng
 --unique	-> cấm null. cấm trùng-> candidate key
 --not null		cấm null
 --FK foreign key	khóa ngoại rằng buộc tham chiếu
 --default	giá trị mặc định
 --check	
 --trong quá trình thiết kế table , một table có thể có nhiều rằng buộc
 --ta nên đặt tên cho mỗi rằng buộc này
 --để dể dàng quản lý

 --ví dụ:"
 /*
 Tên RB				Nội dung
 rule#1		đi chơi về trước 10h đêm
 rule#2		học hành ngon lành dtb 9 không rớt môn


 PK_Student:  primary key (ID)
 UQ_email:		unique(Email)
 */

 --khi ta bàn về 1 căn hộ trong trung cư
 --để tìm ra 1 can7 hộ -> cần số phòng, mẹ ơi con ở R101
 --em ở ngoài trung cư, nơi mà có rất nhiều trung cư giống nhau và em tìm phòng
 --cần số phòng, mẹ ơi con ở R101

 --R101 này không đủ mạnh để chỉ ra đích danh em đang ở đau
 --APARTMENT
--ROOM	|BldgName	|Size	|Price
--R101	|Anna		|		|
--R101	|Inno		|		|
--R101	|QTSC		|		|
--R102	|Anna		|		|
--R102	|Inno		|		|
--ta cần sự kết hợp của nhiều thông tin
--key phức hợp, key kết hợp
--composite key(gồm nhiều đặc tính gom lại thành duy nhất)
--primary key (ROOM,BldgName)

create table StudentV6
 (
	ID char(8) not null,
	FirstName nvarchar(10) not null,
	LastName nvarchar(30) not null,
	DOB date null, --yyyy/mm/dd
	Sex char(1) null, --M,F,L,G,B,T,U
	Email varchar(50) null,
	--PK viết dưới này phòng cho trường hợp có composite key, key gồm 2 hay nhiều cột
 )
 alter table StudentV6
	add constraint PK_Student primary key(ID)

 insert	into StudentV6
		values ('SE123456', N'An', N'Nguyễn', '1999-1-1', 'F', 'an@...')
/* 
Ly thuyet ve Key
Key la chia khoa duy nhat mo dung 1 o khoa duy nhat.
Mot canh cua, tim duy nhat mot object, 1 cai gi do,...
Key trong table duoc dinh nghia la 1 cot hay nhieu cot ma gia tri cua cac cell
trong cot nay la duy nhat, khong trung lai voi bat ki thoi diem nao.
Qua key ta tim duoc 1 dong duy nhat cua table.


*/
--xét table student
--ID	|Name		|YOB	|Sex	|Email	|Phone	|CMND	|BLX	|Passport
--hỏi: ai có thể làm key
--ID, Email, Phone, CMND, BLX, Passport co the lam Key.
--Toan bo dam nay goi la candidate key.(key ung vien).
--Mot table co qua nhieu key, ai trong dam key nay so nhung uu diem vuot troi 
--de giai quyet bai toan se tro thanh Key uu tien/ Key chinh/PK.
--

--Mot table co the co nhieu Key nhung chi toi da 1 Key chinh/ 1 PK.
--Ta con co them 1 khai niem goi la super key
--super key la key duoc tao ra tu 1 composite key va PK
--VD: ID,Name/ ID,Phone/ ID,BLX
--super key Thuc chat khong he co y nghia gi ca, de vui hoy.
--Rang buoc unique va rang buoc candidate key



--Tui da biet rang ID cam trung lam PK vi no hay d.c sai
--Tui cung biet rang Email cam trung, vay lam sao gai` rang buoc nay,
--vi ta biet rang table nay toi da co 1 PK thoi 
--Khong la PK ma lai cam trung`, may la ta co unique.

create table StudentV7
 (
	ID char(8) not null,
	FirstName nvarchar(10) not null,
	LastName nvarchar(30) not null,
	DOB date null, --yyyy/mm/dd
	Sex char(1) null, --M,F,L,G,B,T,U
	Email varchar(50) null,
	--PK viết dưới này phòng cho trường hợp có composite key, key gồm 2 hay nhiều cột
 )
 alter table StudentV7
	add constraint PK_StudentV7 primary key(ID)
alter table StudentV7
	add constraint UQ_Email_StudentV7 unique(Email)

insert	into StudentV7
		values ('SE123459', N'An', N'Nguyễn', '1999-1-1', 'F', 'an@...')

