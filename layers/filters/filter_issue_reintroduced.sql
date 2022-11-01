
select INITCAP(bool_value) as issue_reintroduced

from "REPORTING"."MIGRATED_MARTS"."DIMS_BOOL"


{{ column(
 name='ISSUE_REINTRODUCED',
 tags=['ids','names']
)}} 