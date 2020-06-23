-----------------------------------------------
--I. Lí Thuyết
-----------------------------------------------
--khi mà ta cần sắp xếp các dòng theo 1 tiêu chí nào đó
--khi đó mình sẽ dùng từ khóa Order by [cột]
--order by nó luôn nằm cuối câu query
--có 2 dạng sắp xếp: tăng dần asc(ascending), giảm dần desc(descending)
--quy tắc xắp xếp
--số: so sánh bình thường
--ngày tháng năm datetime: so sánh bình thường
--chuỗi: dài hơn không có nghĩa là lớn hơn
---chuỗi so sánh từ trái sang phải, so theo ascii
--name
--aab
--aabc
--abcd
--SQL không phân biệt hoa thường (ignore case)
--ví dụ: Ahihi < Az
--order by trên nhiều cột
--ví dụ order by name asc, yob desc
--> thứ tự sort : sort từ cột trái sang cột phải
--vd:
--name   yob
--a		2001
--a		2000
--a		1999
--b		2000
--b		1999
--khi có value trùng thì mới sort yob
/*

*/
------------------------------------------------------------
--II. THỰC HÀNH 
--------------------------------------------------------------
--1. In ra danh sách khách hàng (91 rows)
SELECT*FROM Customers

--2. In ra danh sách khách hàng sắp xếp theo Thành phố

SELECT*FROM Customers Order by City


--3. Sắp xếp khách hàng theo mã khách hàng
SELECT*FROM Customers Order by CustomerID

--4. Sắp xếp khách hàng theo khu vực - region
SELECT*FROM Customers Order by Region 

--CÂU HỎI HẮC NÃO
--SORT TRÊN NHIỀU CỘT NÓ RA KẾT QUẢ THẾ NÀO????????


