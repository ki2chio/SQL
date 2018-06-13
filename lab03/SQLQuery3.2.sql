--1)���� ������������ ������
select MIN(product.price) as Cheapest
from product

--2)���������� ��� ��������� ���� ������ ������ �����
select consumer.*, pact_of_product.*
from consumer 
inner join contract on contract.id_consumer = consumer.id_consumer
inner join pact_of_product on pact_of_product.id_contract = contract.id_contract
inner join product on product.id_product = pact_of_product.id_product
where product.name = '��������'

--3)���������� ��� ������ ��� ������, ����������� �� ������� �����
select bill_of_lading.*
from bill_of_lading
inner join transport on transport.id_transport = bill_of_lading.id_transport
where bill_of_lading.departning_date > dateadd(MONTH, -1, getdate())

--4)�������� ������� ������, ����������� ���������
select Sum(bill_of_lading.amount) as Products
from bill_of_lading
inner join transport on transport.id_transport = bill_of_lading.id_transport
where transport.name = '��������'

--5)���������� ��� ����������, �� ����� �������� ������� ������ ����� 20
select consumer.*, pact_of_product.*
from consumer
inner join contract on contract.id_consumer = consumer.id_consumer
inner join pact_of_product on pact_of_product.id_contract = contract.id_contract
where pact_of_product.amount>=20
order by consumer.id_consumer

--6)�������� ������� ������ �� ��������� �� ������� �� ����
select MAX(bill_of_lading.amount) as Greatest
from bill_of_lading
where bill_of_lading.departning_date > dateadd(MONTH, -6, getdate())

--7)������ ������ ���� ���� ����������� � �������� ������� � ����� ��� �� ����� �� 20
select product.*
from product
where product.price_list>=15 And product.price between 500.00 And 6000.00;

--8)���� ����������, ���� �� ������� ��������������� ����� ����� 30
select transport.*
from transport
where transport.price_km>=10;

9)���� ���������� ���� ���� ���������� �� 3 ���� ������ �� ������ 2 �����
select consumer.id_consumer, COUNT(bill_of_lading.id_contract) as kol
from consumer 
inner join contract on contract.id_consumer = consumer.id_consumer
inner join bill_of_lading on bill_of_lading.id_contract = contract.id_contract
where bill_of_lading.departning_date>dateadd(MONTH, -2, getdate())
group by consumer.id_consumer
having COUNT(bill_of_lading.id_contract)=3

--10)������� ������������ ������ ����� ���� �� ������ ����������
select Sum(bill_of_lading.amount) as Summa
from bill_of_lading
inner join contract on contract.id_contract = bill_of_lading.id_contract
where bill_of_lading.departning_date = '2018-03-22' and contract.id_contract = '22'

--11)��������, ����� ����������� ����� ������ ���������
SELECT TOP 1 consumer.name, Count (transport.name) AS CN FROM consumer
inner join contract on contract.id_consumer = consumer.id_consumer
inner join bill_of_lading on bill_of_lading.id_contract = contract.id_contract
inner join transport on transport.id_transport = bill_of_lading.id_transport
where transport.name = '˳���'
group by consumer.name
order by CN DESC;










