use db_climbers

select g.name, c.data from db_climbers.dbo.[group] g, [climb] c
where  c.id_group=g.id_group and c.data between '10.05.1993' and '11.05.1993'

select t1.name, t4.FIO from (select g.id_group, g.name, c.data from db_climbers.dbo.[group] g, [climb] c
where  c.id_group=g.id_group and c.data  between '10.05.1993' and '11.05.1993') as t1
inner join
(select t3.FIO, t2.id_group from (select j.id_climber, j.id_journal, g.id_group from [group] g, [journal] j
where g.id_group=j.id_group)as t2
inner join
(select j.id_journal, cl.FIO from climber cl, journal j where cl.id_climber=j.id_climber) as t3
on t2.id_journal=t3.id_journal) as t4
on t1.id_group=t4.id_group