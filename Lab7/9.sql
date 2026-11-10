-- 9. Create an index on the actual_arrival column that includes only flights where
-- actual_arrival IS NOT NULL. Write an SQL query to find all flights with an
-- actual arrival time.

create index idx_flights_act_arrival_not_null
    on flights (act_arrival_time)
    where act_arrival_time is not null;

-- все рейсы с факт временем прибытия
select
    flight_id,
    sch_arrival_time,
    act_arrival_time
from flights
where act_arrival_time is not null
order by act_arrival_time;

-- проверка плана
explain analyze
select flight_id, act_arrival_time
from flights
where act_arrival_time is not null
order by act_arrival_time;

-- на большой таблице flights_perf
create index idx_perf_act_arrival_not_null
    on flights_perf (act_arrival_time)
    where act_arrival_time is not null;

analyze flights_perf;

explain analyze
select flight_id, act_arrival_time
from flights_perf
where act_arrival_time is not null
  and act_arrival_time >= timestamp '2025-02-01 00:00'
  and act_arrival_time <  timestamp '2025-02-02 00:00';

-- размер partial index
select
    pg_size_pretty(pg_relation_size('idx_perf_act_arrival_not_null')) as partial_index_size,
    pg_size_pretty(pg_relation_size('idx_perf_act_departure')) as full_index_size;


