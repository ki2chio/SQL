use reiting;

--1--���������� ���������� ���� �������� �� ����� � ��� ���������� ��������
create proc AverageMark1
as 
begin
	SELECT AVG(Reiting.Reiting) as Average 
	FROM Rozklad_pids JOIN Reiting on
	Reiting.K_zapis = Rozklad_pids.K_zapis
	Where Rozklad_pids.Date between '2017-01-06' and '2018-01-06'
end

exec AverageMark1

--2--���������� ���������� ���� �������� �� ����� � � ���������� ��������.
create proc AverageMark2
as 
begin
	SELECT AVG(Reiting.Reiting) as Average 
	FROM Rozklad_pids JOIN Reiting on
	Reiting.K_zapis = Rozklad_pids.K_zapis
	Where Rozklad_pids.Zdacha_type != 0 and
	Rozklad_pids.Date between '2017-01-06' and '2018-01-06'
end

execute AverageMark2

--3--���������� ��������, �� ���������� �� 4 �� 5.
create proc Students
as
begin
SELECT * FROM dbo_student
JOIN Reiting on Reiting.Kod_student = dbo_student.Kod_stud
WHERE reiting.Reiting between 74 and 100
end

execute Students

--4--��������� �������� ���� ���� �� �� �������� � ����������� ������ �� ECTS.
create proc SumMarksInSystems
as
begin 
	SELECT SUM(Reiting.Reiting) as mySum ,
	dbo_student.Fname,dbo_student.Name,
	predmet.Nazva,
	nat = case when SUM(Reiting.Reiting) >= 90 then '³�����'
		when SUM(Reiting.Reiting) BETWEEN 85 and 89 then '���� �����'
		when SUM(Reiting.Reiting) BETWEEN 74 and 84 then '�����'
		when SUM(Reiting.Reiting) BETWEEN 65 and 74 then '���������'
		when SUM(Reiting.Reiting) BETWEEN 60 and 64 then '���������'
		when SUM(Reiting.Reiting) BETWEEN 35 and 59 then '�����������'
		when SUM(Reiting.Reiting) BETWEEN 1 and 34 then '��������� ����'
	end,
	ects = case when SUM(Reiting.Reiting) >= 90 then 'A'
		when SUM(Reiting.Reiting) BETWEEN 85 and 89 then 'B'
		when SUM(Reiting.Reiting) BETWEEN 74 and 84 then 'C'
		when SUM(Reiting.Reiting) BETWEEN 65 and 74 then 'D'
		when SUM(Reiting.Reiting) BETWEEN 60 and 64 then 'E'
		when SUM(Reiting.Reiting) BETWEEN 35 and 59 then 'F'
		when SUM(Reiting.Reiting) BETWEEN 1 and 34 then 'FX'
	end
	FROM dbo_student
		JOIN Reiting on Reiting.Kod_student = dbo_student.Kod_stud
		JOIN Rozklad_pids on Reiting.K_zapis = Rozklad_pids.K_zapis
		JOIN Predmet_plan on Predmet_plan.K_predm_pl = Rozklad_pids.K_predm_pl
		JOIN predmet on predmet.K_predmet = Predmet_plan.K_predmet
	GROUP BY dbo_student.Fname,dbo_student.Name,predmet.Nazva 
end


execute SumMarksInSystems

--5--������ �� ������� ����� � ������� ������� � ���� ��� ����� ����� � ������� �������� �����.
create trigger createGroup
ON dbo_student
INSTEAD OF INSERT 
AS
DECLARE @group varchar(15)
	IF @@ROWCOUNT >= 1
	BEGIN
		SELECT @group = kod_group FROM inserted
			BEGIN 
				IF 0=(SELECT count(*) FROM dbo_student
				JOIN dbo_groups ON dbo_groups.Kod_group = dbo_student.Kod_group
				WHERE dbo_groups.Kod_group like @group)
					BEGIN
						INSERT INTO dbo_groups(Kod_group,K_navch_plan)
						VALUES (@group,1)
						PRINT '���� ����� ������!'
					END 
				BEGIN
					INSERT INTO dbo_student (Fname,Kod_group,N_ingroup,Name,Sname)
						SELECT Fname, Kod_group, N_ingroup,Name, Sname from inserted
					PRINT '������� ������ �������!'
				END
			END
	END;
INSERT INTO dbo_student(Sname, Name, Fname, N_ingroup, Kod_group)
VALUES ('Ivanon','Ivan','Ivanovich','1','54');
SELECT * FROM dbo_groups;
SELECT * FROM dbo_student;
SELECT * FROM dbo_student where Kod_group like '54' ;
DELETE dbo_groups WHERE Kod_group like '54';

--6--������ �� ����������� ����� � ������� �������� - ���� ����� ���� �������� � ���� ����� ���������. 
alter trigger destroyAbandonedGroup
ON dbo_student
AFTER DELETE
AS
DECLARE  @group varchar(15)
	IF @@ROWCOUNT >= 1
	BEGIN
		SELECT @group = kod_group FROM deleted
		BEGIN
			IF 0 = (SELECT count(*) FROM dbo_student 
			where dbo_student.Kod_group like @group)
			BEGIN
				DELETE dbo_groups WHERE Kod_group like @group
				PRINT '����� ���� ��������, ������� � �� ���� ��������!'
			END
		END
	END;

DELETE FROM dbo_student WHERE Kod_group like '60';