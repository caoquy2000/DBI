--tạo cho anh DBK15_SubQuery_ALL
--tạo cho anh table Odds
-------number int
--chèn data vào 1 3 5 7 9


--tạo table Evens
--chèn data 0 2 4 6 8
--tạo table Integers
--chèn data 1 3 5 7 0 2 4 6 8

CREATE DATABASE DBK15_SubQuery_ALL
CREATE TABLE Odds (
	number int
	)
insert into Odds values (1)
insert into Odds values (3)
insert into Odds values (5)
insert into Odds values (7)
insert into Odds values (9)

CREATE TABLE Evens (
	number int 
	)
insert into Evens values (0)
insert into Evens values (2)
insert into Evens values (4)
insert into Evens values (6)
insert into Evens values (8)

CREATE TABLE Integers (
	number int 
	)
insert into Integers values (1)
insert into Integers values (3)
insert into Integers values (5)
insert into Integers values (7)
insert into Integers values (9)
insert into Integers values (0)
insert into Integers values (2)
insert into Integers values (4)
insert into Integers values (6)
insert into Integers values (8)

select * from Odds
select * from Evens
select * from Integers

--I.Lý Thuyết
--ALL 
--1.SQL cung cấp thêm 2 toán tử ALL dùng kết hợp với mệnh đề so sánh
--so sánh Operator 
--cú pháp
--Toán tử so sánh ALL(câu sub-select trả về tập giá trị-select trả về chỉ một cột nhiều/hay một dòng)
--Ví dụ:
--where, freight >= (câu lệnh sub nào đó trả về một đống số thực)
--Ý nghĩa của ALL 
--Where cột so với all (tập value)
--Value của cột so sánh và thỏa mãn với TẤT CẢ  các phần tử trong tập Value sẽ chặt hơn so với any
--ALL thỏa mãn với tất cả

--1.Tìm trong Evens những số nào lớn hơn tất cả các số bên opps
select * from Evens where number >  ALL(select number from Odds) 
--
--Không ai thỏa mãn vì max ở evens là 8, thua 9 bên odds khoogn có 1 số nào lớn hơn tất cả các số bên odds
--2.Tim bên odds những số nào lớn hơn tất cả các số bên evens
select * from Odds where number > ALL(select number from Evens)
--3.Tìm trong Odds những số nào lớn hơn tất cả những số bên trong odds
select * from Odds where number > ALL(select number from Odds)
--4.Tìm trong odds những số nào lớn hơn hay bằng tất cả các số bên trong odds
select * from Odds where number >= ALL(select number from Odds) 
--Ta đem 1 tập hợp so sánh với chính nó ta sẽ nhận được số lớn nhất hoặc bé nhất so với chính nó
--Ta áp dụng trực tiếp việc sử dụng <= ALL hoặc >= ALL để tìm max min của một tập value nào đó
--Cách này sẽ dễ dùng hơn aggrigate function
--5. Tìm số bé nhất trong bảng intergers.
select * from Integers where number <= ALL (select number from Integers)
USE NORTHWND
--6.Nhan vien nao co nam sinh lon nhat
select * from Employees where year(BirthDate) >= ALL(select year(BirthDate) from Employees)
--7.TRong dam nhan vien o lon don nhan vien nao tre nhat 
select * from Employees where City = 'London' and YEAR(BirthDate)>= all(select YEAR(BirthDate) from Employees where City = 'London')
select * from Employees where City = 'London' order by BirthDate desc
--8.Chen them 1 nguoi moi vao cung sinh nam 1966 va nhung que o da nang
insert into Employees(LastName, FirstName, BirthDate, City)
values (N'Nguyễn', 'Bình', '1967-07-05', N'Đà Nẵng')
insert into Employees(LastName, FirstName, Birthdate, City)
values ('Le', 'Muoi', '1966-01-27 01:01:01', 'HCMC')
select * from Employees
--9.Nhan vien o lon don phu trach nhung don hang nao 
select * from Orders where EmployeeID in (select EmployeeID from Employees where City = 'London')
--10. Nhom hang hai san va bia ruu co nhung san pham nao 
select * from Products where CategoryID in (select CategoryID from Categories where CategoryName in ('Seafood','Beverages'))
select * from Categories
--11. Don hang nao co trong luong lon nhat 
select * from Orders where Freight >= ALL(select Freight from Orders)
--11.1 Trong tat ca tat don hang trong luong lon nhat la bao nhieu
select Freight from Orders where Freight >= ALL(select Freight from Orders)
--12. Trong cac don hang gui toi anh phap mi don hang nao co trong luong lon nhat
select * from Orders where ShipCountry in ('UK','USA','France') and Freight >= ALL(select Freight from Orders where ShipCountry in ('UK','USA','France'))
select * from Orders where ShipCountry in ('UK','USA','France') and Freight >= ALL(select Freight from Orders where ShipCountry in ('UK','USA','France'))
--13.Don hang co trong luong nho nhat den tu anh phap mi
select * from Orders where ShipCountry in ('UK','USA','France') and Freight <= ALL(select Freight from Orders where ShipCountry in ('UK','USA','France'))
-----------------------
--14.San pham nao gia ban cao nhat.
select * from Products where UnitPrice >= ALL(select UnitPrice from Products)
--15.Don hang chi tiet nao co thanh tien lon nhat.*
select (UnitPrice*Quantity*(1-Discount)) as [Price] from [Order Details] where  (UnitPrice*Quantity*(1-Discount)) >= ALL(select (UnitPrice*Quantity*(1-Discount)) from [Order Details])
--