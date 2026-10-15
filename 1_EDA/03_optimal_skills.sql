/*
Question: What are the most optimal skills for fata engineers-balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
- This approach highlights skills that balance market demand and financial reward. It weights core skills
*/
SELECT
        sd.skills,
        ROUND(MEDIAN(jpf.salary_year_avg) ,0) AS median_salary,
        COUNT(jpf.*) AS demand_count,
        ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1000000,2) AS optimal_score,
        ROUND(LN(COUNT(jpf.*)),1) AS ln_demand_count
    FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id 
    INNER JOIN skills_dim AS sd
        ON sjd.skill_id =sd.skill_id
    WHERE
        jpf.job_title_short = 'Data Engineer'
        AND jpf.job_work_from_home =True
        AND jpf.salary_year_avg IS NOT NULL

    GROUP BY 
        sd.skills
    HAVING 
        COUNT(jpf.*) > 100
    ORDER BY 
        optimal_score DESC
    LIMIT 25;