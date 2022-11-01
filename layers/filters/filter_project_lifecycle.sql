

SELECT 
key,
      value 
FROM "REPORTING"."MIGRATED_MARTS"."DIM_LIFECYCLE"


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