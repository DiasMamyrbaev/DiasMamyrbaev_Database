-- 2. Compose a query to obtain a list of all flights with the names of departure
--  airports.

select
    f.flight_id, dep.airport_name as departing_airport, dep.city as departing_city,
    f.sch_departure_time, f.sch_arrival_time
from flights f
join airport dep on dep.airport_id = f.departing_airport_id
order by f.flight_id;


