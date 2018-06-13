--споживачі, яким було відправлено по 3 види товарів за останні 2 місяці
select consumer.name, COUNT(bill_of_lading.id_contract) as kol
from consumer 
inner join contract on contract.id_consumer = consumer.id_consumer
inner join bill_of_lading on bill_of_lading.id_contract = contract.id_contract
where bill_of_lading.departning_date>dateadd(MONTH, -2, getdate())
group by consumer.name
having COUNT(bill_of_lading.id_contract)=3

--типи товарів, відправлені за останні 2 місяці
select bill_of_lading.type_of_product
from bill_of_lading
inner join transport on transport.id_transport = bill_of_lading.id_transport
where bill_of_lading.departning_date > dateadd(MONTH, -2, getdate())
group by bill_of_lading.type_of_product

--споживачі, які мають отримати кількість товару більше 25
select consumer.name
from consumer
inner join contract on contract.id_consumer = consumer.id_consumer
inner join pact_of_product on pact_of_product.id_contract = contract.id_contract
where pact_of_product.amount>=25
group by consumer.name

--споживач, якому відправляють товар залізницею найчастіше
SELECT TOP 1 consumer.name, Count (transport.name) AS CN FROM consumer
inner join contract on contract.id_consumer = consumer.id_consumer
inner join bill_of_lading on bill_of_lading.id_contract = contract.id_contract
inner join transport on transport.id_transport = bill_of_lading.id_transport
where transport.name = 'Залізниця'
group by consumer.name
order by CN DESC;

--види транспорту, ціна за кілометр транспортування якими більше 30
select transport.name
from transport
where transport.price_km>=30
group by transport.name

--загальна кількість товарів, відправлених авто
select Sum(bill_of_lading.amount) as Products
from bill_of_lading
inner join transport on transport.id_transport = bill_of_lading.id_transport
where transport.name = 'Авто'
group by transport.name

--перелік товарів ціна яких знаходиться в заданому діапазоні і прайс ліст не менше за 15
select product.name
from product
where product.price_list>=15 And product.price between 500.00 And 6000.00
group by product.name

--споживач, який отримує певний товар
select consumer.name
from consumer 
inner join contract on contract.id_consumer = consumer.id_consumer
inner join pact_of_product on pact_of_product.id_contract = contract.id_contract
inner join product on product.id_product = pact_of_product.id_product
where product.name = 'Холодильник'
group by consumer.name

select bill_of_lading.type_of_product
from bill_of_lading
inner join transport on transport.id_transport = bill_of_lading.id_transport
where bill_of_lading.departning_date > dateadd(MONTH, -2, getdate())
group by bill_of_lading.type_of_product

select transport.id_transport, transport.name, contract.id_contract as Просроченные_Контракты
from transport
inner join bill_of_lading on bill_of_lading.id_transport = transport.id_transport
inner join contract on contract.id_contract = bill_of_lading.id_contract
where bill_of_lading.departning_date > contract.signing_date
group by transport.id_transport, transport.name, contract.id_contract
UNION
select transport.id_transport, transport.name, contract.id_contract as Непросроченные_Контракты
from transport
inner join bill_of_lading on bill_of_lading.id_transport = transport.id_transport
inner join contract on contract.id_contract = bill_of_lading.id_contract
where bill_of_lading.departning_date < contract.signing_date
group by transport.id_transport, transport.name, contract.id_contract





