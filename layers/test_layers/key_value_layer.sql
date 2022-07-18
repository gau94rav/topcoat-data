SELECT 'high' as key, 'TOO High' as value
UNION ALL
SELECT 'medium' as key, 'Medium' as value
UNION ALL
SELECT 'low' as key, 'Low' as value
UNION ALL
SELECT 'open' as key, 'Open' as value
UNION ALL
SELECT 'demo' as key, 'Ignored' as value
{{column(
    name='KEY',
    tags=["keys", "options", "ids"]
)}}
{{column(
    name='VALUE',
    tags=["values", "labels", "names"]
)}}