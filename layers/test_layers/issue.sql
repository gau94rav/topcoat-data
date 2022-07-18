SELECT 'severity' as key, 'Severity' as value
UNION ALL
SELECT 'product' as key, 'Product' as value
UNION ALL
SELECT 'status' as key, 'Status' as value
UNION ALL
SELECT 'issue' as key, 'Issue Type' as value
{{column(
    name='KEY',
    tags=["keys", "options"]
)}}
{{column(
    name='VALUE',
    tags=["values", "labels"]
)}}