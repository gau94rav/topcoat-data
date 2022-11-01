SELECT
    COUNT(CASE WHEN lower(issue_severity) = 'critical' THEN 1 END) AS critical,
    COUNT(CASE WHEN lower(issue_severity) = 'high' THEN 1 END) AS high,
    COUNT(CASE WHEN lower(issue_severity) = 'medium' THEN 1 END) AS medium,
    COUNT(CASE WHEN lower(issue_severity) = 'low' THEN 1 END) AS low,
    COUNT(*) AS total,
    COUNT(distinct problem_id) AS total_unique
FROM
   {{ ref('base_issues_detail') }}
WHERE
    1=1