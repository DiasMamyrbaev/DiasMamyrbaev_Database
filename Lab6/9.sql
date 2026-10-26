-- 9. Print a list of flights where the airline's home country and origin country are
-- the same. Group them by the airport country.


-- список рейсов отсортированный по стране аэропорта
select
    dep.country as airport_country,
    f.flight_id, a.airline_name, a.airline_country,
    dep.airport_name as departing_airport,
    f.sch_departure_time
from flights f
join airline a on a.airline_id = f.airline_id
join airport dep on dep.airport_id = f.departing_airport_id
where lower(a.airline_country) = lower(dep.country)
order by dep.country, f.flight_id;


-- то же самое но сгруппировано по стране
select
    dep.country as airport_country,
    count(f.flight_id) as total_flights,
    string_agg(f.flight_id::text, ', ' order by f.flight_id) as flight_ids
from flights f
join airline a on a.airline_id = f.airline_id
join airport dep on dep.airport_id = f.departing_airport_id
where lower(a.airline_country) = lower(dep.country)
group by dep.country
order by total_flights desc;


