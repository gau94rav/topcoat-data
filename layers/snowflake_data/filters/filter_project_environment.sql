


SELECT 
key,
      value
FROM  "DATA_PRODUCTS"."PROD_MARTS"."DIM_ENVIRONMENT"


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