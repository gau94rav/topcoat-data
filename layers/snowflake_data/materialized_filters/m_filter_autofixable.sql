select AUTOFIXABLE

from "SANDBOX"."TC_TEST"."AUTOFIXABLE"
--where autofixable not in ('Upgrade, Patch', 'Upgrade, Pin')

{{ column(
 name='AUTOFIXABLE',
 tags=['ids','names']
)}} 
