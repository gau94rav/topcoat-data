SELECT
    COUNT(CASE WHEN lower(issue_severity) = 'critical' AND issue_type != 'License' THEN 1 END) AS critical,
    COUNT(CASE WHEN lower(issue_severity) = 'high' AND issue_type != 'License' THEN 1 END) AS high,
    COUNT(CASE WHEN lower(issue_severity) = 'medium' AND issue_type != 'License' THEN 1 END) AS medium,
    COUNT(CASE WHEN lower(issue_severity) = 'low' AND issue_type != 'License' THEN 1 END) AS low,
    COUNT(*) AS total,
    COUNT(distinct problem_id) AS total_unique
FROM
   {{ ref('seed_filtered_ungrouped_issues') }}
WHERE
    1=1