use torg_firm
--1.Рохробити процедуру для отримання назв і вартості, проданих визначним співробітником
go
CREATE PROC lab7_proc1 AS
SELECT Tovar.Nazva, tovar.Price*zakaz_tovar.Kilkist AS Vartist, sotrudnik.Fname, sotrudnik.Name 
  FROM sotrudnik INNER JOIN zakaz ON sotrudnik.id_sotrud=zakaz.id_sotrud 
  inner join zakaz_tovar on zakaz.id_zakaz=zakaz_tovar.id_zakaz  
  INNER JOIN tovar ON tovar.id_tovar=zakaz_tovar.id_tovar
WHERE sotrudnik.Name='Олена'
end

CREATE PROC lab7_proc2 AS
UPDATE tovar SET Price=Price*0.9
  WHERE id_postav=(SELECT postachalnik.id_postach 
          FROM postachalnik 
            WHERE postachalnik.Nazva='ПП "Арей"')

CREATE PROC lab7_proc3 @k VARCHAR(20)
AS
SELECT tovar.Nazva, tovar.Price*zakaz_tovar.Kilkist AS vartist, klient.Nazva 
  FROM klient INNER JOIN ((tovar INNER JOIN zakaz_tovar 
ON tovar.id_tovar=zakaz_tovar.id_tovar) inner join zakaz 
on zakaz.id_zakaz=zakaz_tovar.id_zakaz) 
ON klient.id_klient=zakaz.id_klient 
WHERE klient.Nazva=@k

exec lab7_proc3 'ТОВ "Арей"'
go
CREATE PROC lab7_proc4
@t VARCHAR(20), @p FLOAT 
AS
UPDATE tovar SET Price=Price*(1 -@p) 
WHERE NaSklade=@t
exec lab7_proc4 @t=14, @p=5 
End

go 
CREATE PROC lab7_proc5
@t VARCHAR(20)='Молоко', @p FLOAT=0.1 AS
UPDATE tovar SET Price=Price*(1 -@p)
WHERE Nazva=@t
END

go
CREATE PROC lab7_proc6 
@m INT, @s FLOAT OUTPUT 
AS
SELECT @s=Sum(tovar.Price*zakaz_tovar.Kilkist)
  FROM tovar INNER JOIN zakaz_tovar ON tovar.id_tovar=zakaz_tovar.id_tovar 
        inner join zakaz on zakaz.id_zakaz=zakaz_tovar.id_zakaz
  GROUP BY Month(zakaz.date_naznach)
  HAVING Month(zakaz.date_naznach)=@m
  declare @s FLOAT
exec lab7_proc6 2, @s OUTPUT
print @s
 END

 go
 CREATE PROC lab7_subproc7
@f VARCHAR(20) OUTPUT, @n VARCHAR(20)
 AS
SELECT @f=City FROM klient WHERE Nazva=@n

declare @f varchar(20)
exec lab7_subproc7 @f output, @n = 'ТОВ "Арей"'
Print @f
END

go
Create proc lab7_proc7
@suma float output, @n varchar(20)
as
declare @pr varchar(20)
exec lab7_subproc7 @pr output, @n
select @suma=(tovar.Price*zakaz_tovar.kilkist)
from zakaz inner join zakaz_tovar on zakaz.id_zakaz = zakaz_tovar.id_zakaz
inner join tovar on zakaz_tovar.id_tovar = tovar.id_tovar
where zakaz.id_klient IN (select id_klient from klient
where city = @pr)

declare @f varchar(20)
exec lab7_proc7 @f output, @n = 'ТОВ "Ау"'
Print @f 


go
INSERT INTO zakaz_tovar(id_zakaz, id_tovar, Kilkist, Znigka)
VALUES (3,1,25, 0.05)
END
go
CREATE TRIGGER lab7_oneRow ON zakaz_tovar FOR INSERT AS
IF @@ROWCOUNT=1 BEGIN
IF NOT EXISTS(
SELECT * FROM inserted
    WHERE inserted.Kilkist<=ALL(SELECT tovar.NaSklade 
    FROM tovar, zakaz_tovar WHERE tovar.id_tovar= zakaz_tovar.id_tovar))
BEGIN
ROLLBACK TRAN PRINT 'Нема товару'
END
END

ALTER TRIGGER trig_ins ON zakaz_tovar FOR INSERT AS
DECLARE @x INT, @y INT IF @@ROWCOUNT=1 
BEGIN
IF NOT EXISTS(SELECT * 
FROM inserted 
WHERE - inserted.Kilkist<=ALL(SELECT tovar.NaSklade
FROM tovar, zakaz_tovar 
WHERE tovar.id_tovar= zakaz_tovar. id_tovar))
BEGIN
ROLLBACK TRAN PRINT 'Нестача товару'
END
IF NOT EXISTS ( SELECT i.id_tovar, i.Kilkist, 2 FROM tovar N, inserted i 
WHERE N. id_tovar =i.id_tovar)
print 'Товар не продається'
ELSE BEGIN
SELECT @y=i.id_tovar, @x=i.Kilkist 
FROM zakaz_tovar N, inserted i 
WHERE N.id_tovar=i.id_tovar 
UPDATE tovar SET NaSklade=NaSklade-@x WHERE id_tovar=@y
print 'Ok'
END
END

go
CREATE TRIGGER lab7_del ON zakaz_tovar FOR DELETE 
AS
IF @@ROWCOUNT=1 
BEGIN DECLARE @y INT,@x INT 
SELECT @y=id_tovar, @x=Kilkist FROM deleted 
UPDATE tovar SET NaSklade=NaSklade+@x WHERE id_tovar=@y
END