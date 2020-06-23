/*MutipleValues
-------------------------------------------------------
--I. Lý Thuyết
-------------------------------------------------------
Mệnh đề select chuẩn 
select.. .from ...where... group by.... having ....order by
 xét riêng về where
 where cột so với Single Value
 Where cột so với (select trả về Single Value)
 Where cột in(tập các giá trị cách nhau bởi dấu ,)
 where ShipCity in ('uk', 'usa','france')
 ta thay in bằng or
 where cột in (select trả về 1 cột, nhiều dòng)
*/
-------------------------------------------------------
--II. THỰC HÀNH
-------------------------------------------------------
--1.liệt kê các sản phẩm thuộc nhóm 1,6 ,8
use NORTHWND
select * from Products where CategoryID in (1, 6, 8)
select * from Products where CategoryID = 1 or CategoryID = 6 or CategoryID = 8
--2.Liệt kê các sản phẩn thuộc nhóm hàng Bia/Rượu, Hải Sản ,Thịt
select * from Products where CategoryID in (select CategoryID from Categories where CategoryName in ('Beverages', 'Seafood', 'Meat/Poultry'))
select * from Categories
--3.đơn hàng nào bán cho khách hàng đến từ Anh Phí Mĩ
select * 
from Orders 
where CustomerID in (select CustomerID 
						from Customers 
						where Country in ('UK','USA','France')
					)
select * from Customers
--4..đơn hàng nào bán cho khách hàng không đến từ Anh Pháo Mỹ
select * 
from Orders 
where CustomerID in (select CustomerID
						from Customers
						where Country not in ('UK', 'USA', 'France')
					)
--5.Nhân viên có ID =7  phụ trách những đơn hàng nào
select * from Employees
select * from Orders where EmployeeID in (select EmployeeID from Employees where EmployeeID = 7)
select * from Orders where EmployeeID = 7
--6.Nhân Viên quê ở London phụ trách nhửng đơn hàng nào
select * from Employees
select * from Orders where EmployeeID in (select EmployeeID from Employees where City = 'London')
select * from Orders where EmployeeID in (select EmployeeID from Employees where City = 'London')
--7.Các nhà cung cấp đến từ Mĩ cung cấp nhóm hàng nào
select * from Suppliers where Country = 'USA'
select * from Categories
select CategoryID from Products where SupplierID in (select SupplierID from Suppliers where Country = 'USA') 
select * 
from Categories 
where CategoryID in (
						select CategoryID 
							from Products 
								where SupplierID in (
														select SupplierID from Suppliers where Country = 'USA'
														)
					)
--8.Đơn hàng tới sao paulo được vận chuyển bởi công ty nào.
select * from Shippers
select * from Orders where ShipCity = 'Sao Paulo'
select * from Shippers where ShipperID in (select ShipVia from Orders where ShipCity = 'Sao Paulo')
--9.Nhà cung cấp đến từ Mỹ , cung cấp những sản phẩm nào
select * from Suppliers 
select * from Products
select * from Products where SupplierID in (select SupplierID from Suppliers where Country = 'USA')
--10.Speedy Express vận chuyển những đơn hàng nào
select * from Shippers
select * from Orders where ShipVia in (select ShipperID from Shippers where CompanyName = 'Speedy Express')
--11.Nhân viên Anne chăm sóc những đơn hàng nào
select * from Orders where EmployeeID in (select EmployeeID from Employees where FirstName = 'Anne')
select * from Employees
--12.Những khách hàng nào có đơn hàng gữi tới Mĩ
select * from Customers where CustomerID in (select CustomerID from Orders where ShipCountry = 'USA')
