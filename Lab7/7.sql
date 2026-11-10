/* 7. Create an index for the Passengers table. Use for that first name, last name, date
of birth, and country of citizenship. Then, write a SQL query to find a passenger
who was born in Philippines and was born in 1984 and check if the query uses
indexes or not. Give an explanation of the results. */

-- составной индекс по четырём колонкам
create index idx_passengers_search
    on passengers (first_name, last_name, date_of_birth, country_of_citizenship);

analyze passengers;

-- 7.1 родился в philippines в 1984
explain analyze
select *
from passengers
where country_of_citizenship = 'Philippines'
  and date_of_birth >= date '1984-01-01'
  and date_of_birth <  date '1985-01-01';

-- 7.2 то же с отключённым seq scan
set enable_seqscan = off;

explain analyze
select *
from passengers
where country_of_citizenship = 'Philippines'
  and date_of_birth >= date '1984-01-01'
  and date_of_birth <  date '1985-01-01';

reset enable_seqscan;

-- 7.3 индекс с правильным порядком колонок
create index idx_passengers_country_dob
    on passengers (country_of_citizenship, date_of_birth);

analyze passengers;

set enable_seqscan = off;

explain analyze
select *
from passengers
where country_of_citizenship = 'Philippines'
  and date_of_birth >= date '1984-01-01'
  and date_of_birth <  date '1985-01-01';

reset enable_seqscan;


