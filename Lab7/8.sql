-- 8. Write a SQL query to list indexes for table Passengers. After, delete the created
-- indexes.

-- 8.1 список индексов
select indexname, indexdef
from pg_indexes
where tablename = 'passengers'
order by indexname;

-- 8.2 удаляем индексы, from task 6,7
drop index if exists idx_passengers_country_dob;
drop index if exists idx_passengers_search;
drop index if exists idx_passengers_passport;

-- 8.3 check
select indexname, indexdef
from pg_indexes
where tablename = 'passengers'
order by indexname;


