/*
CREATE TRIGGER tên_trigger ON tên_bảng
FOR {DELETE, INSERT, UPDATE}
AS 
  câu_lệnh_sql

*/
DROP DATABASE QLNHATRO_SE140885
create database DBK15_Trigger
USE DBK15_Trigger

create table KhoHang(
	id int identity ,
	MaHang int primary key not null,
	TenHang nvarchar(30)not null,
	SoLuongTon int null,
) 

create table DatHang(
	id int identity primary key,
	MaHang int  not null,
	SoLuongDat int null,
) 

alter table DatHang
 add constraint FK_DatHang Foreign key (MaHang) references KhoHang(MaHang)

 insert into KhoHang values ('1','Sting','10')
select * from KhoHang

create trigger trg_dathang on DatHang after insert as
begin
	update KhoHang
	set SoLuongTon = SoLuongTon -(select SoLuongDat from inserted where MaHang = Khohang.MaHang)
	from KhoHang
	join inserted on KhoHang.MaHang = inserted.MaHang

end

insert into DatHang values(1,5)


create trigger trg_huydathang on DatHang after delete as
begin
	update KhoHang
	set SoLuongTon = SoLuongTon +(select SoLuongDat from deleted where MaHang = Khohang.MaHang)
	from KhoHang
	join deleted on KhoHang.MaHang = deleted.MaHang

end

delete	 from DatHang where id = 1
select * from KhoHang

create trigger trg_CapNhatDatHang on DatHang after update as
begin
	update KhoHang
	set SoLuongTon = SoLuongTon  - (select SoLuongDat from deleted where MaHang = Khohang.MaHang) + (select SoLuongDat from inserted where MaHang = KhoHang.MaHang)
	from KhoHang
	join deleted on KhoHang.MaHang = deleted.MaHang

end

insert into DatHang values(1,7)
select * from DatHang
select * from KhoHang
update DatHang set SoLuongDat = 4 where id= 1