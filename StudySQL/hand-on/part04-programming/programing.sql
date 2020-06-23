--DBEngine là môi trường /tool/app nhận lệnh SQL nói chung 
--Kiểm tra xem có sai cú pháp hay không, nếu mà sai thì báo lỗi.
--Dịch lệnh này chạy luôn lệnh này-> môi trường chạy lệnh Run time, enviroment
--JavaC.exe/compile hay jvm của java.exe
--Ngôn ngữ c (mingw) or (cjgwin), (gcc), (mscompile)
--Runtime chính là OS
--Lập trình bằng ngôn ngữ lập trình nào đó đều có đầy đủ các bối cảnh môi trường,
--Hiểu được vấn đề này nên DB cũng cung cấp những cú pháp lập trình.
--Ta có thể khai báo biến, if else, do...while, các đoạn code này được xếp vào trong hàm / function
--Tuy nhiên vì sài data của table nên ta không hỗ trợ không cần lệnh scanf()
--Mục tiêu của lập trình trong DBEngine là khai thác, tính toán dữ liệu có sẵn trong DB
--Nên nó sẽ không có đủ các lệnh như bên trong ngôn ngữ lập trình bình thường.
--Khai báo biến để đưa infor vào đó, infor có thể cự gán hoặc lấy từ DB.

--declare @yob1 INT = 1
--declare @yob2 int

--set @yob2 = 2001
--select @yob1 as KL

create procedure getMember1(@LeadID char(4))
as
if @LeadID = 'null'
	begin
		print 'PLZ input again'
	end;

exec dbo.getMember1 'null'
go

create procedure storedNguoiDung(@ID char(4), )
as
	if @ID = 'null'
	begin
		print 'ban nhai sai roi'
	end;
	else
	begin
		insert into values(@ID)

exec dbo.getMember1 'null'