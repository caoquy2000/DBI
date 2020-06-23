use NORTHWND
--I.Lý Thuyết
/*Du lieu trong thuc te co doi khi co tinh trang
la khong xac dinh duoc.
VD: Khi ma ta di thi cuoi ki, giam thi phat giay bao danh
tren giay bao danh co diem thi, thi diem thi la NULL. Biet kieu 
du lieu nhung khong biet chinh xac VALUE, chua co VALUE, Undefine
trang thai NULL (Bat dinh, Vo dinh)
-NULL khong la 1 VALUE cu the nao het vi no la NULL nen no khong
the su dung chung voi toan tu duoc ( <, >, <=, >=, ><, ..)
-Ta phai su dung is NULL, is not NULL, not (is NULL)
 */
 -------------------------------------------------------
--II. THỰC HÀNH
-------------------------------------------------------
--1. Xài db Northwnd
use NORTHWND
--2. Liệt kê danh sách nhân viên
select * from Employees
--3. Liệt kê danh sách nhân viên chưa xác định đc khu vực/vùng cư ngụ/ở
select * from Employees where Region is NULL

--4. Liệt kê danh sách nhân viên đã xác định đc khu vực cư ngụ --5 rows 

select * from Employees where Region is not NULL
--5. Liệt kê danh sách nhân viên đã xđ đc khu vực cư ngụ và có chức danh là
--đại diện kinh doanh (3 rows)
select * from Employees where Region is not NULL and Title = 'Sales Representative'


--6. Liệt kê danh sách khách hàng

select * from Customers
--7. Liệt kê danh sách khách hàng có số FAX  --69 
select * from Customers where Fax is not null

--8. Liệt kê khách hàng vừa có Fax vừa có Region (20 rows)
--vừa có này, vừa có kia, đồng thời cả 2
select * from Customers where Fax is not null and Region is not null

--9. Liệt kê khách hàng ở Đức, Mĩ, Pháp, vừa có Fax vừa có Region
--9 rows
select * from Customers where Country in ('Germany','USA','France') and Region is not null
--10. Khách hàng nào ở Anh quốc mà chưa xác định được khu vực --6 rows
select * from Customers where Country = 'UK' and Region is null
