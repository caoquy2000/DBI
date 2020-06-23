/* 
Khi ta đi siêu thị mua đồ sẽ xuất ra cho ta một hóa đơn,
và hóa đơn sẽ kèm cho ta 1 cái ID của ta firstname, lastname, DOB, sex ,numberofInhabitants, phone, Email, typeOfCustomer.
Tạo datable kèm ràng buộc PK và cấm trùng
Customers.
*/
use NORTHWND

use DBK15_Part03_OneTable
create table Customers
(
	ID char(8) not null,
	FirstName nvarchar(40) not null,
	LastName varchar(30)not null,
	DOB date null,
	Sex char(1) null,
	NumberOfInhabitants char(10) null,
	Phone char(11) not null,
	Email char(30) not null,
	TypeOfCustomer nvarchar(20) not null
)
--major year Sid
--SE 14 0885
--hashFunction
alter table Customers
	add constraint PK_Customers primary key(ID)
--alter table Customers
--	add constraint UQ_FirstName_Customers Unique(FirstName)
alter table Customers
	add constraint UQ_Phone_Customers Unique(Phone)
alter table Customers
	add constraint UQ_Email_Customers Unique(Email)
--alter table Customers
--	add constraint UQ_NumberOfInhabitants_Customers unique(NumberOfInhabitants)
