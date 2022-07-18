SELECT
        key,
       value as value
FROM  "SANDBOX"."TC_TEST"."LIFECYCLE" 
       


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