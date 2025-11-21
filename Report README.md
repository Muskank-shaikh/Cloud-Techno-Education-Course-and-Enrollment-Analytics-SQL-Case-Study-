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
join_date	date
