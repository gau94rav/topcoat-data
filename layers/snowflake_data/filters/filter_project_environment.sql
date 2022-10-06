


SELECT 
key,
      value
FROM  "REPORTING"."MIGRATED_MARTS"."DIM_ENVIRONMENT"


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