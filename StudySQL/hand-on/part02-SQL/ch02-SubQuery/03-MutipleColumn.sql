--03.MultipleColumn
--Công thức chuẩn của Select
--Select ..From....Where...group By...Having...order by

--From..(danh sách các table), -> có thể bỏ vào đây 1 câu sub query(không quan tâm cột và dòng)
--where..=>sub 1 cột xài với IN, 1 value thì xái với operator
--group by...
--having...
--order by

--mệnh đề From thì cần 1 hay nhiều table
--hôm nay mình mới học 1 table hoi, tuần sau học from nhiều table với nhau gọi chung là join

--câu SQL DML select về bản chất luôn trả về 1 table(1 cột 1 dòng, nhiều dòng 1 cột, nhiều cột nhiều dòng)
--do đó câu select SQL DML có thể được xuất hiện ở from thay thế cho table nhưng,đừng quên đặt tên cho nó
--cách đặt tên cho table được tạo bới select là dùng ALIAS và viết là as
--sau đó ta thoải mái xài các field của table SQL này như 1 table bình thường
--1 câu select luôn trả về dạng table , gồm hàng và cột
--1.table có thể 1 dòng 1 cột
select city from Employees where EmployeeID = 1
--2.câu select có thể trả về 1 table gồm 1 cột nhiều dòng (multiple values)
Select distinct city from Employees
--3.Table trả về cũng có thể gồm nhiều dòng nhiều cột
select FirstName, LastName, BirthDate from Employees

--> 1 câu select auto trả về nhiều dòng nhiều cột, 1 table
--đã coi là 1 table thì luôn luôn có thể bỏ vào from xài bình thương
--nhưng nhớ cho table này 1 tên giả ALIAS, nhét vào ()
use NORTHWND

--1 liệt kê các nhân vien đến từ london
select * from Employees where City ='London'
--2 Lệt kê các nhân viên đến từ London và làm đại diện kinh doanh
--làm cách thường và làm bằng Sub querry ở from
select * from Employees where City = 'London' and Title = 'Sales Representative'
select bang1.* from (select * from Employees where City = 'London' ) as Bang1 where Title = 'Sales Representative'
--3. Liet ke cac khach hang den tu Mi Anh Phap va co so fax
select * from (select * from Customers where Country in ('USA', 'UK', 'France') )as A where Fax is not null 
--4. Liet ke cac don hang gui den Sao paulo duoc van chuyen boi cong ty co ma so 2
select * from Shippers
select * from Orders
select * from (select * from Orders where ShipCity = 'Sao Paulo') as B where ShipVia = (select ShipperID from Shippers where ShipperID = 2)
--4.1 Liet ke cac don hang gui den Sao Paulo duoc van chuyen boi united packag
select * from Orders where ShipVia = (select ShipperID from Shippers where CompanyName = 'United Package') and ShipCity = 'Sao Paulo'

select * from (select * from Orders where ShipCity = 'Sao Paulo') as C where ShipVia = (select ShipperID from Shippers where CompanyName ='United Package')
--5. Liệt kê các đơn hàng do nhân viên mã số 1 chăm sóc và gửi đến Sao Paulo
select * from Employees
select * from Orders where ShipCity = 'Sao Paulo' and EmployeeID = 1
select * from (select * from Orders where ShipCity ='Sao Paulo') as D where EmployeeID =1
--6. Liệt kê các đơn hàng do nhân viên Nancy chăm sóc và gửi đến Sao Paulo
select * from Employees 
select * from Orders where ShipCity = 'Sao Paulo' and EmployeeID = (select EmployeeID from Employees where FirstName = 'Nancy') 
select * from (select * from Orders where ShipCity = 'Sao Paulo') as BC where EmployeeID = (select EmployeeID from Employees where FirstName = 'Nancy')
--chốt hạ: mệnh đề where gồm nhiều mệnh đề and thì t
--ta có thể tách thành các câu sub khác nhau, và lồng trong mệnh đề from
