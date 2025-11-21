# Cloud-Techno-Education-Course-and-Enrollment-Analytics-SQL-Case-Study-
Evaluated Cloud Techno's student and instructor performance using MySQL with insights on course demand and enrollments.
Clouds Techno – Student Enrollment & Course Performance (SQL Case Study)
Institute Overview

Clouds Techno is a new online education startup offering technology courses through a learning platform similar to Udemy. The management wanted to understand how they are growing, how students are engaging, and how their instructors and courses performed in 2023.

As a Data Analyst, I conducted an analysis using MySQL, exploring enrollment trends, revenue, instructor performance, and operational issues.

📝 Case Study Questions (Asked to the Institute)

To understand their goals, I asked:

Are you expecting higher demand for any specific courses?

Which time period should be analyzed? Seasonal patterns or tech trend–based?

If seasonal, which months matter (e.g., summer/winter)?

Are you planning to update or promote any specific course (based on budget, student feedback, or ratings)?

What are the loss/profit insights per course?

How are instructors performing? How are students progressing?

📈 Summary of Findings
1. Student Join Dates (Institute Registration)

Highest joinings: January, February, March

Pattern: End of winter → early March peak

Insight: No strong seasonal trend; joinings influenced by availability and interest.

2. Course Enrollment Trends (Actual Course Signups)

Peak enrollment months:
April, May, June, July

Month	Courses in Demand
April	Python, Machine Learning, Business Analytics
May	Web Development (highest), Cloud Computing, Advanced Excel
June	Python, ML, AE, BA
July	Python, Cloud, BA

Most demanded courses (3 months each):

Python

Cloud Computing

Business Analytics

Web Development had 2 enrollments in May, becoming the only course active that month.

3. Course Pricing

Cheapest: Python – ₹49.99

Highest: ML – ₹78.00, Web Dev – ₹69.99

Moderate: AE – ₹59.00, Cloud – ₹55.00

4. Revenue Insights

Total yearly revenue (2023): ₹1161.43

Highest revenue months:

May – ₹308.98 (Web Development alone)

June – ₹232.49

5. Instructor Performance (Based on Ratings)
Instructor	Course	Rating	Insight
Sarah Johnson	Business Analytics	13.4	Excellent
Anita Desai	Advanced Excel	13.3	Excellent
Lisa Wong	Cloud Computing	8.8	Good (many students still in progress)
Karan Malhotra	Python, Web Dev	No rating	Students still progressing
6. Instructor Joining Timeline Issues

Karan Malhotra: Python & Web Dev started in Nov 2023, but students enrolled as early as Feb → long waiting intervals → risk of dropout.

Anita Desai: AE started in October, but enrollments occured months earlier.

Sarah Johnson: BA start date aligned well with enrollments (good timing).

Lisa Wong: Cloud Computing started in March, enrollments in May & July (acceptable gap).

Identified Problem:
Delayed course start despite early enrollments → potential loss, cancellations, and poor student experience.

🔧 Recommendations

Start batch-based sessions to avoid long waiting times.

Improve marketing strategies for low-priced courses.

Implement student feedback surveys for improvements & updates.

Focus on August (very low enrollment).
Suggested: Workshops, hybrid events, webinars.

🛠 Tools Used

MySQL – Data analysis & queries

Canva – Presentation

🗂 Database: EducationDB

Contains 4 tables: Students, Courses, Enrollments, Instructors.

📌 Table Structures
1. Courses
Column	Type
course_id	INT PK AI
course_name	VARCHAR(100)
category	VARCHAR(50)
level	VARCHAR(20)
instructor_id	INT
price	DECIMAL(8,2)
2. Enrollments
Column	Type
enrollment_id	INT PK AI
student_id	INT
course_id	INT
enrollment_date	DATE
completion_date	DATE
progress_percent	INT
rating	DECIMAL(3,1)
3. Instructors
Column	Type
instructor_id	INT PK AI
instructor_name	VARCHAR(50)
specialization	VARCHAR(50)
join_date	DATE
4. Students
Column	Type
student_id	INT PK AI
name	VARCHAR(50)
email	VARCHAR(100)
country	VARCHAR(30)
join_date	DATE
🧩 SQL Queries Used
1. Understand student join dates
select name, monthname(join_date) as months,
year(join_date) as joining_year 
from students;

2. Courses with their instructors
select c.course_name, i.instructor_name, i.specialization 
from instructors i 
join courses c on i.instructor_id = c.instructor_id
group by c.course_name, i.instructor_name, i.specialization;

3. Student registration trend
select count(join_date), monthname(join_date) as joining_month 
from students
group by monthname(join_date)
order by monthname(join_date) desc;

4. Enrollment trend
select s.name, monthname(e.enrollment_date), count(*) as students_enrolled
from enrollments e 
join students s on e.student_id = s.student_id
group by s.name, monthname(e.enrollment_date)
order by monthname(e.enrollment_date) desc;

5. Stored procedure for automation
delimiter $$ 
create procedure coursenrolls(out joining_month varchar(50), out CourseName varchar(50))
begin 
select  s.name, c.course_name, 
monthname(e.enrollment_date) into joining_month 
from enrollments e 
join students s on e.student_id = s.student_id 
join courses c on e.course_id = c.course_id
where c.course_name = CourseName ;
end $$ 
delimiter ;

call courseenrolls('june','python for beginners',@result);
select @result as re_sults;

6. Analyze course price per month
select distinct c.course_name, c.price, monthname(e.enrollment_date)
from enrollments e 
join courses c on e.course_id = c.course_id
group by c.course_name, c.price, monthname(e.enrollment_date);

7. Find highest priced courses
select distinct course_name, price 
from courses 
where price > 50;

8. Monthly revenue
select sum(c.price) as revenue, monthname(e.enrollment_date) 
from enrollments e 
join courses c on e.course_id = c.course_id 
where year(enrollment_date) = 2023
group by monthname(e.enrollment_date);

9. Course performance by rating
select sum(e.rating), c.course_name
from enrollments e 
join courses c on e.course_id = c.course_id 
join students s on e.student_id = s.student_id
where e.rating is not null
group by c.course_name;

10. Number of courses still in progress
select count(*)  
from enrollments 
where rating is null;
