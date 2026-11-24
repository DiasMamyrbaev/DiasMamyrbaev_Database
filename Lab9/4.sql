/* 4. A passenger updates their details. Ensure the update is reflected across all
associated records, including bookings.*/

-- before change
select p.passenger_id, concat(p.first_name, ' ', p.last_name) as passenger_name,
       p.country_of_residence, b.booking_id, b.flight_id, b.updated_at
from passengers p
join booking b on b.passenger_id = p.passenger_id
where p.passenger_id = 3
order by b.booking_id;

-- update
begin;

update passengers
set last_name = 'Bekov-Ahmetov',
    country_of_residence = 'Kazakhstan',
    updated_at = now()
where passenger_id = 3;

update booking
set updated_at = now()
where passenger_id = 3;

commit;

-- after change
select p.passenger_id, concat(p.first_name, ' ', p.last_name) as passenger_name,
       p.country_of_residence, b.booking_id, b.flight_id, b.updated_at
from passengers p
join booking b on b.passenger_id = p.passenger_id
where p.passenger_id = 3
order by b.booking_id;


