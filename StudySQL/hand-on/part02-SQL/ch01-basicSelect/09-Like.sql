--I. Ly Thuyet
/*
Khi can loc filter/search nhung dong nao do chung ta sai where
Vi du tim nhung sinh vien que o Dong Nai, Ta se hieu nhu sau:
Loi tung ban sinh vien ra, hoi que cua ban o dau, neu dung la 
Dong Nai thi dua vao danh sach ket qua tuong duong cau lenh
SELECT * FROM Student WHERE Que = N'Dong Nai'
= ,<,>,,.. dung de so sanh chinh xac voi mot value nao do Dong Nai thi 
duoc, Dong Thap thi khong.
Nhung liet ke nhung ban den tu que co chu Dong trong ten

Chi can dung 1 phan la duoc roi, ta goi do la so sanh gan dung
DBengine cung cap toan tu giup ta so khop, so sanh gan dung, , do la
toan tu LIKE (duong nhu, giong nhu, co chua, khop voi, phu hop)
toan tu LIKE thuong xuyen di kem voi %_
% dai dien cho mot nhom ki tu bat ki, khong quan tam nhom do co bao nhieu ki tu
_ dai dien cho mot ki tu bat ki khong quan tam cu the ki tu do la gi
VIDU:
Tim nhung nguoi que co chua tu Dong
WHERE Que = 'Dong' => tìm những bạn quê tên đòng=> sai
sure 64 tĩnh vn k có thằng nào tên Đồng
Where que like '%Đồng%
VIDU: 
Tim nhung ban co ten la Phuong trong
where name like '%Phuong'
Tim xem nguoi nao do ten gom 3 ki tu
where name line '% ___'
LU Y QUAN TRONG
Khi choi voi SQL SEVER thi phai co chu N dung truoc chuoi
*/
------------------------------------------------------------------------
--II. THỰC HÀNH
------------------------------------------------------------------------
--1. Dùng NorthWnd
use NORTHWND
--2. In ra danh sách nhân viên
select * from Employees
select * from Employees
--3. In ra nhân viên có tên là Robert (tìm chính xác)  - 1 row
select * from Employees where FirstName like N'%Robert'
select * from Employees where FirstName like N'%Robert'
--4. In ra những nhân viên có tên là A (0 row) vì tìm chính xác 
select * from Employees where FirstName like N'A'

--5. In ra những nhân viên mà tên có chữ A đứng đầu (2 người, Andrew, Anne)
select * from Employees where FirstName like N'A%'
select * from Employees where FirstName like N'A%'
--6. In ra những nhân viên mà tên có chữ A đứng cuối cùng
select * from Employees where FirstName like N'%A'

--7. In ra những nhân viên mà tên có chữ A (ko quan tâm chữ A đứng ở đâu trong tên)
select * from Employees where FirstName like N'%A%'
--8. Những nhân viên nào có tên gồm đúng 3 kí tự --0ROW, VÌ TOÀN LÀ 4 KÍ TỰ TRỞ LÊN 
select * from Employees where FirstName like N'___'
--9. Những nhân viên nào mà tên có 4 kí tự, kí tự cuối cùng là A
select * from Employees where FirstName like N'___A'
--10. Những nhân viên nào mà tên có 5 kí tự, và có chứa chữ A (A ở đâu cũng đc) --3rows
select * from Employees where FirstName like N'_____'and FirstName like N'%A%'
--11. Tìm các khách hàng mà mã số có chứa chữ I đứng thứ 2 kể từ bên trái sang
select * from Customers where CustomerID like N'_I%'
--12. Tìm các sản phẩm mà tên sản phẩm có 5 kí tự 
select * from Products where ProductName like N'_____'
--13. Tìm các sản phẩm mà từ cuối cùng trong tên sản phẩm có 5 kí tự 
select * from Products where ProductName like N'_____' or ProductName like '% _____'
