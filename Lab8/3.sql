-- 3. Create a view to show the top 5 most popular flight routes based on the
-- number of bookings.

create view v_top5_routes as
select
    dep.airport_name as departing_airport,
    arr.airport_name  as arriving_airport,
    dep.city || ' - ' || arr.city as route,
    count(b.booking_id) as total_bookings
from booking b
join flights f on f.flight_id = b.flight_id
join airport dep on dep.airport_id = f.departing_airport_id
join airport arr on arr.airport_id = f.arriving_airport_id
group by dep.airport_id, dep.airport_name, dep.city, arr.airport_id, arr.airport_name, arr.city
order by total_bookings desc, departing_airport
limit 5;

select * from v_top5_routes;


