--tạo cho anh 1 cái database
--DBK15_BasicSelect_LikeHacking

--tạo bản cho anh
--SalesRate
--id
--name 30
--email 50
--commision  50
CREATE DATABASE DBK15_BasicSelect_LikeHacking
USE DBK15_BasicSelect_LikeHacking
CREATE TABLE SalesRate(
	id int primary key identity,
	name nvarchar(30),
	title varchar(30),
	email nvarchar(50),
	commision nvarchar(20)
)

insert into SalesRate(name,title,email, commision) values ('Seosamh O''Conaill', 'Sales Representative', 'seo_conaill@foo.com', '5%-15%');
insert into SalesRate(name, title, email, commision) values ('Nancy C. Walker', 'Sales Representative', 'nancy-walker@foo.com', '15%');
insert into SalesRate(name, title, email, commision) values ('Gearóid O''Tuathail', 'Sales Agent', 'gear_tuat@foo.com', '10%-20%');
insert into SalesRate(name, title, email, commision) values ('O''Beefe', 'Sales Agent', 'beefe@foo.com', '20%');
insert into SalesRate(name, title, email, commision) values ('O''Reilly', 'Sales Associate', 'o_reilly@foo.com', '10%');
insert into SalesRate(name, title, email, commision) values ('Raphael Schweikert', 'Sales Associate', 'raph@foo.com', '8%-10%');
insert into SalesRate(name, title, email, commision) values ('Ann Jessie', 'Sales Manager', 'anjess@foo.com', '10.5%');
insert into SalesRate(name, title, email, commision) values ('Denis O''Brien', 'Sales Manager', 'den_brien@foo.com', 'TBA');
insert into SalesRate(name, title, email, commision) values ('Joseph O''Sullivan', 'Sales Manager', 'jo-sull@foo.com', 'TBA');


select * from SalesRate

--1. In ra nhân viên mà email có chứa chữ - 
select * from SalesRate where email like '%-%'

--2. In ra nhân viên mà email có chứa chữ _
select * from SalesRate where email like N'%[_]%'
--3. Nhân viên nào có huê hồng bằng đúng 10%
select * from SalesRate where commision = '10%'
--4. Nhân viên nào có huê hồng chứa 10%
select * from SalesRate where commision like N'%10[%]%'
--5. Nhân viên nào email có chứa - và huê hồng đúng 10%
select * from SalesRate where email like N'%-%' and email = '10%'
--6. Nhân viên nào email có chứa _ và huê hồng đúng 10%

select * from SalesRate where email like N'%[_]%' and email = '10%'
--7. Nhân viên nào email chứa _ và huê hồng chứa 10%
select * from SalesRate where email like N'%[_]%' and commision like N'%10[%]%'
/*
	thay vì dùng []để phế võ công của % và _ trong toán tử like
	--ta dùng 1 kỹ thuật khác nó có tên là escape charactor,gọi là chuổi thoát
	tức là ta quy ước 1 ký tự đặc biệt nào đó, thường sẽ là
	# $ ^ ~(vì những thằng này ít xuất hiện trong value)
	dùng để đánh dấu trước ký tự muốn phế võ công
	% và _ không còn đại diện cho 1 nhóm hay 1 ký tự nữa
	
	ví dụ:
	nhận viên nào có email chứa _

*/
select * from SalesRate where email like '%~_%' escape '~'
-- ai co hoa hong chua 10% 
select * from SalesRate where commision like '%10$%%' escape '$'

 ----------------------------------------------
 --BÀN THÊM VỀ KÍ TỰ '
 ----------------------------------------------
 --'' nhiệm vụ của nó là báo hiệu cho engine biết tiếp sau đó là chuỗi
 --' thứ 2 báo hiệu kết thúc chuỗi
 --'' dùng để bọc chuỗi, khóa chuỗi
 --hello => 'hello'
 --nhưng c và java ""

 --điều gì sẽ xảy ra nếu= > ta nhập tên của thằng O'Reilly vào
 --'O'Reilly'
 -- ta nhân bản ' lên thành 2 để báo hiệu cho engine biết rằng thằng ' trong '' là 1 data
 --việc nhân bản '' giúp phế võ công của '.
 --Tìm nhân vien nào tên có chứa '
 select * from SalesRate where name like '%''%'
 select * from SalesRate where name = 'O''Reilly'