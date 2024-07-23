--Q: What are the most in-demand skills for  data scientist?
--   identify top 5 skills for data scientist


SELECT 
    skills ,
    COUNT (skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE 
    job_title_short='Data Scientist' AND
    job_work_from_home = TRUE
group BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5

/*
[Top demand skills]
[
  {
    "skills": "python",
    "demand_count": "10390"
  },
  {
    "skills": "sql",
    "demand_count": "7488"
  },
  {
    "skills": "r",
    "demand_count": "4674"
  },
  {
    "skills": "aws",
    "demand_count": "2593"
  },
  {
    "skills": "tableau",
    "demand_count": "2458"
  }
]
*/