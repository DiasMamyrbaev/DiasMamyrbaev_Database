-- 7. Display a list of minor passengers and their arrival destination.

select distinct
    p.passenger_id,
    concat(p.first_name, ' ', p.last_name) as passenger_name,
    p.date_of_birth,
    extract(year from age(current_date, p.date_of_birth)) as age,
    f.flight_id,
    arr.airport_name as arrival_airport,
    arr.city as arrival_city,
    arr.country as arrival_country
from passengers p
join booking b on b.passenger_id  = p.passenger_id
join flights f on f.flight_id = b.flight_id
join airport arr on arr.airport_id = f.arriving_airport_id
where extract(year from age(current_date, p.date_of_birth)) < 18
order by p.passenger_id;


