# Exploraatory Data Analysis w/ SQL: Job Market Analysis
  
![Project 1 Overview](../Images\1_1_Project1_EDA.png)

A SQL project analyzing the data engineer jjob market using real world job posting data. It demonstrates mu ability to **write production-quality analytical SQL, design efficient queries, and turn business questions into data-driven insights**.

## Executive Summry
- ✅ **Project Scope:** Built **3 analytical queries** that answer key questions abouth the data engineer job market
- ✅ **Data modeling:** Used **multi-table joins** across fact and dimension tables to extract insights.
- ✅ **Analytics:** applied **aggregations, filtering, and sorting** to find top skills by demand, salary, and overall value.
- ✅ **Outcomes:** Delivered **actionable insights** on SQL/Python dominance, cloud tredns, and salary patterns.

If you only have a minute, review these:

1. [`01_top_demand_skilss.sql`](../1_EDA/01_top_demanded_skills.sql) - salary analysis with multi-table joins
2. [`02_top_paying_skills.sql`](../1_EDA/02_top_paying_skills.sql) - salary analysis with aggregations
3. [`03_optimal_slolls.sql`](../1_EDA/03_optimal_skills.sql) - combined demand/salary optimiation query
## problem & Context

Job market analysts need to answer questions like:
- **Most in-demand:** *Which skills are most in-demand for data engineers?*

- **Highest paid:** *Which skills command the highest salaries?*

- **Best trade-off:** *What is the optimal skill set balancing demand and compensation?*

This project analyzes a **data warehouse** built using a star schema design. The warehouse stucture consists of:

![Data Warehouse](../Images/1_2_Data_Warehouse.png)

- ** Fact TAble:** `job_postings_fact` -Central table containing job posting details (job titles, locations, salaries, dates, etc.)

- **Dimension Tables:** 
-`Company_dim` - Company information linked to job postings

- `skills_dim` - Skills catalog with skill names and types
- **Bridge Table:** `skills_job_dim` - Resolves the many-to-many relationship between job postings and skills

By querying across these interconnected tables, extracted insight about skills demand, salary patterns, and optimal skill combinations for data engineering roles.

## Tech Stack
- **Query Engine:** DuckDB for fast OLAP-style analytical queries.
- **Language:** SQL (ANSI-style with analytical functions)
- **Data Modeling:**  Star schema with fact + dimension +brigde tables
- **Development:** VS CODE for SQL editing + Terminal for DuckDB CLI
- **Version Control:** Git/GitHub for versioned SQL scripts

## Analysis overview
1. **[Top Demanded Skills](../1_EDA/01_top_demanded_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions.
2. **[Top Paying Skills](../1_EDA/02_top_paying_skills.sql)** - Analyzes the 25 highest-paying skills with salary and demand metrics.
3. **[Optimal Skills](./03_optimal_skills.sql)** - Calcultes an optimal score using matural log of demand combined with median salary to identify the most valuable skills to learn.

### Key Insights
- Core langueages: SQL and Paython each appear in ~29,000 job postings, making them the most demanded skilss.
- Cloud platfroms: AWS and Azure are critical for modern data rngineering roles.
- Infra & tooling: Kubernetes, Docker, and Terraform are associated with premium salaries.
- Big data tools: Apache Spark shows strong demand with competitve compensation.

## SQL Skills Demonstrated 

### Query Design & Optimization

- **Complex Joins:** mutli-table `INNERJOIN` operations across `job_postings_fact`, `skills_job_dim`
- **Aggregations:** `COUNT()`, `MWDIAN()`, `ROUND()` for statistical analysis
- **Filtering:** Biilean ligic with `WHERE` clauses and multiple conditions
(`job_title_short`, `job_work_from _home`, `salary_year_avg IS NOT NULL`)
- **Sorting & Limiting:** `ORDER BY` with `DESC` nd `LIMIT` for top-N analysis

### Data Analysis Techniques

- **Grouping:** `GROUP BY` for categorical analysis by skill
- **Conditional Logic:** `CASE WHEN` statements for derived metics
- **Mathematical Functins:** `LN()` for natural lofarithm transformation to normaize demand metics
- **Calculated Merics:** Derived optimal score combining lof=transformed dmeand with median salary
- **Having Clause:** Filtering aggregated results (skills with >= 100 postings)
- **NULL Handling:** Proper filtering of incomplete records (`salaey_year_avg IS NOT NULL`)