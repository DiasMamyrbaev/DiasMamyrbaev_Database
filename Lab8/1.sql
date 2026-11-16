-- 1. Create a view to show details of all flights that are departing on a specific date.

create view v_flights_on_date as
select
    f.flight_id, a.airline_name,
    dep.airport_name as departing_airport,
    arr.airport_name as arriving_airport,
    f.sch_departure_time, f.sch_arrival_time,
    f.departing_gate, f.arriving_gate
from flights f
join airline a on a.airline_id   = f.airline_id
join airport dep on dep.airport_id = f.departing_airport_id
join airport arr on arr.airport_id = f.arriving_airport_id
where f.sch_departure_time >= date '2026-01-05' and f.sch_departure_time < date '2026-01-06';

select * from v_flights_on_date order by sch_departure_time;


