-- 5.Find the average age of male and female flying passengers and list in ascending order

select gender, avg(extract(year from age(current_date, date_of_birth))) as avg_age
from passengers
group by gender 
order by avg_age asc;
