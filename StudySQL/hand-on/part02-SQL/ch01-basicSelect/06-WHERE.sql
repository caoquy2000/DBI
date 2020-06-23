------------------------------
--I.Lý Thuyết
------------------------------
--Mệnh đề select chuẩn 
--Select ... from ...where...group by...having,...order by
/*
1.select * from table_X se lay tat ca cac cot va cac dong cua table_X
2.select cot, cot, cot from table_X se lay tat ca cac dong nhung chi 
hien thi mot so cot duoc liet ke tu table_X
3.select * from table_X where <điều kiện so sánh, mệnh đề so sánh>:
sẽ lấy ra các dòng(không phải tất cả)thỏa mãn điều kiện.thường điều kiện sẽ là
1 cột nào đó so sánh với value
--ví dụ:
lấy ra khách hàng có thành phố là london
select * from customers where city = 'London'

where: nó sẽ đi chung với các toán tử sau:
operator: > >= < <= = != ><
và ta cũng có thể xài thêm mệnh đề logic and ,or, not
cú pháp where: cột so sánh với value and/or cộ so sánh với value
hãy thêm ()
*/
-----------------------------------------------------------------
--II. THỰC HÀNH
---------------------------------------------------------------
 use NORTHWND
 --1. Liệt kê các nhân viên
 select * from Employees
 --2. Liệt kê các nhân viên ở London
 select * from Employees where City = 'London'
 --2.1. Liệt kê các nhân viên ở London.
 --output: ID, Name (ghép fullname), Title, Address
 select EmployeeID, LastName+' '+FirstName as FullName, Title, Address, City from Employees where City = 'London'

 --3. Liệt kê các nhân viên ở London và/hoặc Seattle (6 rows)
 select * from Employees where City = 'London' or City = 'Seattle'
 --4. Liệt kê các nhân viên ko ở London (5 rows)
 select * from Employees where City != 'London'
 
 --5. Liệt kê các nhân viên ko ở London hoặc Seattle
 --ko chọn những ai ở 2 tp này  (3 rows)
 select * from Employees where City != 'London' and City != 'Seattle'
 select * from Employees where not(City = 'London' or City = 'Seattle')
  --6. Liệt kê các nhân viên có last name: King  (1 row)
  select * from Employees where LastName = 'King'
  --7. Liệt kê các nhân viên là Nữ
 select * from Employees where TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Mrs.'
 --8. Liệt kê các nhân viên là đại diện kinh doanh (6 rows)
 select * from Employees where Title = 'Sales Representative'
 --8.1 Nhân viên nào ko là đại diện kinh doanh

  select * from Employees where Title != 'Sales Representative'
 --9. Những nhân viên nào không ở London
 select * from Employees where City != 'London'

 --10. Những nhân viên nào sinh từ 1960 trở lại đây (4 rows)
 select * from Employees where year(BirthDate) > 1960

 --11. Những nhân viên nào tuổi lớn hơn 60 (4 rows)
 select * from Employees where (year(getdate())-year(BirthDate)) > 60
  --11. Những nhân viên nào tuổi lớn hơn 60 và ở London
 --ở London có nhân viên nào tuổi lớn hơn 60 hem? (1 row)
 --mệnh đề AND, nhớ thêm ngoặc cho an toàn và dễ đọc
 select * from Employees where (year(getdate())-year(BirthDate)) > 60 and  City = 'London'

--12. Liệt kê các khách hàng đến từ Mĩ hoặc Mexico
select * from Customers 
select * from Customers where Country = 'USA' or Country = 'Mexico' 
--13. Liệt kê các các đơn hàng đc gửi tới Đức hoặc Pháp
select * from Orders where ShipCountry = 'Germany' or ShipCountry = 'France ' 
--14. Liệt kê các đơn hàng nặng từ 50.0 đến 100.0 pound (nằm trong đoạn, khoảng)
select * from Orders where Freight > 50.0 and Freight < 100.0
--ktra lại cho chắc, sắp giảm dần kết quả theo cân nặng đơn hàng 
select * from Orders where Freight > 50.0 and Freight < 100.0 Order by Freight desc
--15. Liệt các đơn hàng gửi tới Anh, Pháp Mĩ sắp xếp tăng dần theo trọng lượng (255)
select * from Orders where ShipCountry = 'UK' or ShipCountry = 'France' or ShipCountry = 'USA' order by Freight desc

--15.1. Liệt các đơn hàng KHÔNG gửi tới Anh, Pháp Mĩ,
-- sắp xếp tăng dần theo trọng lượng (575 rows)

select * from Orders where not(ShipCountry = 'UK' or ShipCountry = 'France' or ShipCountry = 'USA') order by Freight asc
--16. Liệt kê các đơn hàng trong tháng 5 đến tháng 9 của năm 1996 (70 rows)

select * from Orders where MONTH(OrderDate) >= 5 and MONTH(OrderDate) <= 9 and year(OrderDate) = 1996 
--17. Liệt kê các nhân viên sinh ra trong khoảng năm 1960-1970
select * from Employees where year(BirthDate) >= 1960 and year(BirthDate) <= 1970 

--18. Năm 1996 có những đơn hàng nào
select * from Orders where YEAR(OrderDate) = 1996

