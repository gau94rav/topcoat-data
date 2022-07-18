SELECT
        key,
       value as value
FROM  "SANDBOX"."TC_TEST"."ENVIRONMENT" 
       


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