SELECT 'issue' as key, 'Issue' as value
UNION ALL
SELECT 'none' as key, 'None' as value
{{column(
    name='KEY',
    tags=["keys", "options"]
)}}
{{column(
    name='VALUE',
    tags=["values", "labels"]
)}}