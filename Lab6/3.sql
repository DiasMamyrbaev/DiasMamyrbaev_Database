-- 3. Create a query that finds all airlines that have no flights scheduled for the
-- next month.

select
    a.airline_id, a.airline_name, a.airline_country
from airline a
where not exists (
    select 1
    from flights f
    where f.airline_id = a.airline_id
      and f.sch_departure_time >= date_trunc('month', current_date) + interval '1 month'
      and f.sch_departure_time < date_trunc('month', current_date) + interval '2 months'
)
order by a.airline_id;


