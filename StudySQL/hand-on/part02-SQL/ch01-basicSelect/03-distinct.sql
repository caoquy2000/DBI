--lý thuyết
--Một table thường sẽ có nhiều cột hoặc một cột 
--Mà value của nó không trùng lại trên toàn bộ table primary key

--Value đó được trả về từ câu select
--select * from luôn trả về các dòng khác nhau
--select name from student thì lúc này học sinh sẽ trùng tên nhau
--Xài keyWord Distinct để loại bỏ những dòng trùng 
--dòng nào mà trùng thì lấy 1 value
--Distinct nằm sát ngay sau select
--select distinct 
---------------------------------------------------
--II. THỰC HÀNH
--------------------------------------------------- 
--1. In ra danh sách nhân viên, toàn bộ info luôn 
 SELECT * FROM Employees
--2. In ra tỉnh/tp của các nhân viên
SELECT DISTINCT City FROM Employees

--3. Liệt kê các quốc gia mà đơn hàng đc gửi tới
SELECT distinct ShipCountry FROM  Orders 
use NORTHWND
select * from Employees
select distinct Region from Employees