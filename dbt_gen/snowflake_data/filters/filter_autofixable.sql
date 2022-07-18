 
SELECT distinct autofixable

from {{ ref('seed_filtered_ungrouped_issues') }}
--where autofixable not in ('Upgrade, Patch', 'Upgrade, Pin')
 
 