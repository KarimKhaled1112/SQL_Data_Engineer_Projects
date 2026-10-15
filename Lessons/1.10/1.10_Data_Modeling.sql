select *
from skills_job_dim
Limit 5;
select * 
from skills_dim
limit 5;
SELECT *
FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

PRAGMA show_tables_expanded;

describe job_postings_fact;

