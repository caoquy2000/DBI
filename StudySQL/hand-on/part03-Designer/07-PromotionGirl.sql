create database DBK15_promotionGirl
use DBK15_promotionGirl
create table PromotionGirl
(
	ID char(8) not null primary key,
	Name nvarchar(30) not null,
	Phone char(10),
	LID char(8) not null
)
alter table PromotionGirl
	add constraint FP_PromotionGirl foreign key (LID) references PromotionGirl(ID)

insert into PromotionGirl values('G50',N'Hoa',null,'G50')
insert into PromotionGirl values('G51',N'Lê',null,'G51')
insert into PromotionGirl values('G52',N'Tuyết Tuyết',null,'G52')
insert into PromotionGirl values('G1',N'Lan',null,'G50')
insert into PromotionGirl values('G2',N'Hồng',null,'G50')
insert into PromotionGirl values('G3',N'Huệ',null,'G50')
insert into PromotionGirl values('G4',N'Lài',null,'G50')
insert into PromotionGirl values('G10',N'Mơ',null,'G51')
insert into PromotionGirl values('G11',N'Mận',null,'G51')
insert into PromotionGirl values('G12',N'Đào',null,'G51')
insert into PromotionGirl values('G13',N'Cam',null,'G51')
insert into PromotionGirl values('G20',N'Hường',null,'G52')
insert into PromotionGirl values('G21',N'Xuân',null,'G52')
insert into PromotionGirl values('G22',N'Tím',null,'G52')
insert into PromotionGirl values('G23',N'Hồng Hồng',null,'G52')
--Dem xem moi leader quan li bao nhieu nhan vien 
select * from PromotionGirl

select LID, count(ID)
from PromotionGirl 
where ID != LID
group by LID

select D.LeadID,D.LName, count(p.ID)
from PromotionGirl P right join (select LID as LeadID ,name as LName
								from PromotionGirl 
								where ID = LID) as D
	 on P.LID = D.LeadID
where p.LID != p.ID
group by D.LeadID,D.LName


--Huong chiu su quan li cua ai vay?
select * from PromotionGirl

select LID
from PromotionGirl
where Name = N'Hường'

select * 
from PromotionGirl 
where ID = (select LID
from PromotionGirl
where Name = N'Hường')

--Hoa lead nhung ai ?

select ID 
from PromotionGirl 
where Name = N'Hoa'

select * 
from PromotionGirl
where LID = (select ID 
from PromotionGirl 
where Name = N'Hoa') and Name != N'Hoa'

