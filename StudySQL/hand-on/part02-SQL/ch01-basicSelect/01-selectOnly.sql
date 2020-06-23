use NORTHWND

--ghi chú

--in ra tên của mình
Select N'Điệp' as Name
Select N'Hoàng' + ' ' + N'Quy' as [Full Name]
select N'Hoàng' + ' ' + N'Quy' as [Full Name]
select N'Quy' as Name
--lấy thời gian hiện hành getdate()
select year(getdate())
SELECT * FROM Employees
--as: kỷ thuật đặt tên alias
SELECT EmployeeID,FirstName + ' ' + LastName as [Full name] FROM Employees
--lấy ra năm sinh của nhân viên
--output: id ,lastname, firstName,năm sinh
--year(),month(),day()fff
SELECT EmployeeID,LastName,FirstName, year(BirthDate) FROM Employees
--in ra tuổi của các nhân viên
SELECT EmployeeID,LastName,FirstName,year(getdate()) - year(BirthDate) as Old
FROM Employees 
--hardCore->softCode
select EmployeeID,LastName, FirstName, year(getdate()) - year(BirthDate) as Old from Employees