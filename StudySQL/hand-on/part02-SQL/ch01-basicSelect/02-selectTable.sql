--table field 
--Student(ID,name, yob) => k co1 dong nao trong table giống nhau 100%
--Major(MID,Name)

--primary key/ khóa chính
---------------------------
--tôi muốn làm 1 database lưu thông tin sinh viên
--major(ID,name)(id,name)
--student(id,name,MID,CID)
--               SE   1
use NORTHWND
Select * From orders

--1. Liệt kê danh sách nhân viên (9 rows)
--σ (Employees) 
SELECT * FROM Employees
SELECT EmployeeID, LastName, BirthDate FROM Employees
--2. Liệt kê danh sách nhân viên, ta chỉ xem 1 vài cột thoy
--liệt kê cột cần xem ngay sau từ select
--output: id, name, birthdate
--πEmpID,LastName,FirstName,Birthdate (Employees)
--πA1,A2,…,An (R)


--3. Ghép tên thành cột FullName
--4. In ra năm sinh

--5. Tính tuổi nhân viên

--6. In ra thông tin của các nhà cung cấp (29 rows)
SELECT * FROM Suppliers
--7. In ra thông tin của các nhà vận chuyển
SELECT * FROM Shippers

--8. In ra thông tin của các đơn hàng đã bán
SELECT * FROM Orders WHERE ShippedDate is not null
SELECT * FROM [Order Details]
--9. In ra thông tin của các sản phẩm đang bán, đang 
--có trong kho
SELECT * FROM Products

--10. In ra thông tin chi tiết bán hàng (mua món nào, số
--lượng bao nhiêu) và tính tiền từng món đã mua
SELECT * FROM [Order Details]

SELECT ProductID,UnitPrice,Quantity,Discount,((UnitPrice*Quantity)*(1-Discount)) as [Gia Tien] FROM [Order Details]