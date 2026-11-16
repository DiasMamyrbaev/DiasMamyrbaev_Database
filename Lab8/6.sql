-- 6.Create a view to show flights that are delayed by more than 24 hours.

create view v_delayed_flights as
select
    f.flight_id, f.sch_departure_time,
    f.sch_arrival_time, f.departing_airport_id,
    f.arriving_airport_id, f.departing_gate,
    f.arriving_gate, f.airline_id,
    f.act_departure_time, f.act_arrival_time,
    f.created_at, f.updated_at,
    f.act_arrival_time - f.sch_arrival_time as arrival_delay,
    round(extract(epoch from (f.act_arrival_time - f.sch_arrival_time)) / 3600, 1) as delay_hours
from flights f
where f.act_arrival_time - f.sch_arrival_time > interval '24 hours'
with check option;

select flight_id, sch_arrival_time, act_arrival_time, arrival_delay, delay_hours
from v_delayed_flights
order by delay_hours desc;


