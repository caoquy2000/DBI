--I.Ly Thuyet.
--Aggregate Function
--Hàm hết họp gom nhóm/kết hợp
--DB Engine cung cấp cho em một số hàm giúp gom nhóm dữ liệu
--từ nhiều dòng về thành 1 cell, từ 1 cột về 1 đơn vị
--hay 1 con số
--các hàm đó bao gồm:
--count()
--sum()
--avg()
--min() != max()
--I.Học hàm Count()
--cú pháp": count(*) --> đếm số dòng
use NORTHWND
select count(*) as NoOfEmployees from Employees
----không quan tâm giá trị có trong dòng
----chỉ quan tâm là , có bao nhiêu dòng là tôi đếm
----có thể dùng count(*) kết hợp với where---> thỏa điều kiện mới đếm
select count(*) as NoOfEmployeesFormLonDon from Employees where City ='London'
select * from Employees
--count(distinct cột hoặc *) --> đếm số value và mổi cái trùng lại chỉ đếm 1 lần
--count() đi chung với where
--count(cột) đếm các cell
select count(distinct Title) from Employees
select * from Employees
--gặp value là null thì bỏ ra , không đếm, dùng distinct thì gặp lại value giống trong count(cột)
-- không đếm và không tính null.
--II.Thực Hành
--1.Liệt kê danh sách các nhân viên
select * from Employees
--2.Có bao nhiêu nhân viên
select COUNT(*) from Employees
--đếm các dòng trong employees: đếm các object 
--3.Co bao nhieu ma nhan vien 
select COUNT(EmployeeID) from Employees
--đếm các cell có giá trị thì đếm, null thì thôi
--nhưng may quá , employID là primary key: nên cấm null, thì có hết giá trị, đếm đủ 11 thằng
--4.đếm xem có bao nhiêu chức danh
select count(Title) from Employees
--vì lúc này tôi đếm cell, và cell cùa title có null nên nó không đêm, hao hụt 2 số

--5. Đếm xem có bao nhiêu Region (5)
select count(Region) from Employees
-- vi khong tinh null nen chi tinh 5
select count(*) from Employees where Region is not null
--6. Đếm xem có bao nhiêu chức danh đã xuất hiện 
select count(Title) from Employees
--6.1 Đếm xem có bao nhiêu chức danh, mỗi chức danh đếm 1 lần 
--trùng thì ko đếm lại
--có bao nhiêu chức danh khác biệt nhau, ko tính lặp lại
select count(distinct Title) from Employees
--năm nay có 200k luột người ghé thăm mv mới của Son Tùng, -> count không distinct
--7. Đếm xem có bao nhiêu tp trong table NV, mỗi tp đếm
--1 lần
select count(distinct City) from Employees
--8. Đếm xem có bao nhiêu nv là đại diện kinh doanh 
select * from Employees
select count(*) from Employees where Title = 'Sales Representative'
--9. Đếm số lượt region đã xuất hiện
select count(Region) from Employees
--10. Có bao nhiêu region phân biệt, ko tính trùng
select count(distinct Region) from Employees
--11. Có bao nhiêu người chưa xd đc khu vực (6)
select count(*) from Employees where Region is null
--ở câu này mà chơi với cột chắc chắn là đếm  được 0
--mình đã lấy ra cột region toàn value null thì làm sao count(region) đếm được
--chơi với count(*)
--12. Có bao nhiêu NV đã xd được khu vực (5)
select count(*) from Employees where Region is not null
select count(Region) from Employees where Region is not null
--Choi voi * hay region o cau nay deu duoc, vi where da san loc ra cac value khac null
