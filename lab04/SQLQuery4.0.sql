---CREATE VIEW Qresult1 AS
select Sum(tovar.NaSklade) as Total
from tovar;

--select * from Qresult1
--select * from tovar

---CREATE VIEW Qresult2 AS
select Count(sotrudnik.id_sotrud) as Count_Sotrud
from sotrudnik;

--select * from Qresult2
--select * from sotrudnik

---CREATE VIEW Qresult3 AS
select Count(postachalnik.id_postach) as Count_Podstach
from postachalnik;

--select * from Qresult3
--select * from postachalnik

---CREATE VIEW Qresult4 AS
select sum(zakaz_tovar.Kilkist) as Amount, tovar.id_tovar
from tovar inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
inner join zakaz on zakaz_tovar.id_tovar = zakaz.id_zakaz
where zakaz.date_naznach>dateadd(MONTH, -12, getdate())
group by tovar.id_tovar

--select * from Qresult4
--select * from tovar
--select * from zakaz_tovar

---CREATE VIEW Qresult5 AS
select Sum(tovar.Price) as Total_Sum 
from tovar inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
inner join zakaz on zakaz_tovar.id_zakaz = zakaz.id_zakaz
where zakaz.date_naznach>dateadd(MONTH, -12, getdate())

--select * from Qresult5
--select * from zakaz
--select * from 

---CREATE VIEW Qresult6 AS
SELECT postachalnik.Nazva, SUM(zakaz_tovar.Kilkist * tovar.Price) AS Total_Sum
FROM tovar
INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach
INNER JOIN zakaz_tovar ON tovar.id_tovar = zakaz_tovar.id_tovar
INNER JOIN zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz
GROUP BY postachalnik.Nazva

--select * from Qresult6

---CREATE VIEW Qresult7 AS
select Sum(tovar.Price) as Total_Orders 
from tovar inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
where tovar.Nazva = 'Молоко'

--select * from 

---CREATE VIEW Qresult8 AS
select Avg(tovar.Price*zakaz_tovar.Kilkist) as Vsogo, tovar.Nazva 
from tovar inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
group by tovar.Nazva

--select * from Qresult8
--select * from zakaz_tovar
--select * from tovar

---CREATE VIEW Qresult9 AS
select Sum(tovar.Price*zakaz_tovar.Kilkist) as Vsogo
from tovar inner join zakaz_tovar on tovar.id_tovar = zakaz_tovar.id_tovar
inner join zakaz on zakaz_tovar.id_zakaz= zakaz.id_zakaz
inner join klient on zakaz.id_klient= klient.id_klient
where klient.City = 'Житомир'

--select * from Qresult9
--select * from zakaz_tovar
--select * from tovar
--select * from zakaz
--select * from klient

---CREATE VIEW Qresult10 AS
select Avg(tovar.Price) as AvgSum, postachalnik.id_postach
from tovar inner join postachalnik on tovar.id_postav = postachalnik.id_postach
group by postachalnik.id_postach

--select * from Qresult10
--select * from tovar
