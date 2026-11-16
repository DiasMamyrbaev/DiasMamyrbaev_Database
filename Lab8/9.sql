-- 9. Update any of the created views by adding new information in the view table.
-- Show results.

-- 9.1 insert через view
insert into v_delayed_flights
(flight_id, sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id,
 departing_gate, arriving_gate, airline_id, act_departure_time, act_arrival_time, created_at, updated_at)
values
(615,
 date_trunc('day', now()) - interval '4 days' + interval '18 hours 17 minutes',
 date_trunc('day', now()) - interval '4 days' + interval '21 hours 17 minutes',
 3, 5, 'G7', 'H3', 2,
 date_trunc('day', now()) - interval '4 days' + interval '18 hours 22 minutes',
 date_trunc('day', now()) - interval '4 days' + interval '48 hours 17 minutes',
 now(), now());

-- 9.2 update через view
update v_delayed_flights
set departing_gate = 'VIP-1'
where flight_id = 611;

-- 9.3 результат view
select flight_id, departing_gate, delay_hours
from v_delayed_flights
order by flight_id;

-- и в самой таблице flights
select flight_id, departing_gate, act_arrival_time - sch_arrival_time as arrival_delay
from flights
where flight_id in (611, 615)
order by flight_id;


