-- 5. Use EXPLAIN ANALYZE to check index usage in a query filtering by
-- departure_airport and arrival_airport.


-- 5.1 на большой таблице
explain (analyze, buffers)
select * from flights_perf
where departing_airport_id = 10 and arriving_airport_id = 20;



-- 5.2 на таблице flights

analyze flights;

explain analyze
select *
from flights
where departing_airport_id = 1 and arriving_airport_id = 4;




-- 5.3 то же, но отключаем seq scan, чтобы увидеть работу индекса
set enable_seqscan = off;

explain analyze
select *
from flights
where departing_airport_id = 1 and arriving_airport_id = 4;

reset enable_seqscan;


