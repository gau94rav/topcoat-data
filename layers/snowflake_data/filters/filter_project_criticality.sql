

SELECT 
KEY,
VALUE 
FROM   "DATA_PRODUCTS"."PROD_MARTS"."DIM_CRITICALITY"
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