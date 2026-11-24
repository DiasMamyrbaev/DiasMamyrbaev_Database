/* 9. Reschedule all bookings for a flight to a new flight.*/

-- before transfer
select 'booking' as tbl, booking_id, flight_id from booking where flight_id in (40, 901)
union all
select 'booking_flight', booking_id, flight_id from booking_flight where flight_id in (40, 901)
order by tbl, booking_id;

-- transfer
begin;

insert into flights
(flight_id, sch_departure_time, sch_arrival_time, departing_airport_id, arriving_airport_id,
 departing_gate, arriving_gate, airline_id, act_departure_time, act_arrival_time, created_at, updated_at)
values
(901, '2026-03-10 09:00', '2026-03-10 12:00', 5, 1, 'A1', 'B1', 5,
      '2026-03-10 09:05', '2026-03-10 12:10', now(), now());

update booking
set flight_id = 901, updated_at = now()
where flight_id = 40;

update booking_flight
set flight_id = 901, updated_at = now()
where flight_id = 40;

commit;

-- after transfer
select 'booking' as tbl, booking_id, flight_id from booking where flight_id in (40, 901)
union all
select 'booking_flight', booking_id, flight_id from booking_flight where flight_id in (40, 901)
order by tbl, booking_id;


