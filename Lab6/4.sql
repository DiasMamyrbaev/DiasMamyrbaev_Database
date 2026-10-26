-- 4. Create a query to display a list of passengers on a specific flight. 
-- for example flight_id = 1

select
    f.flight_id, p.passenger_id,
    concat(p.first_name, ' ', p.last_name) as passenger_name,
    p.passport_number, b.booking_id
from flights f
join booking_flight bf on bf.flight_id    = f.flight_id
join booking b on b.booking_id    = bf.booking_id
join passengers p on p.passenger_id  = b.passenger_id
where f.flight_id = 1
order by p.last_name, p.first_name;


