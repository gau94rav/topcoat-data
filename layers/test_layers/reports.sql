select 1 as id, 'Report 1' as name, '2022-05-05 14:29:51' as date
UNION ALL
select 2 as id, 'Report 2' as name, '2021-05-04 11:00:00' as date
UNION ALL
select 3 as id, 'Report 3' as name, '2021-04-28 05:00:00' as date
UNION ALL
select 4 as id, 'Report 4' as name, '2022-04-29 05:00:00' as date
UNION ALL
select 5 as id, 'Report 5' as name, '2022-05-05 14:29:51' as date
UNION ALL
select 6 as id, 'Report 6' as name, '2021-05-04 11:00:00' as date
UNION ALL
select 7 as id, 'Report 7' as name, '2021-04-28 05:00:00' as date
UNION ALL
select 8 as id, 'Report 8' as name, '2022-04-29 05:00:00' as date


{{column(
	name='id',
	tags=['ids']
)}}

{{column(
	name='name',
	tags=['names']
)}}

{{column(
	name='date',
	tags=['dates']
)}}