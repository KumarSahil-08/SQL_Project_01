-- Q: What are the skills based on salary?

SELECT 
    skills,ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    job_title_short='Data Scientist' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
limit 10

/*
[High Salary Skills]
[
  {
    "skills": "gdpr",
    "avg_salary": "217738"
  },
  {
    "skills": "golang",
    "avg_salary": "208750"
  },
  {
    "skills": "atlassian",
    "avg_salary": "189700"
  },
  {
    "skills": "selenium",
    "avg_salary": "180000"
  },
  {
    "skills": "opencv",
    "avg_salary": "172500"
  },
  {
    "skills": "neo4j",
    "avg_salary": "171655"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "171147"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "169670"
  },
  {
    "skills": "php",
    "avg_salary": "168125"
  },
  {
    "skills": "tidyverse",
    "avg_salary": "165513"
  }
]
*/