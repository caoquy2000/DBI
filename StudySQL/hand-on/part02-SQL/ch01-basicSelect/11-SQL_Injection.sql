create database DBK15_BasicSelect_SQLInjection
USE DBK15_BasicSelect_SQLInjection

create table InfoUse(
	id nvarchar(30) primary key,
	pwd nvarchar(50) not null,
)

insert into InfoUse values (N'User1', N'pwd1')
insert into InfoUse values (N'User2', N'pwd2')
insert into InfoUse values (N'User3', N'pwd3')
insert into InfoUse values (N'User4', N'pwd4')
insert into InfoUse values (N'User5', N'pwd5')


select * from InfoUse

select * from InfoUse
where id='123123'
and   pwd=''or 1 = 1--' limit 1
