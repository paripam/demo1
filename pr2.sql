/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/

create proc task2 
@n1 nchar(10), @h real, @n2 nvarchar(max) 
as  
begin
  insert into country(id_countru, name)
  values( (select max(country.id_countru) from country)+1, @n2)
  insert into peak(id_peak, name, height, coordinates, id_country)
  values((select max(peak.id_peak) from peak)+1, @n1, @h, 'неизвестно', (select max(country.id_countru) from country))
 
end