SELECT
        key,
       INITCAP(value) as value
FROM  "SANDBOX"."TC_TEST"."CRITICALITY" 
       


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