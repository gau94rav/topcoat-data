select 'Open' as issue_status
UNION ALL
SELECT 'Resolved'
UNION ALL
SELECT 'Ignored'


{{ column(
 name='ISSUE_STATUS',
 tags=['ids','names']
)}} 