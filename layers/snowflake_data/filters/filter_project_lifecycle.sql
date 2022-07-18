

SELECT distinct
        'Lifecycle' as key,
       INITCAP(trim(F.value, '"')) AS value 
FROM "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V3" pa, 
       Table(Flatten(pa.lifecycle)) F


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