/* 2. Rescheduling a flight. You need to reschedule a flight. Verify the ‘flights’ table
reflects the new departure time. Simulate an error to test rollback (for
example, invalid flight_id).*/

-- before transfer
select flight_id, sch_departure_time, sch_arrival_time
from flights
where flight_id = 5;

-- flight rescheduling
begin;

update flights
set sch_departure_time = timestamp '2026-02-01 10:00',
    sch_arrival_time = timestamp '2026-02-01 13:00',
    updated_at = now()
where flight_id = 5;

commit;

-- check
select flight_id, sch_departure_time, sch_arrival_time, updated_at
from flights
where flight_id = 5;

-- Rollback test
begin;

update flights
set sch_departure_time = timestamp '2026-03-15 08:00', updated_at = now()
where flight_id = 5;

update flights
set sch_departure_time = timestamp '2026-03-15 08:00'
where flight_id = 'abc';

rollback;

-- rollback check
select flight_id, sch_departure_time
from flights
where flight_id = 5;


