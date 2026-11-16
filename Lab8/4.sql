--4. Create a view that lists all flights for a specific airline.

create view v_airline_flights as
select
    f.flight_id, a.airline_name,
    dep.airport_name as departing_airport,
    arr.airport_name as arriving_airport,
    f.sch_departure_time, f.sch_arrival_time
from flights f
join airline a on a.airline_id = f.airline_id
join airport dep on dep.airport_id = f.departing_airport_id
join airport arr on arr.airport_id = f.arriving_airport_id
where lower(a.airline_name) = 'air astana';

select * from v_airline_flights order by sch_departure_time;


