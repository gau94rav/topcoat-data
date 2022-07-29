
 
 
SELECT 'Severity' as option
UNION ALL
SELECT 'Product Name'
UNION ALL
SELECT 'Issue Type'
UNION ALL
SELECT 'Status'
 
{{ column(
 name='OPTION',
 tags=['options','labels']
)}} 