
 
 
SELECT 'Severity' as option
UNION ALL
SELECT 'Product Name'
UNION ALL
SELECT 'Issue Type'
 
{{ column(
 name='OPTION',
 tags=['options','labels']
)}} 