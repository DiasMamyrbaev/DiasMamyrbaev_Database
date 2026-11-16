-- 5. Modify the view created in task 4 to show only flights departing within the
-- next 7 days for a specific airline

create or replace view v_airline_flights as
select
    f.flight_id, a.airline_name,
    dep.airport_name as departing_airport,
    arr.airport_name as arriving_airport,
    f.sch_departure_time, f.sch_arrival_time
from flights f
join airline a on a.airline_id = f.airline_id
join airport dep on dep.airport_id = f.departing_airport_id
join airport arr on arr.airport_id = f.arriving_airport_id
where lower(a.airline_name) = 'air astana' and f.sch_departure_time >= now()
  and f.sch_departure_time <  now() + interval '7 days';

select * from v_airline_flights order by sch_departure_time;


