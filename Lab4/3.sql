-- 3. Fing all flight numbers that coordinates with both airline 1 and airline 2.

select flight_id 
from flights 
where airline_id = 1
intersect
select flight_id 
from flights 
where airline_id = 2;


