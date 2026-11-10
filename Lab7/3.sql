-- 3. Create a composite index on the departure_airport_id and arrival_airport_id
-- columns.

create index idx_flights_dep_arr_airport on flights (departing_airport_id, arriving_airport_id);

-- проверка: какие индексы теперь есть у flights
select indexname, indexdef
from pg_indexes
where tablename = 'flights'
order by indexname;

