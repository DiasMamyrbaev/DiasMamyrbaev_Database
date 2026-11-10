-- 4. Evaluate the difference in query performance with and without indexes.
-- Measure performance differences.

-- 4.0 тестовой таблицa
select setseed(0.42);

create table flights_perf as
select
    n as flight_id,
    1 + floor(random() * 100)::int as departing_airport_id,
    1 + floor(random() * 100)::int as arriving_airport_id,
    1 + floor(random() * 6)::int as airline_id,
    s as sch_departure_time,
    s + floor(random() * 30)::int * interval '1 minute' as act_departure_time,
    case
        when n % 10 = 0 then null
        else s + interval '3 hours' + floor(random() * 40)::int * interval '1 minute'
    end                                                          as act_arrival_time
from (
    select n, timestamp '2025-01-01' + n * interval '1 minute' as s
    from generate_series(1, 500000) as n
) t;

analyze flights_perf;


-- 4.1 Без индексов

explain analyze
select *
from flights_perf
where departing_airport_id = 10 and arriving_airport_id = 20;

explain analyze
select *
from flights_perf
where act_departure_time >= timestamp '2025-03-01 00:00' and act_departure_time <  timestamp '2025-03-02 00:00';



-- 4.2 создаём индексы

create index idx_perf_act_departure on flights_perf (act_departure_time);

create index idx_perf_dep_arr_airport on flights_perf (departing_airport_id, arriving_airport_id);

analyze flights_perf;


-- 4.3 С индексами
explain analyze
select *
from flights_perf
where departing_airport_id = 10 and arriving_airport_id = 20;

explain analyze
select *
from flights_perf
where act_departure_time >= timestamp '2025-03-01 00:00' and act_departure_time <  timestamp '2025-03-02 00:00';



-- 4.4 размер таблицы и индексов

select
    pg_size_pretty(pg_relation_size('flights_perf')) as table_size,
    pg_size_pretty(pg_relation_size('idx_perf_act_departure'))  as idx_act_departure_size,
    pg_size_pretty(pg_relation_size('idx_perf_dep_arr_airport')) as idx_dep_arr_size;



