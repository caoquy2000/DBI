--Với các hàm gom nhóm count(), sum(), avg().
--min(),max() ta có 2 kỷ thuật gom
--KT1. Gom trên các dòng xuất hiện(các dòng được lọc theo where)
--KT1 này luôn trả ra cho ta 1 số , 1 value
--KT2:chia nhóm ra theo tiêu chí nào đó, rồi mới gom nhó
--như vại: kết quả sẽ trả về nhiều con số , tương ứng với mỗi nhóm được chia ra
--group by gom nhóm theo 1 tiêu chí(value nào đó)
--Ví dụ phân biệt KT1 và KT2
--vd1: đếm xem trong phòng học db có bao nhiêu sinh viên	kt1
--vd2:đếm xem có bao nhieu bạn đến từ sài gòn trong phòng học này kt1
--vd3:đếm xem mỗi tĩnh thành có bao nhiêu bạn DB theo học lớp này kt2
--mỗi tĩnh thành có bao nhiêu bạn sinh viên
--cứ trùng city thì cột city đó sẽ ++;
--sang city mới thì count đếm lại từ đầu
--rất nhiều kết quả trả về tùy theo có bao nhiêu nhóm phân biết
--vd4:đếm số vs trong phòng theo năm nhập học
--II.Thực hành
use	NORTHWND
--Liệt kê danh sách nhân viên
Select * from Employees

--1. Đếm xem mỗi City có bao nhiêu nhân viên 
select City , count(*) from Employees group by City
--Neu trong menh de select co xuat hien cot nao ma khong nam trong ham aggrerate thi cot do 
--phai xuat hien trong menh de group by
--dieu nay giup bo nghia cho ket qua duoc ro rang va la chi dau / dau hieu de biet duong
--ma gom nhom
--
--2. Đếm xem mỗi khu vực có bao nhiêu nhân viên
--mỗi khu vực: chia nhóm theo khu vực 
--TỪ MỖI -> GOM NHÓM 
select iif(Region is NULL,'Chua Xac Dinh', region) as Region ,count(*) from Employees group by Region
--3. Mỗi nhóm chức danh có bao nhiêu nhân viên
--mỗi chức danh: chia nhóm chức danh mà đếm
select * from Employees
select Title, count(*) from Employees group by Title
--count cot trong group by se tinh luon value NULL nhung khong dem
--nhung count(*) trong group by cung tinh luon value NULL cung dem luon
-- bao toan data ta dung count(*)
--4. Liệt kê danh sách các quốc gia xuất hiện trong đơn hàng
select ShipCountry from Orders group by ShipCountry
--khi ma group by ko sai ham aggrerate thi no se tra ra cot group by
--va khong trung
--5. Mỗi quốc gia có bao nhiêu đơn hàng
select ShipCountry, count(*) as Tong from Orders group by ShipCountry
select ShipCountry from Orders
--6. Nước Mĩ có bao nhiêu đơn hàng
select ShipCountry, count(*) from Orders where ShipCountry = 'USA' group by ShipCountry
select ShipCountry, COUNT(*) from Orders group by ShipCountry having ShipCountry = 'USA'
-- having rat giong where nhung sau khi da group by roi moi duoc su dung having va
--pham vi su dung cua having nam trong group by.

--7. Anh, Pháp, Mĩ có tổng cộng bao nhiêu đơn hàng
select count(*) as DonHang from Orders group by ShipCountry having ShipCountry in ('USA','France','UK')
select sum(apm.DonHang) from (select count(*) as DonHang from Orders group by ShipCountry having ShipCountry in ('USA','France','UK')) as apm
--8. Đếm số đơn hàng của mỗi quốc gia --21 rows
select ShipCountry,  count(*) from Orders group by ShipCountry 
--9. Đếm số đơn hàng của nước Mĩ
select ShipCountry,COUNT(*) from Orders group by ShipCountry having ShipCountry = 'USA'
--10. Quốc gia nào có hơn 100 đơn hàng
select ShipCountry ,count(*) from Orders group by ShipCountry  having count(*) > 100
--having khong choi voi ten, chi choi voi aggregate.
--11. Quốc gia nào có số lượng đơn hàng nhiều nhất?????
select count(*) as DonHang from Orders group by ShipCountry
select ShipCountry, MAX(atm.DonHang) from (select ShipCountry,count(*) as DonHang from Orders group by ShipCountry) as atm

select ShipCountry from Orders group by ShipCountry having count(*) = (Select max(sh.dh) from (Select count(*) as dh from Orders group by ShipCountry) as sh)

select ShipCountry, count(*) from Orders group by ShipCountry having count(*) >= all(select count(*) from Orders group by ShipCountry)
--Dem so don hang cua moi quoc gia, count(*) moi quoc gia => group by
--Dem xong co qua troi quoc gia kem so luong don hang, ta can so lon nhat
--Ta having cot so luong vua dem bang voi cau select max
--Hoac ta >= ALL chinh no, dung quen minh dang so sanh cai gi thi select cai do thoi
--12.Moi cong ty da van chuyen bao nhieu don hang
select * from Shippers
select * from Orders
select ShipVia,count(*) from Orders group by ShipVia

--13. Mỗi khách hàng đã mua bao nhiêu lần (đếm số đơn hàng)
--output 1: mã kh, số lần mua
select CustomerID,count(*) from Orders group by CustomerID
--output 2: mã kh, tên kh, số lần mua 
select CustomerID  ,count(*) from Orders group by CustomerID
--14. Mỗi nhân viên phụ trách bao nhiêu đơn hàng
--output 1: mã nv, số đơn hàng
select EmployeeID, count(*) from Orders group by EmployeeID
--output 2: mã nv, tên nv, số đơn hàng 
