-- 8. Create a view that shows top 10 most visited countries.

create view v_top10_visited_countries as
select
    arr.country as country,
    count(b.booking_id) as total_visits,
    count(distinct b.passenger_id) as unique_visitors
from booking b
join flights f on f.flight_id = b.flight_id
join airport arr on arr.airport_id = f.arriving_airport_id
group by arr.country
order by total_visits desc, country
limit 10;

select * from v_top10_visited_countries;


