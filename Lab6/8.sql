-- 8. Display the passenger’s full name, passport number, and the passenger’s
-- current time of arrival at the destination.

select
    concat(p.first_name, ' ', p.last_name) as passenger_name,
    p.passport_number, f.flight_id, 
    arr.city as destination_city,
    f.act_arrival_time as current_arrival_time
from passengers p
join booking b on b.passenger_id = p.passenger_id
join flights f on f.flight_id = b.flight_id
join airport arr on arr.airport_id = f.arriving_airport_id
order by f.act_arrival_time, p.last_name;


