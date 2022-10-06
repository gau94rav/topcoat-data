

SELECT 
KEY,
VALUE 
FROM   "REPORTING"."MIGRATED_MARTS"."DIM_CRITICALITY"
order by SORT_COLUMN desc
{{ column(
   name='KEY',
   tags=['keys']
)
}}
{{ column(
   name='VALUE',
   tags=['values']
)
}}