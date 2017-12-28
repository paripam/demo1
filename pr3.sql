create procedure task3
@n nchar(10), @h real, @c text
as
begin
update db_climbers.dbo.peak
set db_climbers.dbo.peak.name = @n,
db_climbers.dbo.peak.height=@h,
db_climbers.dbo.peak.coordinates=@c
where db_climbers.dbo.peak.id_peak in
(select t2.id_peak from db_climbers.dbo.peak as t1
left join
db_climbers.dbo.climb as t2
on
t1.id_peak=t2.id_peak
where t2.id_peak is NULL);
end