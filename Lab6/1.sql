-- 1. Write a query that displays all flights of a specific airline. for example air astana

select
    f.flight_id,a.airline_name,
    dep.airport_name as departing_airport,
    arr.airport_name as arriving_airport,
    f.sch_departure_time,
    f.sch_arrival_time
from flights f
join airline a   on a.airline_id   = f.airline_id
join airport dep on dep.airport_id = f.departing_airport_id
join airport arr on arr.airport_id = f.arriving_airport_id
where lower(a.airline_name) = 'air astana'
order by f.sch_departure_time;



