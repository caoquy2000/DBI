/*	
	1.khi ta lọc/filter/(where) các dong2 nào đó trong cùng 1 table
	và dk
	--lọc liên quan đến 1 đoạn: from...to...1999-2003
	1999,2000,2001,2002,2003, tập giá trị được liệt kê ra
	ta dùng toán between , in
	*cú pháp: where yob between 1999 and 2003
		yob >= 199 and yob <= 2003

	*cú pháp: where yob in(1999, 2001, 2005)
	yob = 1999 or yob = 2001 or yob = 2005
	*Between tương đương 2 mệnh đề so sánh kèm And
	*In tương đường với 1 đống Or
*/
------------------------------------------------------------------------
--II. THỰC HÀNH
-------------------------------------------------------------------------
--1. Liệt kê các đơn hàng gửi tới Anh Pháp Mĩ Đức (337)
select * from Orders where ShipCountry in ('UK', 'France', 'USA', 'Germany')
--ShipCountry rơi vào 1 trong những giá trị sau
--NHỚ KĨ CÂU NÀY, DÍNH ĐẾN CHƯƠNG 2 - NÓI VỀ SUB-QUERY, QUERY LỒNG
--NESTED QUERY 
--2. Liệt kê các đơn hàng KHÔNG gửi tới Anh Pháp Mĩ Đức (337)
select * from Orders where ShipCountry not in ('UK', 'France', 'USA', 'Germany')
--3. Liệt kê các đơn hàng có trọng lượng từ 50 đến 100 pound
-- filter 1 đoạn, ta xài < and >, between (173)
select * from Orders where Freight between 50 and 100
-- ko xài between, còn cách khác, dùng not 

--between là đẹp nhất


--4. Liệt kê các đơn hàng trong năm 1996 ngoại trừ các tháng 6 7 8 9 
--82 rows
select * from Orders where (YEAR(OrderDate) = 1996) and month(OrderDate) not in (6, 7, 8, 9)
