SELECT * from student;

select course,count(*) from student group by course;

select grade , count(*) from student group by grade
having count(*) > 1;