-- 10. Drop all existing views

-- 10.1 список view до удаления
select table_name as view_name
from information_schema.views
where table_schema = 'public'
order by table_name;

-- 10.2 удаление
drop view if exists v_flights_on_date;
drop view if exists v_bookings_next_week;
drop view if exists v_top5_routes;
drop view if exists v_airline_flights;
drop view if exists v_delayed_flights;
drop view if exists v_leffler_thompson_passengers;
drop view if exists v_top10_visited_countries;

-- 10.3 список view после удаления
select table_name as view_name
from information_schema.views
where table_schema = 'public'
order by table_name;


