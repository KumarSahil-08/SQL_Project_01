SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 20
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 20;


/*
[Top 20 Skills As per High Demand & High Salary]
[
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "763",
    "avg_salary": "143828"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "591",
    "avg_salary": "142833"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "394",
    "avg_salary": "137885"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "219",
    "avg_salary": "146970"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "217",
    "avg_salary": "149630"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "149",
    "avg_salary": "150188"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "122",
    "avg_salary": "142306"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152603"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "113",
    "avg_salary": "144816"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "110",
    "avg_salary": "129920"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "110",
    "avg_salary": "129920"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "82",
    "avg_salary": "143322"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "81",
    "avg_salary": "148964"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "77",
    "avg_salary": "129224"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "73",
    "avg_salary": "149089"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "72",
    "avg_salary": "152687"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "72",
    "avg_salary": "131390"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "64",
    "avg_salary": "145706"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "63",
    "avg_salary": "139631"
  }
]
*/