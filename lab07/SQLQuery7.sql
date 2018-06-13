USE [accountingSupermarket]

SELECT sysobjects.name AS Таблица, sysindexes.name AS Индекс, sysindexes.indid AS Номер
FROM sysobjects INNER JOIN
sysindexes ON sysobjects.id = sysindexes.id
WHERE (sysobjects.xtype = 'U') AND (sysindexes.indid > 0)
ORDER BY sysobjects.name, sysindexes.indid

create nonclustered index IxTransportName on transport(name)
select OBJECT_NAME(object_id) as table_name,
name as index_name, type, type_desc
from sys.indexes
where OBJECT_ID = OBJECT_ID(N'transport')

create nonclustered index IxNameKm on transport(name, price_km)


create nonclustered index IxKmName on transport(price_km, name)


select index_type_desc, page_count,
record_count, avg_page_space_used_in_percent,
avg_fragment_size_in_pages
from sys.dm_db_index_physical_stats
(db_id(N'accountingSupermarket'), OBJECT_ID(N'transport'), Null,
Null, 'Detailed')