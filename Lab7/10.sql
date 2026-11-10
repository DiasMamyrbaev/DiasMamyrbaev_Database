/* 10. Create a composite index on the Passengers table using first_name and
last_name. Write two SQL queries: one filtering by both first_name and
last_name, and another filtering only by last_name. Use EXPLAIN ANALYZE
to compare their execution plans.*/

create index idx_passengers_first_last
    on passengers (first_name, last_name);

analyze passengers;


-- 10.1 фильтр по обеим колонкам
explain analyze
select *
from passengers
where first_name = 'Dana'
  and last_name  = 'Weber';

-- 10.2 фильтр только по last_name
explain analyze
select *
from passengers
where last_name = 'Weber';


-- 10.3 то же с отключённым seq scan, чтобы сравнить именно работу индекса
set enable_seqscan = off;

explain analyze
select *
from passengers
where first_name = 'Dana'
  and last_name  = 'Weber';

explain analyze
select *
from passengers
where last_name = 'Weber';

reset enable_seqscan;


