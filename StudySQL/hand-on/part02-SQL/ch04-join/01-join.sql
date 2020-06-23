create database DBK15_ch04_Join
use DBK15_ch04_Join

create table Master(
	MNo int,
	ViDesc nvarchar(10),
)

insert into Master values (1,N'Một');
insert into Master values (2,N'Hai');
insert into Master values (3,N'Ba');
insert into Master values (4,N'Bốn');
insert into Master values (5,N'Năm');

select * from Master

create table Detailed(
	DNo int,
	EnDesc nvarchar(10),
)

insert into Detailed values (1,N'One');
insert into Detailed values (3,N'Three');
insert into Detailed values (5,N'Five');
insert into Detailed values (7,N'Seven');

select * from Master	--5
select * from Detailed --4
select * from Master,Detailed
--Bình luận kết quả nhận được:
--sau khi cho select form nhiều table cách nhau bằng dấu ,. ta nhận ra được
-- 1 object bên table nhỏ sẽ so khớp, móc nối, liên kết với tất cả các phần tử bên table lớn
--tạo nên 1 đóng lộn xộn, 4*5 = 20 dòng
--liên kệ trức tiếp đến Tích đề cát
--tích đề cát:sự bùng nổ kết quả,ghép bừa bãi,cứ 1 dòng bên này,ghép với tất cả các dòng bên kia
--không thu được 1 table bình thường
--> ngu
--cách ghép môn đăng hộ đối
--dòng bên Master tìm đúng dùng lên Detailed để nối với nhau
--ta phát hiện muốn môn dăng hộ đối thì , phải có 1 cột ở mỗi bên tròng
--trong trường hợp này là: MNO = DNO

--nếu các cột bị trùng tên nhau, hãy đổi tên để dể sử dụng
--decatery join
select m.*, D.EnDesc from Master  M, Detailed  D where MNo = DNo
select M.*, D.EnDesc from Master M, Detailed D where  MNo = DNo
--dân pro người ta không bao giờ dùng phép môn đăng hộ đối
--người ta dùng inner join = decatery join
select * from Master M inner join Detailed D on MNo = DNo
select * from Master M inner join Detailed D on MNo = DNo
--thích lấy thằng nào làm góc thì lấy
select * from Master M right join Detailed D on MNo = DNo
select * from Master M left join Detailed D on MNo = DNo
select * from Master M full join Detailed D on MNo = DNo
select * from Master M full join Detailed D on MNo = DNo
--tìm ý nghĩa của visub và ensub cho số 1 và số 2
select * from Master M full join Detailed D on MNo = DNo where MNo in(1,2)

select * from Master,Detailed where MNo = DNo and MNo in(1,2)

--Loai bo nhung dong khong phu hop
--loại bỏ 6 dòng xàm 
--dòng nào không phù với cặp No tương thích thì bỏ
--bên detailed thì mất số 7 
--bên Master mất 2 , 4
--inner join là join bằng
--ghép 2 cơ sở 2 cot65 = value

--Inner
--1.Thiết kế database để lưu thông tin sinh viên
--và chuyên ngành mà sinh viên đang theo học
--trường đại học F có mở các chuyên ngnah2 thông tin như sau
--Mã cn, tên cn,văn phòng của cn, hotline
--ví dụ IS, hệ thống thông tin, R101, 091x...
	--  js, ngôn ngữ nhật	  , R102, 098x...
--có tình trang 5 là 1 chuyên ngành không có sinh viên,vì chưa co dot tuyen sinh 
--thong tin sinh vien 
--MSV, ten sinh vien, ma chuyen nganh theo hoc
--co nhung sinh vien dang hoc tieng anh du bi nen ma chuyen nganh la null
--Ta thiet ke database luu tru dc. thong tin tren.
create table Major(
	ID char(2) primary key,
	Name nvarchar(40),
	Room char(4),
	Hotline char(11)
	)
	
	insert into Major values('IS', 'Information System', 'R101', '091x...')
insert into Major values('JS', 'Japanese Software Eng.', 'R101', '091x...')
insert into Major values('ES', 'Embedded System', 'R101', null)
insert into Major values('JP', 'Japanese Language', 'R102', '091x...')
insert into Major values('EN', 'English', 'R102', null)
insert into Major values('HT', 'Hotel Management', 'R103', null)
 create table Student(
	ID char(8) primary key,
	Name nvarchar(40),
	MID char(2) null,
	foreign key (MID) references Major(ID)
	--tôi nhìn sang table Major lấy cột ID về đỏi tên làm tham chiếu
	--phải là giá trị của cột ID Major thì mới được inser vào MID
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

--IS=4, JS= 4,ES=3,JP= 2,HT = 0,EN = 0
--3 sv đang học dự bị, tức là mã CN là null
insert into Student values ('SE123469', N'Quang Trần', null)
insert into Student values ('SE123470', N'Rừng Lê', null)
insert into Student values ('SE123471', N'Sơn Phạm', null) 
select * from Student, Major

--inner join
--mệnh đề select from...
--đằng sau from là danh sách các table
--cách nhau bằng dấu , có thể xài sub,coi sub là 1 tavle và đừng quên đặt tên
--Select * from X,Y,(Select...)as Z
--nếu không nói năng gì thì thêm sau danh sách table ,ta gọi đây là câu select
--theo kiểu tích đề cát (Decasterian),kết quả sẽ là sự bùng nổ các dòng 
--và có sự ghép cặp 1 cách vét cạn, và nó sẽ mang lại nhiều dòng vô nghĩa
--ví dụ table x có 5 dòng, tabke y có 7 dòng
--sau khi tích đề cát
--số cột bằng tổng số cột 2 table
--sô dòng = 5 * 7

--1.xem tích đề cát của 2 table Student và Major
select * from Student, Major
--table đặt trước sau không quan trọng
--gom data của 2 table lại thành 1 data lớn, số dàng bằng tích số dòng của 2 table
--số cột bắng số cột của 2 table gọp lại
--trong đây là tập hợp của rất rất nhiều dòng bữa bãi, k cân xứng, ghép xèm
--2.
--Tong quá trình ghép dòng của table , ta sẽ ghép có chọn lọc
--tức là dòng của table student  sẽ ghép với dòng của table Major
--với điều kiện là môn đăng hộ đống, là MID cảu sv so khớp với value  ID trong Major
--nếu sv có MID là IS thì sẽ ghép cặp với dòng bên Major có ID là IS
-- các dòng còn lại của Major thì hoi, k ghép , không môn đăng hộ đới6
--nhà giáo thì cưới nhà giáo, k hốt cứt

--phép kết nối 2 bảng này người ta gọi là join =, inner join, natural join,decasterianJoin
--tìm sự tuong7 hợp tự nhiên

--có 2 cách ghi join=: dùng where  = (decasterianJoin) cách 2 là dùng on(Pro hơn)
select * from Student
--sinh viên có 16 thằng
--bị hụt thông tin 3 thằng,hotline, room

--C1.Inner Join thường đặt tên giả cho table cho gọn, dể viết
--tại sao vại: vì các field thường trùng nhau về tên, khi gộp rối, tên cột
--ta cần phân biệt cột vào của tablue nào, ta dùng table.cột
--gõ tên table quá dài , mệt nhức óc, alias là tên ngắn gõ cho nhanh và tiện

--cách nối có sự tương hợp, không trùng thì loại ra
-- đúng là đã kết hợp được 13 thằng có chuyên ngành,,kết hợp chính xác
--dữ liệu k bị bùng nổ
--nhưng hụt 3 thằng sinh viên cuối,không có cn,chưa có cn sang Major tìm k thấy cn
--tương ứng, bị loại khỏi kết quả
-- vẫn câu trên nhưng cắt bớt số cột đi, hiển thị ít cột hơn
--ID SV, Tên SV, Mã CN, Tên CN
--cắt cột thì số dòng k bị ảnh hướng
select s.*,m.Name,m.Room from Student S inner join Major  M on S.MID = M.ID

------------------------------------
--Liệt kê thông tin sinh viên
select * from Student
--Liệt kê thông tin sinh viên kèm thông tin chuyên ngành mà sv theo học
--tức là ví dụ thấy MID là IS, thì in kèm thêm các cột Tên CN, số Đt...
--của bên chuyên ngành
--như vậy ta cần ghép 2 table, ko ghép bừa bãi, ghép có đk
--MID của Student ghép cặp với ID của Major, ghép đúng bằng nhau luôn
select K.*, U.Name, U.Room, U.Hotline from Student K inner join Major U on K.MID = U.ID
select S.*, M.Name, M.Room, M.Hotline from Student S, Major M where S.MID = M.ID
select S.*, M.Name from Student S inner join Major M on S.MID = M.ID


select * from Student S left join Major M on S.MID = M.ID
--Ghep ben nay voi ben kia, nho kiem tra co ghep dung hay khong.
--Join inner thi thu tu truoc sau khong quan trong, nhung ma left right thi co.

--3. Liệt kê danh sách chuyên ngành kèm danh sách sinh viên kèm theo
--Output: Mã CN, Tên CN, Mã SV, Tên SV
select M.ID, M.Name, S.ID, S.Name from Major M left join Student S on M.ID = S.MID
--Mat 3 sinh vien khong co chuyen nganh, ghep cap khong duoc.
--Se mat luon 2 chuyen nganh ko co hoc sinh theo hoc neu ta dung join =.
--Khi nao dung join = hay dung left right join
--Voi dang de liet ke chuyen nganh kem voi thong tin sinh vien theo hoc
--Thi lam on choi join = de khong hien ra nhung thang ko co sv.
--Neu de muon in ra thong tin cua chuyen nganh kem so luong sv thi ta choi left right
--Chot ha:
--Ghep = la neu 2 ben khong tuong hop thi mat luon chi tim bang cua 2 ben
--2 Chuyen nganh khong co sinh vien mat'.
--3 sinh vien khong co chuyen nganh mat luon.
--De lay ca 2 phan khong tuong hop voi nhau
--Ta sai outer join bao ham ben trong inner join va khong bang nhau 
--Co 3 loai outer join: left right full
--left right tuy thuoc vao goc nhin, goc dat cua table
--quy uoc sai left khong sai right.
--5. Hãy liệt kê các sinh viên của các CN. Ta mún thấy các CN đc hiển thị
--ra và kèm theo đó là Info của sv. Nếu chuyên ngành ko có sv thì cũng 
--hiển thị lươn
select * from Major M full join Student S on M.ID = S.MID 
select M.ID, M.Name, S.ID, S.Name from Major M left join Student S on M.ID = S.MID
--6. In ra chuyen nganh khong co sinh vien
select M.ID, M.Name, S.ID, S.Name from Major M left join Student S on M.ID = S.MID where S.ID is NULL
--7. In ra sinh vien khong co chuyen nganh 
select S.ID, S.Name, M.Name, M.Room  from Student S left join Major M on S.MID = M.ID where M.ID is NULL 
use NORTHWND
--1. Mỗi công ty đã vận chuyển bao nhiêu đơn hàng
--Output 1: Mã cty, số đơn hàng
select * from Orders
select ShipVia ,count(*) from Orders group by ShipVia
--Output 2: Mã cty, tên cty, số đơn hàng  
select * from Orders
select S.ShipperID, S.CompanyName, count(*) from Orders O left join Shippers S on O.ShipVia = S.ShipperID group by ShipperID, CompanyName order by ShipperID asc
select S.ShipperID, S.CompanyName, count(*)  from Orders O left join Shippers S on O.ShipVia = S.ShipperID group by CompanyName, ShipperID

--2. Công ty nào vận chuyển nhiều đơn hàng nhất
--Output: Mã cty, tên cty, số đơn hàng  
select S.ShipperID, S.CompanyName, count(*)  
from Orders O left join Shippers S on O.ShipVia = S.ShipperID 
group by CompanyName, ShipperID
having count(*) >= ALL(select count(*)  
from Orders O left join Shippers S on O.ShipVia = S.ShipperID 
group by CompanyName, ShipperID) 

--3. Mỗi nhân viên đã chăm sóc bao nhiêu đơn hàng
--Output 1: Mã nhân viên, số đơn hàng
select * from Orders

select EmployeeID, Count(*) from Orders group by EmployeeID
--Output 2: Mã nhân viên, tên nhân viên, số đơn hàng  
select E.EmployeeID, E.FirstName, count(*) from Orders O right join Employees E on O.EmployeeID = E.EmployeeID group by E.EmployeeID, FirstName
select e.EmployeeID, e.FirstName, count(*) from Orders O left join Employees E on O.EmployeeID = E.EmployeeID group by e.EmployeeID, e.FirstName 
--4. Liệt kê các đơn hàng mà nhân viên quê ở London chăm sóc
--Output: Mã nv, tên nv, mã đơn hàng, mã khách hàng
select E.EmployeeID, E.FirstName, E.City, O.OrderID, O.CustomerID from Orders O right join Employees E on O.EmployeeID = E.EmployeeID where City = 'London'
select * from Employees 
 
--5. THống kê số lượng các đơn hàng mà mỗi nhân viên quê London chăm sóc
--Output: Mã nv, tên nv, số lượng đơn hàng  
select E.EmployeeID, E.FirstName, count(*) from Orders O right join Employees E on E.EmployeeID = O.EmployeeID where City = 'London' group by E.EmployeeID, FirstName