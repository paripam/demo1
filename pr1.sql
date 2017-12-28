
CREATE PROC task1
  @d1 date, @d2 date  as
select g.name, t.name, t.data from 
(select * from (select c.id_group ,p.name, c.data from  dbo.peak as p
left join dbo.climb as c
on p.id_peak=c.id_peak
where c.data>=@d1 and c.data <@d2) as t1
where data=(select max(data)
from 
(select  p.name, c.data from  dbo.peak as p
left join dbo.climb as c
on p.id_peak=c.id_peak
where c.data>=@d1 and c.data <@d2) as t2
where name=t1.name))as t join [group] as g
on g.id_group=t.id_group
order by t.data;

