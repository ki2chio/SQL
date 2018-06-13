--1)ціна найдешевшого товару
select MIN(product.price) as Cheapest
from product

--2)інформація про споживача який отримує певний товар
select consumer.*, pact_of_product.*
from consumer 
inner join contract on contract.id_consumer = consumer.id_consumer
inner join pact_of_product on pact_of_product.id_contract = contract.id_contract
inner join product on product.id_product = pact_of_product.id_product
where product.name = 'Телевізор'

--3)інформація про певний тип товару, відправлений за останній місяць
select bill_of_lading.*
from bill_of_lading
inner join transport on transport.id_transport = bill_of_lading.id_transport
where bill_of_lading.departning_date > dateadd(MONTH, -1, getdate())

--4)загальна кількість товарів, відправлених залізницею
select Sum(bill_of_lading.amount) as Products
from bill_of_lading
inner join transport on transport.id_transport = bill_of_lading.id_transport
where transport.name = 'Залізниця'

--5)інформація про споживачів, які мають отримати кількість товару більше 20
select consumer.*, pact_of_product.*
from consumer
inner join contract on contract.id_consumer = consumer.id_consumer
inner join pact_of_product on pact_of_product.id_contract = contract.id_contract
where pact_of_product.amount>=20
order by consumer.id_consumer

--6)найбільша кількість товарів що відправили за останніх пів року
select MAX(bill_of_lading.amount) as Greatest
from bill_of_lading
where bill_of_lading.departning_date > dateadd(MONTH, -6, getdate())

--7)перелік товарів ціна яких знаходиться в заданому діапазоні і прайс ліст не менше за 20
select product.*
from product
where product.price_list>=15 And product.price between 500.00 And 6000.00;

--8)види транспорту, ціна за кілометр транспортування якими більше 30
select transport.*
from transport
where transport.price_km>=10;

9)коди споживачів яким було відправлено по 3 види товарів за останні 2 місяці
select consumer.id_consumer, COUNT(bill_of_lading.id_contract) as kol
from consumer 
inner join contract on contract.id_consumer = consumer.id_consumer
inner join bill_of_lading on bill_of_lading.id_contract = contract.id_contract
where bill_of_lading.departning_date>dateadd(MONTH, -2, getdate())
group by consumer.id_consumer
having COUNT(bill_of_lading.id_contract)=3

--10)кількість відправленого товару певної дати за певним контрактом
select Sum(bill_of_lading.amount) as Summa
from bill_of_lading
inner join contract on contract.id_contract = bill_of_lading.id_contract
where bill_of_lading.departning_date = '2018-03-22' and contract.id_contract = '22'

--11)споживач, якому відправляють товар літаком найчастіше
SELECT TOP 1 consumer.name, Count (transport.name) AS CN FROM consumer
inner join contract on contract.id_consumer = consumer.id_consumer
inner join bill_of_lading on bill_of_lading.id_contract = contract.id_contract
inner join transport on transport.id_transport = bill_of_lading.id_transport
where transport.name = 'Літак'
group by consumer.name
order by CN DESC;










