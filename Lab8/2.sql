-- 2. Create a view that shows bookings for flights scheduled to depart within the
-- next week.

create view v_bookings_next_week as
select
    b.booking_id,
    concat(p.first_name, ' ', p.last_name) as passenger_name,
    f.flight_id,
    f.sch_departure_time,
    dep.city || ' - ' || arr.city as route,
    b.booking_platform, b.status, b.ticket_price
from booking b
join passengers p on p.passenger_id = b.passenger_id
join flights f on f.flight_id = b.flight_id
join airport dep on dep.airport_id = f.departing_airport_id
join airport arr on arr.airport_id = f.arriving_airport_id
where f.sch_departure_time >= now() and f.sch_departure_time < now() + interval '7 days';

select * from v_bookings_next_week order by sch_departure_time, booking_id;


