-- 6. Create a query that shows all flights flying to a specific country by
-- combining flights, airports and airline, and using the condition on the
-- country name.

select
    f.flight_id, a.airline_name,
    dep.airport_name as departing_airport,
    arr.airport_name as arriving_airport,
    arr.country as arriving_country,
    f.sch_departure_time, f.sch_arrival_time
from flights f
join airline a on a.airline_id = f.airline_id
join airport dep on dep.airport_id = f.departing_airport_id
join airport arr on arr.airport_id = f.arriving_airport_id
where lower(arr.country) = 'kazakhstan'
order by f.flight_id;


