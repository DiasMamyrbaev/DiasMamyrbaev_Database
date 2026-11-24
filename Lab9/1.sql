/* 1.A passenger cancels their booking. You need to remove the booking for the
flight. Ensure the ‘booking’ table no longer contains the booking. Simulate an
error to test rollback (for example, invalid booking_id).
*/

-- before deletion
select booking_id, flight_id, passenger_id, ticket_price
from booking
where booking_id in (59, 60)
order by booking_id;

-- cancellation of reservation
begin;

delete from boarding_pass where booking_id = 60;
delete from booking_flight where booking_id = 60;
delete from baggage_check where booking_id = 60;
delete from baggage where booking_id = 60;
delete from booking where booking_id = 60;

commit;

-- check
select count(*) as booking_60_rows
from booking
where booking_id = 60;

-- Rollback test
begin;

delete from boarding_pass  where booking_id = 59;
delete from booking_flight where booking_id = 59;
delete from booking where booking_id = 'abc';

rollback;

-- rollback test
select
    (select count(*) from boarding_pass  where booking_id = 59) as boarding_pass_rows,
    (select count(*) from booking_flight where booking_id = 59) as booking_flight_rows,
    (select count(*) from booking where booking_id = 59) as booking_rows;


