create procedure task4
@d1 date, @d2 date
as
begin
select cl.FIO, g.name, c.data  from db_climbers.dbo.climber as cl,
db_climbers.dbo.journal as j, db_climbers.dbo.[group] as g, db_climbers.dbo.climb as c,
db_climbers.dbo.peak as p
where 
cl.id_climber=j.id_climber
 and j.id_group=g.id_group 
 and c.id_peak=p.id_peak
 and c.data  between @d1 and @d2
 end