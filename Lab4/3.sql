-- 3. Fing all flight numbers that coordinates with both airline 1 and airline 2.

select f1.flight_id  as airline1_flight, f2.flight_id  as airline2_flight, f1.departing_airport_id, f1.arriving_airport_id
from flights f1
join flights f2 on  f1.departing_airport_id = f2.departing_airport_id and f1.arriving_airport_id  = f2.arriving_airport_id
where f1.airline_id = 1 and f2.airline_id = 2;

