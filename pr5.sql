create procedure task5
@n nvarchar(max), @fio text, @d date, @a text, @id int 
as
begin
insert into db_climbers.dbo.climber(id_climber,FIO,data, address, id_rank)
values((select max(c.id_climber)
 from db_climbers.dbo.climber as c)+1, @fio, @d, @a, @id  ) 
insert into db_climbers.dbo.journal(id_journal, id_group, id_climber)
values((select max(db_climbers.dbo.journal.id_journal) from 
db_climbers.dbo.journal)+1, (select g.id_group from db_climbers.dbo.[group] g where g.name=@n),
(select cl.id_climber from db_climbers.dbo.climber as cl where cl.id_climber=(select max(c.id_climber)
 from db_climbers.dbo.climber as c)))
end