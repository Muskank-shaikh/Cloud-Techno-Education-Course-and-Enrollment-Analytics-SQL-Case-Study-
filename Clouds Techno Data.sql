use educationdb;
select * from students;
select name, monthname(join_date) as months,
year(join_date) as joining_year from students;

select * from courses;
select * from enrollments;
select  instructor_name  from instructors
where specialization = 'Data Science' ;

select count(instructor_name) 
from instructors where specialization = 'Data Science';

select c.course_name, i.instructor_name, i.specialization 
from instructors i 
join courses c on i.instructor_id = c.instructor_id
group by c.course_name, i.instructor_name, i.specialization ;

select distinct instructor_name, specialization from instructors;
delete from instructors where instructor_id 
not in (select min(instructor_id) from instructors group by instructor_name,
specialization);

select name,
monthname(join_date), dayname(join_date) from students
;

select count(name), monthname(join_date) as joining_month from students
where monthname(join_date) between 'march' and 'may'
group by student_id;

select name, monthname(join_date) as joining_month from students
where monthname(join_date) between 'march' and 'may'
group by student_id;

select  count(join_date), monthname(join_date) as joining_month from students
group by  monthname(join_date)
order by  monthname(join_date) desc;

select s.name, monthname(e.enrollment_date),  count(*) as students_enrolled
from enrollments e 
join students s on e.student_id = s.student_id
group by s.name, monthname(e.enrollment_date)
order by monthname(e.enrollment_date) desc;

select * from courses;
select c.course_name, s.name, monthname( e.enrollment_date) from enrollments e
join courses c on e.course_id = c.course_id
join students s on e.student_id = s.student_id 
group by  c.course_name, s.name,  e.enrollment_date
order by monthname( e.enrollment_date) asc ;


delimiter $$ 
create procedure coursenrolls(out joining_month varchar(50), out CourseName varchar(50))
begin 
select  s.name, c.course_name, 
monthname(e.enrollment_date) into joining_month from enrollments e 
join students s on e.student_id = s.student_id 
join courses c on e.course_id = c.course_id
where c.course_name = CourseName ;
end $$ 
delimiter ;

call courseenrolls('june','python for beginners',@result);
select @result as re_sults;

select c.course_name, monthname(e.enrollment_date), count(*) 
from enrollments e 
join courses c on e.course_id = c.course_id 
where c.course_name = 'Python for Beginners' and  monthname(e.enrollment_date) = 'June'
group by c.course_name, monthname(e.enrollment_date) ;

select count(*), monthname(e.enrollment_date ),  c.course_name 
from courses c 
join enrollments e on c.course_id = e.course_id
where c.course_name = 'Python for Beginners'
group by monthname(e.enrollment_date ),  c.course_name ;

SELECT 
    COUNT(*) AS total_enrollments,
    MONTHNAME(e.enrollment_date) AS month_name,
    c.course_name
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE c.course_name = 'Advanced Excel Analytics'
GROUP BY MONTH(e.enrollment_date), MONTHNAME(e.enrollment_date), c.course_name
ORDER BY MONTH(e.enrollment_date);

select * from courses;
delimiter $$
create procedure highPrice()
begin
select course_name, price
from courses
where course_name =  'Python for beginners';
end $$ 
delimiter ;

call highPrice();
select distinct c.course_name, c.price, monthname(e.enrollment_date)
from enrollments e 
join courses c on e.course_id = c.course_id
group by c.course_name, c.price, monthname(e.enrollment_date);

select distinct course_name, price 
from courses where price > 50;

select c.course_name, sum(c.price), monthname(e.enrollment_date) from enrollments e
join courses c on e.course_id = c.course_id
where  monthname(e.enrollment_date) = 'June'
group by c.course_name, month(e.enrollment_date);

SELECT 
    c.course_name,
    SUM(c.price) AS total_revenue,
    MONTHNAME(e.enrollment_date) AS month_name
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
WHERE MONTHNAME(e.enrollment_date) = 'June'
GROUP BY c.course_name;

SELECT 
    
    SUM(c.price) AS total_revenue
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
WHERE MONTH(e.enrollment_date) = 6
  AND YEAR(e.enrollment_date) = 2023
GROUP BY c.course_name;

select sum(c.price) as revenue, monthname(e.enrollment_date) 
from enrollments e 
join courses c on e.course_id = c.course_id 
where year(enrollment_date) = 2023
group by monthname(e.enrollment_date); 

select sum(e.rating), c.course_name
from enrollments e 
join courses c on e.course_id = c.course_id 
join students s on e.student_id = s.student_id
where e.rating is not null
group by  c.course_name; 

select count(*)  
from enrollments 
where rating is null;

select s.name, e.rating, c.course_name
from enrollments e 
join students s on e.student_id = s.student_id
join courses c on e.course_id = c.course_id
where c.course_name = 'Python for beginners'
group by s.name, e.rating, c.course_name; 

select * from instructors;
select distinct instructor_name, monthname(join_date)
from instructors;

select  distinct i.instructor_name, monthname(i.join_date), c.course_name
from instructors i 
join courses c on i.instructor_id = c.instructor_id;

select s.name, c.course_name, monthname(e.enrollment_date), year(e.enrollment_date)
from enrollments e 
join courses c on e.course_id = c.course_id
join students s on e.student_id = s.student_id
where monthname(e.enrollment_date)='August'
group by s.name, c.course_name, monthname(e.enrollment_date), year(e.enrollment_date);

select s.name, c.course_name, monthname(e.enrollment_date), year(e.enrollment_date)
from enrollments e 
join courses c on e.course_id = c.course_id
join students s on e.student_id = s.student_id; 

select distinct course_name from courses;