--Q: Identify the top 10 highest paying role
--  - focus on job posting with specified salaries

SELECT 
  job_title_short,
  job_title,
  job_location,
  job_schedule_type,
  job_country,
  salary_year_avg,
  name as company_name
FROM
  job_postings_fact
LEFT JOIN company_dim
  ON job_postings_fact.company_id = company_dim.company_id
WHERE 
  job_location= 'Anywhere' AND
  salary_year_avg IS NOT NULL
ORDER BY
  salary_year_avg DESC
LIMIT 10

/* 
[Top 10 Data Jobs with their Salary]
[
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "India",
    "salary_year_avg": "650000.0",
    "company_name": "Mantys"
  },
  {
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings"
  },
  {
    "job_title_short": "Data Scientist",
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "525000.0",
    "company_name": "Selby Jennings"
  },
  {
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "475000.0",
    "company_name": "Glocomms"
  },
  {
    "job_title_short": "Data Scientist",
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group"
  },
  {
    "job_title_short": "Senior Data Scientist",
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "375000.0",
    "company_name": "Algo Capital Group"
  },
  {
    "job_title_short": "Data Scientist",
    "job_title": "Head of Data Science",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "351500.0",
    "company_name": "Demandbase"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "336500.0",
    "company_name": "Meta"
  },
  {
    "job_title_short": "Data Engineer",
    "job_title": "Data Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "United States",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal"
  },
  {
    "job_title_short": "Machine Learning Engineer",
    "job_title": "Principal Machine Learning Engineer",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "job_country": "Sudan",
    "salary_year_avg": "325000.0",
    "company_name": "Storm5"
  }
]
*/
  
  