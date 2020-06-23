--Review
--cú pháp chuẩn của 1 câu select
--select...from...where..group by ...having...order by....
--select cột, công thức trên cột
--where cột so với (value cột)
--group by cột, cột, cột(chỉ group by nếu select có xài count,min, max, avg,sum)
--order by  cột. cột.cột(asc)desc

--mẹo đếm
--đếm--> count(*) không quan tâm giá trị, cứ có dòng là đếm=>đếm dòng
--count cột: không đếm null-->đếm bao nhiêu ô có value/cell
--tổng của 1 cột xuyện dòng, sum
--trung bình xuyên dòng avg
--lớn nhất nhỏ nhất của 1 cột min/max nó phải nằm trong mệnh đề select
--(ta dùng all để thay thế)

--cách nhận biết khi nào thì nên dùng group by
--phát hiện từ: mỗi(each)-->group by + hàm aggregate: sum,count,avg...
--số lượng đám nào đó lớn hơn > 5
--số lượng dấm nào đó lớn nhất
--chia 2 chặn: tính số lượng, sau đó where
--agg() với group by kèm having

--tĩnh nào có hơn 500 sv
--count(*) group by tĩnh having count(*) > 500
--đếm đám này theo tĩnh, có số đếm rồi hỏi :"có lớn hơn 500 k"

--CRUD--Create--Remane--Update---Delete
--javaOOP: file(data người dùng)(javaCore-OOP)
--java desktop:app--DB:java colection framework
--javaWeb:html css java server(json)--API

--tạo cho anh db có tên là  DBK15_ch03_Aggregate
--1 table lưu điểm trung bình của sv
--GPA: name,points,major 
create database DBK15_ch03_Aggregate
use DBK15_ch03_Aggregate
create table GPA(
	NAME nvarchar(30),
	POINTS float(4),
	Major char(3)
	)
insert into GPA values(N'An', 9, 'IS')
insert into GPA values(N'Bình', 7, 'IS')
insert into GPA values(N'Cường', 5, 'IS')--

insert into GPA values(N'Dũng', 8, 'JS')
insert into GPA values(N'Em', 7, 'JS')
insert into GPA values(N'Giang', 4, 'JS')
insert into GPA values(N'Hương', 8, 'JS')--cầu nối

insert into GPA values(N'Khanh', 7, 'ES')
insert into GPA values(N'Minh', 6, 'ES')
insert into GPA values(N'Nam', 5, 'ES')
insert into GPA values(N'Oanh', 5, 'ES')--nhúng 

insert into GPA values('janna',6,'IA')
insert into GPA values('poppy',6,'IA') --ia an toàn thông tin 
select * from GPA
--1. Có tất cả bao nhiêu sinh viên 
select count(*) from GPA 
use DBK15_ch03_Aggregate
select count(*) from GPA
select * from GPA
--những thằng có cùng tên thì gọp lại rồi đếm
--2. Chuyên ngành nhúng có bao nhiêu sv
select Major, count(*) from GPA group by Major having Major ='ES'
select Major, count(*) from GPA group by Major having Major = 'ES'
--2.1. Hai chuyên ngành nhúng và cầu nối có tổng cộng bao nhiêu sv
select sum(d.mj)from(select count(*)as mj from GPA group by Major having Major in('JS','ES'))as d
select sum(b.a) from(select count(*) as a from GPA group by Major having Major in ('es','js')) as b
select count(*) from GPA where Major in('js','es')
select count(*) from GPA where Major in ('js','es')
 --2.1.a Đếm xem mổi chuyên ngành có bao nhiêu SV 
 select count(*) from GPA group by Major
 --2.1.1. Chuyen nganh nao co tu 3 sinh vien tro len
 select Major,count(*) as noOfStudent from GPA group by Major having count(*) >3
 select Major, count(*) from GPA group by Major having count(*) > 3
 --LUU Y:
 --Chia nhóm, đếm được theo nhóm, in số lượng. Nếu ta muốn in tên nhóm kèm số sượng thì ta dùng group by
 --kèm theo vế trước select tên nhóm đó
 --lưu ý. Quy ước nếu có 1 cột xuất hiện mà không nằm trong aggregate thì bắt buộc cột đó
 --thì phải nằm trong group by
 --Chuyên ngành nào có từ 3 sinh viên trở lên
 --B1: Đếm số sinh viên theo Major
 --B2: Đếm xong, lọc lại lần nữa để tìm ra số lượng thỏa 3.
 --Ta gọi việc này là lọc sau đếm, lọc sau aggregate, where sau aggregate
 --gọi là having.
 --2.2. Hai chuyên ngành nhúng và cầu nối, mỗi chuyên ngành có bao nhiêu sv
select Major, count(*) from GPA group by Major having Major in('JS','ES')
select sum(m.sv) from (select Major, count(*) as sv from GPA group by Major having Major in('JS','ES')) as m

--3. Chuyên ngành IS có bao nhiêu sv???
select count(*) from GPA where Major = 'IS'
--4.Mỗi chuyên ngành có bao nhiêu sinh viên
--trong kết quả hiện ra bắt buộc phải thấy được chữ
----IS số lượng
--JS số lượng
--ES số lượng
--cứ gặp dòng IS đếm ra kết quả count IS
--cứ gặp dòng JS đếm ra kết quả count js
--tương tự với ES
--chia nhóm ra mà đếm, group by major
--bổ xung thêm 1 dòng sinh viên thuộc chuyên ngành ngôn ngữ nhật
insert into GPA values (N'Phượng', 8, 'JP')
select * from GPA
--bổ xung thêm 1 dòng quản lí khách sạn
insert into GPA values(null, null, 'HT')
select * from GPA
--4. Mỗi chuyên ngành có bao nhiêu sinh viên
select Major, count(NAME) from GPA group by Major
--NOTE: count cái nào đếm cái đó.
--5.Chuyên ngành nào có từ 4 sinh viên trở lên
select Major, count(Name) from GPA group by Major having count(Name)>=4
--6. Chuyên ngành nào có ít sinh viên nhất và chuyên ngành nào có nhiều sinh viên nhất
select Major, count(Name) from GPA group by Major having count(Name) <= All(select count(Name) from GPA group by Major )
select Major, count(Name) from GPA group by Major having count(Name) >= ALL(select  count(Name) from GPA group by Major)
----------------------------------------------------
--MIN(), MAX(), AVG(), SUM()
----------------------------------------------------
--đây là những hàm gom nhóm
--gom từ nhiều về 1 con số
--gom trên value của cột
--gom trên cell , không phải đếm lượt
--xất hiện count(cột),là những hàm sẽ cộng, ...trung bình, so sanh trên
--các value của cell.có value mới tinh, null thì không chơi
--cú pháp và cách xài rất giống count, xài kèm với group by having
--1. Tìm xem điểm nào là to nhất, lớn nhất???
select POINTS from (select * from GPA where POINTS is not null) as g where g.POINTS >= ALL(select POINTS from GPA where POINTS is not null)
--NOTE: Nếu cột value so sánh có NULL thì bỏ cả 2 vế so sánh vì máy tính cho NULL bằng 1 giá trị cực lớn
select max(GPA.POINTS) from GPA
--Dùng MIN MAX ở vế WHERE
select POINTS from GPA where POINTS = (select Max(GPA.POINTS) from GPA)
--2.Trung bình cộng của tất cả các điểm đang có là bao nhiêu
select round(avg(GPA.Points),0) from GPA
select round(avg(GPA.POINTS),0) from GPA
--3.Tổng các điểm của tất cả các sinh viên là bao nhiêu
select sum(GPA.POINTS) from GPA
--5. Điểm lớn nhất của ngành IS là điểm mấy 
select max(POINTS) from GPA where Major ='IS'
--Lọc ra những thằng học IS từ đó lấy ra được max của points
--Thì point lúc này là Point của những thằng IS
--5.1 ai là thủ khoa IS
 
select * from GPA where POINTS = (select max(POINTS) from GPA where Major ='IS') and Major = 'IS'
insert into GPA values ('miz', 9 , 'IA')
--6. Điểm trung bình của chuyên ngành nhúng là bao nhiêu???
select avg(points) from GPA where Major = 'ES'
--7. SV nào có điểm lớn hơn điểm trung bình của các chuyên ngành???
--Câu hỏi gián tiếp
select round(avg(points),0) from GPA
select * from GPA where POINTS > (select round(avg(points),0) from GPA)


--8. Ai đội sổ (ai có điểm bé nhất)
select NAME, POINTS from GPA where POINTS <= ALL(select POINTS from GPA where POINTS is not null) and POINTS is not null
select NAME, POINTS from GPA where POINTS <= ALL(select POINTS from GPA where POINTS is not null) and POINTS is not null
select POINTS from GPA where POINTS <= ALL(select POINTS from GPA where POINTS is not null) and POINTS is not null
select Min(POINTS) from GPA 
--Chuyên ngành IS ai là thủ khoa
select * from GPA where POINTS = (select max(POINTS) from GPA where Major = 'IS') and Major = 'IS'\
--Điểm lớn nhất của mỗi chuyên ngành là bao nhiêu điểm
select Points,Major from GPA

select Major ,max(POINTS) from GPA group by Major
--Gom nhóm major và dựa trên nhóm tìm ra lớn nhất dựa trên điểm.
--Chuyên ngành nào có điểm thủ khoa vượt 8.
select * from (select Major ,max(POINTS) as B from GPA group by Major) as v where v.B > 8

select Major ,max(POINTS) from GPA group by Major having max(POINTS) > 8
--13.HACK NÃO Liệt kê những sinh viên đạt thủ khoa của mỗi chuyên ngành
--Câu này chưa làm được. Đợi sau khi học join ta quay lại làm
--MSV, Tensv, CN cua sv
select Major,max(GPA.POINTS) from GPA group by Major
select G.NAME,G.Major, S.t from GPA G right join (select Major,max(GPA.POINTS) as t from GPA group by Major) S on G.Major = S.Major and G.POINTS = S.t
select * from GPA
select * from GPA
select Major,max(GPA.POINTS) from GPA group by Major
select G.NAME,d.Major,d.t
from GPA G right join (select Major,max(GPA.POINTS) as t from GPA group by Major) as d on G.Major=d.Major and g.POINTS = d.t 
--14.1
Use NORTHWND
--Trọng lượng nào là con số lớn nhất , tức là trong các đơn hàng đã giao dịch
select * from Orders
select max(Freight) from Orders where ShippedDate is not null
--14. Đơn hàng nào có trọng lượng lớn nhất
--Output: mã đơn, mã kh, trọng lượng
select * from Orders where Freight >=all(select Freight from Orders)

select OrderID,CustomerID,Freight from Orders where Freight = (select max(Freight) from Orders)
--15.Đếm số đơn hàng của mỗi quốc gia
select ShipCountry ,count(*) from Orders group by ShipCountry
--16. Quốc gia nào có nhiều đơn hàng nhất.
--Quốc gia nào có trên 100 đơn hàng
select * from Orders
select ShipCountry, count(*) from Orders group by  ShipCountry
select ShipCountry ,count(*) from Orders group by ShipCountry having count(*) > 100
select ShipCountry, count(*) from Orders group by ShipCountry having count(*) >= ALL(select count(*) from Orders group by ShipCountry)
use NORTHWND
select * from Orders
select ShipCountry, count(*) from Orders group by ShipCountry order by ShipCountry asc
select max(m.n) from (select ShipCountry, count(*) as n from Orders group by ShipCountry) as m 
select ShipCountry, count(*) from Orders group by ShipCountry having count(*) > 100  
--Mỗi công ty đã vận chuyển bao nhiêu đơn hàng
-- In ra mã công ty, số lượng đơn hàng
select * from Shippers
select * from Orders
select ShipVia,count(*) from Orders group by ShipVia

--17. Mỗi cty đã vận chuyển bao nhiêu đơn hàng
--Output1: Mã cty, số lượng đơn hàng
--Output2: mã cty, tên cty, sl

--Output1: mỗi cty - group by ShipVia
use NORTHWND
select * from Shippers
select * from Orders
select ShipVia, count(*) from Orders group by ShipVia 
--18. Cty nào vận chuyển ít đơn hàng nhất
--Output1: Mã cty, số lượng đơn
select ShipVia, count(*) from Orders group by ShipVia having count(*) <= ALL(select count(*) from Orders group by ShipVia)  

--19. Tính tiền của mỗi đơn hàng
select * from [Order Details]

select OrderID, ProductID ,UnitPrice*Quantity*(1-Discount) as Qy from [Order Details]

select OrderID, round(sum(U.Qy),0) 
from (select OrderID, ProductID ,UnitPrice*Quantity*(1-Discount) as Qy 
from [Order Details]) as U group by OrderID

--20. Đơn hàng nào có tổng tiền >= 1000 đồng
--đó bạn tự cho
--Hint: having

select OrderID, round(sum(U.Qy),0) from
 (select OrderID, ProductID ,UnitPrice*Quantity*(1-Discount) as Qy from [Order Details]) as U 
 group by OrderID 
 having round(sum(U.Qy),0)>1000
 --21. Tính tiền của đơn hàng 10248 -> biết chắc là 440 đồng
 select OrderID, round(sum(U.Qy),0) from
 (select OrderID, ProductID ,UnitPrice*Quantity*(1-Discount) as Qy from [Order Details]) as U 
 group by OrderID 
 having OrderID = 10248

 select OrderID, round(sum(U.Qy),0) from
 (select OrderID, ProductID ,UnitPrice*Quantity*(1-Discount) as Qy from [Order Details]) as U 
 where OrderID = 10248

 select OrderID, ProductID ,UnitPrice*Quantity*(1-Discount) as Qy from [Order Details] where OrderID = 10248
 select sum(d.Qy) from ( select OrderID, ProductID ,UnitPrice*Quantity*(1-Discount) as Qy from [Order Details] where OrderID = 10248) as d
--
--21. Ba nước Anh Pháp Mĩ có tổng cộng cả 3 nước
--là bao nhiêu đơn hàng
--cứ là Anh Pháp Mĩ thì đếm
--where gặp 1 trong ba thằng là count++
select * from Orders
select count(*) from Orders where ShipCountry in ('UK','USA','France')


--22. Ba nước Anh Pháp Mĩ mỗi nước có tổng cộng
--là bao nhiêu đơn hàng
--Xem Mĩ có bao nhiêu đếm
--Xem Anh có bao nhiêu đếm
--Xem Pháp có bao nhiêu đếm
select ShipCountry ,count(*) from Orders group by ShipCountry having ShipCountry in ('UK','USA','France')
--23. HẮC NÃO: TRONG ANH PHÁP MĨ THẰNG NÀO NHIỀU ĐƠN HÀNG NHẤT

select ShipCountry ,count(*) from Orders where ShipCountry in ('UK','USA','France')  group by ShipCountry having COUNT(*) >=ALL(select count(*) from Orders where ShipCountry in ('UK','USA','France')  group by ShipCountry )