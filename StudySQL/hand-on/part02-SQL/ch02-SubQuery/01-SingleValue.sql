--I. Ly Thuyet
use NORTHWND
--1.cú pháp chuẩn của câu SQL
--select .. from...where...group by... having ...order by
/*
select * hoặc cột, cột
from table,(table , table gọi việc chơi với nhiều table là join)
where điều kiện so sánh với balue(> < ..)/is null/and/or/not/between/in
group by ???
having ???
order by cột  asc/desc
2. bàn riêng về where
where cột_X so sanh với 1 value nào đó
ví dụ: where name = 'abc'
where yob = 1999
ta dùng các toán tử so sánh để so sánh với 1 value nào đó
toán tử so sánh bao gồm : < > <= >= != = ><
3. nói về câu SQL DML Select
1 câu select có thể trả về chính xác 1 ô/1value/ nào đó/cell
select * from employees --table gồm 9 dòng 18 cột
*/
select * from Employees
--Mot cau select tra ve nhieu hang va nhieu cot
--một câu select cũng có thể trả về cho ta nhiều hàng nhưng 1 cột
select EmployeeID from Employees
--một câu select cũng có thể trả ra cho ta 1 hang 2nhieu62 cột
select * from Employees where EmployeeID = 1
-- một câu select trả ra cho ta 1 hàng và 1 cột
select EmployeeID from Employees where EmployeeID = 2
select YEAR(BirthDate) from Employees where EmployeeID = 1
--1 dòng 1 cột người ta gọi là cell/ 1 value
--4.NEST SQL, SQL lồng, subQuery
--mệnh đề viết là
--where cột < > <= >= != =.. value nào đó
--ta có thể thay thế value nào đó bằng 1 cell
--miễn là câu subquery đó trả về cho ta single value
--kỷ thuật lồng 2 câu SQL vào nhau như vậy gọi là SubQuery

 ---------------------------------------------------------
--II. THỰC HÀNH
---------------------------------------------------------
--1. In ra những nhân viên ở London 
select * from Employees where City = N'London'
use NORTHWND
select * from Employees where City = N'London'
--2. In ra những nhân viên cùng quê với Anne
select * from Employees where City = N'London' --hardcore

select * from Employees 
where city = (select City from Employees where FirstName = 'Anne') and FirstName != 'Anne'
--3. Liệt kê các đơn hàng đã bán
select * from Orders where ShippedDate is not null

--4. Liệt kê các đơn hàng có trọng lượng lớn hơn trọng lượng của
--đơn hàng có mã số 10854
select * from Orders
where Freight > (select Freight from Orders where OrderID = '10854') order by Freight asc
--5. Liệt kê các đơn hàng trọng lượng lớn hơn đơn hàng 10854
--và vận chuyển đến cùng tp với đơn hàng mã 10592
select * from Orders
where Freight > (select Freight from Orders where OrderID = '10854') 
and ShipCity = (select ShipCity from Orders where OrderID = '10592')
--6. Liệt kê các đơn hàng đc ship cùng tp với đơn hàng 10592
--và có trọng lượng > 100 pound
select * from Orders 
where ShipCity = (select ShipCity from Orders where OrderID = '10592') 
and Freight > 100

--7. Những đơn hàng nào đc vận chuyển bởi cty vận chuyển mã số 
--là 1 (ShipVia)
select * from Orders where ShipVia = 1 

--8. Hãng Speedy Express vận chuyển những đơn hàng nào
select * from Shippers
select * from Orders
select * from orders where ShipVia = (select ShipperID from Shippers where CompanyName = 'Speedy Express')
--9. Liệt kê danh sách các mặt hàng/món hàng/products gồm mã sp
--tên sp, chủng loại (category)
select * from Categories
select * from Products

--10. Liệt kê danh sách các món hàng có cùng chủng loại với mặt hàng Filo Mix
use NORTHWND
select * from Products where CategoryID = (select CategoryID from Products where ProductName = N'Filo Mix')
--11. Filo Mix thuộc nhóm hàng nào 
--output: mã nhóm, tên nhóm (xuất hiện ở table Categories)
select CategoryID, CategoryName from Categories where CategoryID = (select CategoryID from Products where ProductName = 'Filo Mix')