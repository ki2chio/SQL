--1)
Select zakaz.id_zakaz, zakaz.date_rozm, tovar.Nazva
From zakaz 
inner join zakaz_tovar on zakaz.id_zakaz = zakaz_tovar.id_zakaz inner join tovar on tovar.id_tovar = zakaz_tovar.id_tovar
Where tovar.Nazva = 'Молоко' and zakaz.date_rozm<CAST(N'2017-07-06T07:11:51.293' AS DateTime);

--2)
SELECT tovar.*
FROM tovar
WHERE tovar.NaSklade>=15 And tovar.Price Between 15.00 And 30.00;

--3)
SELECT zakaz.*
FROM zakaz
WHERE zakaz.date_rozm is NULL

--4)
Select tovar.*, postachalnik.Nazva
From tovar inner join postachalnik on tovar.id_postav = postachalnik.id_postach
where postachalnik.Nazva = 'ТОВ "Арей"';

--5)
Select SUM(tovar.Price)as summa
From tovar
inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
inner join zakaz on zakaz_tovar.id_zakaz = zakaz.id_zakaz
inner join postachalnik on tovar.id_postav = postachalnik.id_postach
Where postachalnik.Nazva like '%ТОВ%' AND zakaz.date_rozm > dateadd(day, -30, getdate())

--6)
Select sotrudnik.id_sotrud, sotrudnik.Fname, zakaz.date_rozm, zakaz.id_klient, klient.Nazva
From sotrudnik inner join zakaz on sotrudnik.id_sotrud = zakaz.id_sotrud inner join klient on zakaz.id_klient = klient.id_klient
Where klient.Nazva='ТОВ "Арей"';

--7)
select postachalnik.Nazva 
from postachalnik
FULL OUTER JOIN tovar ON tovar.id_postav = postachalnik.id_postach
where postachalnik.Nazva like 'ЗАТ%' and not exists(select tovar.id_postav from tovar where tovar.id_postav = postachalnik.id_postach)

--8)
SELECT *
FROM klient
JOIN zakaz ON klient.id_klient = zakaz.id_klient
WHERE zakaz.date_rozm > dateadd(MONTH, -1, getdate()) AND klient.Nazva like 'ПП%'

--9)
Select sotrudnik.*
From sotrudnik
Where sotrudnik.Name = 'Олексій'
Order by sotrudnik.Fname, sotrudnik.Lname;

--10)
Select klient.*
From klient
Where klient.Tel is not Null
Order by klient.id_klient;