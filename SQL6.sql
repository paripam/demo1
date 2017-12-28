use db_climbers
select tab111.FIO, p.name, tab111.count_cl from
(select cl1.id_climber,cl1.FIO, altab.count_cl, altab.id_peak from db_climbers.dbo.climber as cl1
inner join
(select tabl.id_climber, count(tabl.name) as count_cl, tabl.id_peak from
(select tabl1.id_climber,tabl1.FIO, tabl2.name, tabl2.id_peak from 
(select tab1.id_climber,tab1.FIO, tab2.id_group from (select cl.id_climber, cl.FIO, j.id_journal from climber cl, journal j 
where cl.id_climber=j.id_climber) as tab1
 join
(select g.id_group, j.id_journal from [group] as g, journal j 
where j.id_group=g.id_group) as tab2
on tab1.id_journal=tab2.id_journal) as tabl1
inner join
(select c.id_group, p.name, p.id_peak from climb as c, peak as p
where c.id_peak=p.id_peak) as tabl2 
on tabl1.id_group=tabl2.id_group) as tabl
group BY tabl.id_climber, tabl.id_peak) as altab
on
cl1.id_climber=altab.id_climber) as tab111
inner join
peak as p
on
tab111.id_peak=p.id_peak
order by count_cl desc
