-- 1. Create an index on the actual_departure column in the flights table.

create index idx_flights_act_departure on flights (act_departure_time);

